module Stamps
  class StampsUserCredentials
    attr_accessor :scenario_name, :cuke_tag
    attr_reader :db_connection, :user_credentials
    def initialize(db_connection)
      @db_connection = db_connection
      @user_credentials = Hash.new
    end

    def fetch(cuke_tag)
      @cuke_tag = cuke_tag
      # reset old usernames
      result = db_connection.query("select * from user_credentials where in_use=1 and date_add(in_use_time, INTERVAL 2 HOUR) < (CURTIME())")
      if result.size > 0
        result.each do |row|
          db_connection.prepare("UPDATE user_credentials SET user_credentials.in_use=0 where username=?").execute(row['username'])
        end
      end

      case(@cuke_tag)
        when /purchasing/
          random_credentials('purchasing')
        when /comm_plus/
          random_credentials('comm_plus')
        else
          random_credentials('all')
      end
    end

    def random_credentials(test_tag)
      result = db_connection.query("select * from user_credentials where test_env='#{modal_param.test_env}' and user_status='Active' and test_tag='#{test_tag}' and in_use=0")
      expect(result.size).to be > 0, "No user found in MySQL DB for test tag #{cuke_tag} (#{scenario_name}) in #{modal_param.test_env.upcase}. Try again later or add more users to the database."
      rand_num = rand(result.size)
      result.each_with_index do |row, index|
        if rand_num==index
          user_credentials[:username] = row['username']
          user_credentials[:password] = row['password']
        end
      end
      db_connection.prepare("UPDATE user_credentials SET user_credentials.in_use=1, user_credentials.in_use_time=CURTIME(), user_credentials.in_use_date=CURDATE() where username=?").execute(user_credentials[:username])
      user_credentials
    end

    def all_user_credentials
      results = db_connection.query("select * from user_credentials where test_env='#{modal_param.test_env}' and user_status='Active'")
      credentials = Array.new(results.size){Hash.new}
      results.each_with_index do |row, index| credentials[index] = {:username => row['username'], :password => row['password']} end
      credentials
    end

    def close
      db_connection.prepare("UPDATE user_credentials SET user_credentials.in_use = 0 where username = ?").execute(user_credentials[:username])
      db_connection.close
    end
  end
end