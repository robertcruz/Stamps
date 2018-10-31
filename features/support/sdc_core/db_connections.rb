module SdcCore
  class MySqlConnDecorator < BasicObject
    #require 'mysql2'

    attr_reader :host, :username, :password

    def initialize(host: nil, username: nil, password: nil)
      @connection = ::Mysql2::Client.new(host: host, username: username, password: password)
    end

    def respond_to_missing?(name, include_private = false)
      @connection.respond_to?(name, include_private) || super
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

  class UserCredentialsConn < BasicObject
    def initialize
      host = data_for(:database, {})['mysql']['host']
      username = data_for(:database, {})['mysql']['username']
      password = data_for(:database, {})['mysql']['password']
      @connection = MySqlConnDecorator.new(host: host, username: username, password: password)
      @connection.automatic_close = true
      @connection.select_db('stamps')
    end

    def respond_to_missing?(name, include_private = false)
      @connection.respond_to?(name, include_private) || super
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

  class SQLServerClient
    #require 'tiny_tds'

    attr_reader :host, :database, :username, :password, :port, :azure, :connection

    def initialize(username: nil, password: nil, server: nil, port: nil, database: nil, azure: nil)
      @connection = TinyTds::Client.new( username: username, password: password, host: server, port: port, database: database, azure: azure)
    end

    def respond_to_missing?(name, include_private = false)
      @connection.respond_to?(name, include_private) || super
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

  class PartnerPortalDB < BasicObject
    def initialize
      dev_env = data_for(:web_dev_env, {})['dev']
      if dev_env.include?(::TestSession.env.url.to_s)
        env = 'dev'
      else
        env = ::TestSession.env.url.to_s
      end
      server = data_for(:sql_server_pp, {})[env]['server']
      database = data_for(:sql_server_pp, {})[env]['database']
      port = data_for(:sql_server_pp, {})[env]['port']
      username = data_for(:sql_server_pp, {})[env]['username']
      password = data_for(:sql_server_pp, {})[env]['password']
      azure = data_for(:sql_server_pp, {})[env]['azure']
      @connection = SQLServerClient.new(server: server, database: database, username: username, password: password, port: port, azure:azure)
    end

    def respond_to_missing?(name, include_private = false)
      @connection.respond_to?(name, include_private) || super
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

  class SdcWebsiteDB < BasicObject
    def initialize
      dev_env = data_for(:web_dev_env, {})['dev']
      if dev_env.include?(::TestSession.env.url.to_s)
        env = 'dev'
      else
        env = ::TestSession.env.url.to_s
      end
      server = data_for(:sql_server_sdcwebsite, {})[env]['server']
      database = data_for(:sql_server_sdcwebsite, {})[env]['database']
      port = data_for(:sql_server_sdcwebsite, {})[env]['port']
      username = data_for(:sql_server_sdcwebsite, {})[env]['username']
      password = data_for(:sql_server_sdcwebsite, {})[env]['password']
      azure = data_for(:sql_server_sdcwebsite, {})[env]['azure']
      @connection = SQLServerClient.new(server: server, database: database, username: username, password: password, port: port, azure:azure)
    end

    def respond_to_missing?(name, include_private = false)
      @connection.respond_to?(name, include_private) || super
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

  class VBridgeDB < BasicObject
    def initialize
      dev_env = data_for(:web_dev_env, {})['dev']
      if dev_env.include?(::TestSession.env.url.to_s)
        env = 'dev'
      else
        env = ::TestSession.env.url.to_s
      end
      server = data_for(:sql_server_vbridge, {})[env]['server']
      database = data_for(:sql_server_vbridge, {})[env]['database']
      port = data_for(:sql_server_vbridge, {})[env]['port']
      username = data_for(:sql_server_vbridge, {})[env]['username']
      password = data_for(:sql_server_vbridge, {})[env]['password']
      azure = data_for(:sql_server_vbridge, {})[env]['azure']
      @connection = SQLServerClient.new(server: server, database: database, username: username, password: password, port: port, azure:azure)
    end

    def respond_to_missing?(name, include_private = false)
      @connection.respond_to?(name, include_private) || super
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

  class StampMartDB < BasicObject
    def initialize
      dev_env = data_for(:web_dev_env, {})['dev']
      if dev_env.include?(::TestSession.env.url.to_s)
        env = 'dev'
      else
        env = ::TestSession.env.url.to_s
      end
      server = data_for(:sql_server_stampmart, {})[env]['server']
      database = data_for(:sql_server_stampmart, {})[env]['database']
      port = data_for(:sql_server_stampmart, {})[env]['port']
      username = data_for(:sql_server_stampmart, {})[env]['username']
      password = data_for(:sql_server_stampmart, {})[env]['password']
      azure = data_for(:sql_server_stampmart, {})[env]['azure']
      @connection = SQLServerClient.new(server: server, database: database, username: username, password: password, port: port, azure:azure)
    end

    def respond_to_missing?(name, include_private = false)
      @connection.respond_to?(name, include_private) || super
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

end


