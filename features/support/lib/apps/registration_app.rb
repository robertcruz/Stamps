
module RegistrationApp
  def registration
    @registration ||= Stamps::Registration::WebRegistration.new(param)
  end

  def registration=registration
    @registration ||= registration
  end

  def sdc_website
    @sdc_website ||= Stamps::Registration::SdcWebsite.new(param)
  end

  def pam
    @pam ||= Pam::PaymentAdministratorManager.new(param)
  end

  def registration_user_parameter_file(*args)
    begin
      if helper.to_bool(ENV['JENKINS'])
        filename = "#{data_for(:registration, {})['registration_param_dir']}\\#{ENV['URL']}_#{(args.length==0)?"Registration":"#{args[0]}"}.yml"
      else
        filename = "#{data_for(:registration, {})['dev_usr_dir']}\\#{ENV['URL']}_#{(args.length==0)?"Registration":"#{args[0]}"}.yml"
      end
      config.logger.message "Registration parameter file: #{filename}"
      filename
    rescue Exception => e
      p e.message
      p e.backtrace.join("\n")
      expect("MagicData: Problem retrieving data from default.yml. Check your format?").to eql e.message
    end
  end

  def registration_data_store_filename(*args)
    begin
      "#{data_for(:registration, {})['registration_data_store_dir']}\\#{ENV['URL']}_#{(args.length==0)?"Registration":"#{args[0]}"}.txt"
    rescue Exception => e
      p e.message
      p e.backtrace.join("\n")
      expect("MagicData: Problem retrieving data. Check your format?").to eql e.message
    end
  end
end