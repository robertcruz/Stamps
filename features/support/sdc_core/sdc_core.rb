
module SdcEnv
  TEST_ENVIRONMENTS = %i[stg qacc cc qasc sc rating].freeze unless Object.const_defined?('SdcEnv::TEST_ENVIRONMENTS')
  BROWSERS = %i[ff firefox gc chrome safari edge chromeb ie iexplorer].freeze unless Object.const_defined?('SdcEnv::BROWSERS')
  BROWSER_MOBILE_EMULATORS = ['iPhone X', 'iPhone 4', 'Pixel 2', 'Pixel 2 XL', 'iPad'].freeze unless Object.const_defined?('SdcEnv::BROWSER_MOBILE_EMULATORS')
  HEALTH_CHECK_APPS = ['address book', 'orders', 'or reports', 'postage tools'].freeze unless Object.const_defined?('SdcEnv::HEALTH_CHECK_APPS')
  IOS = %i[iphone6 iphone7 iphone8 iphonex].freeze unless Object.const_defined?('SdcEnv::IOS')
  ANDROID = %i[samsung_galaxy nexus_5x].freeze unless Object.const_defined?('SdcEnv::ANDROID')

  class << self
    attr_accessor :sdc_app, :env, :health_check, :usr, :pw, :url, :debug,
                  :printer, :browser, :hostname, :mobile, :scenario,
                  :sauce_device, :test_name, :driver_log_level,
                  :browser_mobile_emulator, :android, :ios, :firefox_profile,
                  :new_framework, :web_dev, :jenkins, :sauce,
                  :width, :height
  end
end

module SdcGlobal
  class << self
    attr_accessor :web_app, :scenario, :web_dev_device
  end
end

class SdcModel
  class << self
    def keys
      @keys ||= []
    end

    def key(name, &block)
      keys << name unless keys.include? name

      define_method(name) do |*args|
        instance_exec(*args, &block)
      end
    end
  end
end

##
# Variable Description
# SELENIUM_HOST  The hostname of the Selenium server
# SELENIUM_PORT  The port of the Selenium server
# SELENIUM_PLATFORM  The operating system of the selected browser
# SELENIUM_VERSION  The version number of the selected browser
# SELENIUM_BROWSER  The name of the selected browser
# SELENIUM_DRIVER  Contains the operating system, version and browser name of the selected browser
# SELENIUM_URL  The initial URL to load when the test begins
# SAUCE_USERNAME  The user name used to invoke Sauce OnDemand
# SAUCE_ACCESS_KEY  The access key for the user used to invoke Sauce OnDemand
# SELENIUM_STARTING_URL  The value of the Starting URL field
# SAUCE_ONDEMAND_BROWSERS  A JSON-formatted string representing browsers you selected for the job configuration
##
# JOB_NAME  Name of the project of this build, such as "foo" or "foo/bar".
# JOB_BASE_NAME  Short Name of the project of this build stripping off folder paths, such as "foo" for "bar/foo".
# BUILD_TAG  String of "jenkins-${JOB_NAME}-${BUILD_NUMBER}". All forward slashes
#           ("/") in the JOB_NAME are replaced with dashes ("-"). Convenient to put
#           into a resource file, a jar file, etc for easier identification.
# BUILD_NUMBER  The current build number, such as "153"
# NODE_NAME Name of the agent if the build is on an agent, or "master" if run on master
# BUILD_URL Full URL of this build, like http://server:port/jenkins/job/foo/15/
#
module TestSession
  class SdcEnvVars < ::SdcModel
    # Jenkins settings
    key(:job_name) { ENV['JOB_NAME'] }
    key(:job_base_name) { ENV['JOB_BASE_NAME'] }
    key(:build_tag) { ENV['BUILD_TAG'] }
    key(:build_number) { ENV['BUILD_NUMBER'] }
    key(:node_name) { ENV['NODE_NAME'] }
    key(:build_url) { ENV['BUILD_URL'] }
    # cloud settings
    key(:tunnel_identifier) { ENV['TUNNEL_IDENTIFIER'] }
    key(:sauce_username) { ENV['SAUCE_USERNAME'] || 'robcruz' }
    key(:sauce_access_key) { ENV['SAUCE_ACCESS_KEY'] || '0e60dbc9-5bbf-425a-988b-f81c42d6b7ef' }
    key(:selenium_host) { ENV['SELENIUM_HOST'] || 'ondemand.saucelabs.com' }
    key(:selenium_port) { ENV['SELENIUM_PORT'] || '443' }
    key(:selenium_platform) { ENV['SELENIUM_PLATFORM'] }
    key(:selenium_version) { ENV['SELENIUM_VERSION'] }
    key(:selenium_browser) do
      if ENV['SELENIUM_BROWSER']
        if ENV['SELENIUM_BROWSER'].eql?('MicrosoftEdge')
          ENV['SELENIUM_BROWSER'] = 'edge'
        elsif ENV['SELENIUM_BROWSER'].eql?('internet explorer')
          ENV['SELENIUM_BROWSER'] = 'internet_explorer'
        else
          ENV['SELENIUM_BROWSER']
        end
      end
    end
    key(:selenium_driver) { ENV['SELENIUM_DRIVER'] }
    key(:sauce_build_name) { ENV['SAUCE_BUILD_NAME'] }
    key(:selenium_url) { ENV['SELENIUM_URL'] }
    key(:selenium_starting_url) { ENV['SELENIUM_STARTING_URL'] }
    key(:sauce_on_demand_browsers) { ENV['SAUCE_ONDEMAND_BROWSERS'] }
    key(:screen_resolution) { ENV['SCREEN_RESOLUTION'] || '1280x1024' }
    key(:extendedDebugging) { ENV['EXTENDED_DEBUGGING'] || true }
    key(:idle_timeout) { ENV['IDLE_TIMEOUT'] || 120 }
    key(:appium_wait) { ENV['APPIUM_WAIT'] || 300 }
    key(:sauce_end_point) { "https://#{sauce_username}:#{sauce_access_key}@#{selenium_host}:#{selenium_port}/wd/hub" }
    # cloud mobile
    key(:selenium_device) { ENV['SELENIUM_DEVICE'] }
    key(:device_orientation) { ENV['SELENIUM_DEVICE_ORIENTATION'] || 'portrait'}
    key(:automation_name) { ENV['AUTOMATION_NAME'] || 'XCUITest' }
    key(:appium_version) { ENV['APPIUM_VERSION'] || '1.8.1' }
    # test helper
    key(:sauce_browser) do
      oss = ['Windows', 'windows', 'Mac', 'mac', 'macOS', 'OS X', 'OS']
      if selenium_platform
        oss.include?(selenium_platform.split(' ').first)
      end
    end
    key(:local_browser) { ENV['BROWSER'].to_sym if ENV['BROWSER'] }
    key(:browser_test) { sauce_browser || local_browser }
    key(:ios_test) do
      if selenium_platform
        ['iOS', 'ios'].include? selenium_platform.split(' ').first
      end
    end
    key(:android_test) do
      if selenium_platform
        ['android'].include? selenium_platform.split(' ').first
      end
    end
    key(:mobile_device) { ios_test || android_test }
    # test settings
    key(:test_log_level) do
      ENV['LOG_LEVEL'].to_sym if ENV['LOG_LEVEL']
    end
    key(:selenium_log_level) do
      ENV['SELENIUM_LOG_LEVEL'].to_sym if ENV['SELENIUM_LOG_LEVEL']
    end
    key(:window_size) { ENV['WINDOW_SIZE'] }
    key(:web_dev) { ENV['WEB_DEV'] }
    key(:firefox_profile) { ENV['FIREFOX_PROFILE'] }
    key(:pw) { ENV['PW'] }
    key(:usr) { ENV['USR'] }
    key(:healthcheck) do
      (ENV['HEALTHCHECK'].casecmp('true') if ENV['HEALTHCHECK'])
    end
    key(:printer) { ENV['PRINTER'] }
    key(:web_app) { ENV['WEB_APP'].downcase.to_sym unless ENV['WEB_APP'].nil? }
    key(:url) do
      if ENV['URL']
        case ENV['URL'].downcase
        when /stg/
          :stg
        when /cc/
          :qacc
        when /sc/
          :qasc
        when /rat/
          :rating
        when /prod/
          :prod
        else
          ENV['URL'].downcase.to_sym
        end
      end
    end

    def test_name
      job_name || "#{SdcGlobal.scenario.feature.name} - #{SdcGlobal.scenario.name}"
    end

    def build
      build_tag || Socket.gethostname
    end

    def session_info(session_id)
      "SauceOnDemandSessionID=#{session_id} job-name=#{test_name}"
    end

    def responsive
      mobile_device || SdcPage.browser.window.size.width < 1195
    end
  end

  class << self
    def env
      @env ||= SdcEnvVars.new
    end

    # name: env.test_name,
    #     appiumVersion: '1.8.1',
    #     deviceName: env.device,
    #     deviceOrientation: env.device_orientation,
    #     platformVersion: '11.2', #env.version,
    #     platformName: 'iOS',
    #     browserName: 'Safari',
    #     automationName: 'XCUITest'
    def mobile_device
      desired_caps = {
          caps: {
              :name => env.test_name,
              :appiumVersion => env.appium_version,
              :deviceName => env.selenium_device,
              :deviceOrientation => env.device_orientation,
              :platformVersion => env.selenium_version,
              :platformName => env.selenium_platform,
              :browserName => env.selenium_browser,
              :automationName => env.automation_name,
              :extendedDebugging => env.extendedDebugging,
              :tunnelIdentifier => env.tunnel_identifier,
              :idleTimeout => env.idle_timeout
          },
          appium_lib: {
              :sauce_username => env.sauce_username,
              :sauce_access_key => env.sauce_access_key,
              :wait => env.appium_wait
          }
      }

      @driver = Appium::Driver.new(desired_caps, false).start_driver
    rescue StandardError => e
      SdcLogger.error e.message
      SdcLogger.error e.backtrace.join("\n")
      raise e
    end

    def sauce_browser
      desired_caps = {
          :name => env.test_name,
          :version => env.selenium_version,
          :platform => env.selenium_platform,
          :build => env.build,
          :screenResolution => env.screen_resolution,
          :extendedDebugging => env.extendedDebugging,
          :tunnelIdentifier => env.tunnel_identifier,
          :idleTimeout => env.idle_timeout
      }
      error_msg = 'SELENIUM_BROWSER is nil'
      raise ArgumentError, error_msg unless env.selenium_browser
      caps = Selenium::WebDriver::Remote::Capabilities.send(env.selenium_browser, desired_caps)
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = env.idle_timeout
      url = env.sauce_end_point
      @driver = Watir::Browser.new(:remote, desired_capabilities: caps, http_client: client, url: url)
    rescue StandardError => e
      SdcLogger.error e.message
      SdcLogger.error e.backtrace.join("\n")
      raise e
    end

    def local_browser

      chrome_switches = %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)
      # Watir.always_locate = true
      case(env.local_browser)

      when :edge
        kill('taskkill /im MicrosoftEdge.exe /f')

        @driver = SdcDriverDecorator.new(Watir::Browser.new(:edge, accept_insecure_certs: true))

      when :ff, :firefox
        kill('taskkill /im firefox.exe /f')
        if TestSession.env.firefox_profile
          profile = Selenium::WebDriver::Firefox::ProfilePage.from_name(env.firefox_profile)
          profile.assume_untrusted_certificate_issuer = true
          profile['network.http.phishy-userpass-length'] = 255
          @driver = SdcDriverDecorator.new(Watir::Browser.new(:firefox, profile: profile, accept_insecure_certs: true))
          @driver.driver.manage.timeouts.page_load = 60
        else
          @driver = SdcDriverDecorator.new(Watir::Browser.new(:firefox, accept_insecure_certs: true))
        end

      when :gc, :chrome
        kill('taskkill /im chrome.exe /f')
        @driver = SdcDriverDecorator.new(Watir::Browser.new(:chrome, switches: chrome_switches))

      when :ff_web_dev
        kill('taskkill /im firefox.exe /f')
        download_directory = "#{Dir.getwd}/download"
        download_directory.tr!('/', '\\') if Selenium::WebDriver::Platform.windows?
        profile = Selenium::WebDriver::Firefox::Profile.new
        profile['browser.download.folderList'] = 2 # custom location
        profile['browser.download.dir'] = download_directory
        profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv,application/pdf,image/png,application/x-zip-compressed,text/plain'
        @driver = SdcDriverDecorator.new(Watir::Browser.new(:firefox, profile: profile, accept_insecure_certs: true))
        Dir.mkdir("#{Dir.getwd}/download") unless Dir.exist?("#{Dir.getwd}/download")

      when :gc_web_dev
        prefs = {
            download: {
                prompt_for_download: false,
                default_directory: "#{Dir.getwd}/download"
            }
        }
        kill('taskkill /im chrome.exe /f')
        @driver = SdcDriverDecorator.new(Watir::Browser.new(:chrome, options: { prefs: prefs }, switches: chrome_switches))
        Dir.mkdir("#{Dir.getwd}/download") unless Dir.exist?("#{Dir.getwd}/download")
        @driver.driver.manage.timeouts.page_load = 60

      when :gc_iPhone_X, :gc_iPhone_4, :gc_iPad, :gc_Pixel_2_XL, :gc_Pixel_2
        kill('taskkill /im chrome.exe /f')
        device_name = env.local_browser.to_s.gsub('gc', '').gsub('_', ' ').strip
        driver = SdcTest.browser_emulator_options(device_name)
        SdcGlobal.web_dev_device = device_name unless device_name.include? 'iPad'
        @driver = SdcDriverDecorator.new(Watir::Browser.new(driver, switches: chrome_switches))
        @driver.driver.manage.timeouts.page_load = 60

        Dir.mkdir("#{Dir.getwd}/download") unless Dir.exist?("#{Dir.getwd}/download/")

        @driver.driver.manage.timeouts.page_load = 60

      when :chromeb
        kill('taskkill /im chrome.exe /f')
        Selenium::WebDriver::Chrome.path = data_for(:setup, {})['windows']['chromedriverbeta']
        @driver = SdcDriverDecorator.new(Watir::Browser.new(:chrome, switches: chrome_switches))

        @driver.driver.manage.timeouts.page_load = 60

      when :ie
        kill('taskkill /im iexplore.exe /f')
        @driver = SdcDriverDecorator.new(Watir::Browser.new(:ie))

      when :safari
        kill("killall 'Safari Technology Preview'")
        @driver = SdcDriverDecorator.new(Watir::Browser.new(:safari, technology_preview: true))

      else
        raise ArgumentError, "Invalid browser selection. #{env.local_browser}"
      end

      if env.window_size
        width, height = env.window_size.downcase.split("x")
        begin
          @driver.window.resize_to(width, height)
          @driver.window.move_to(0, 0)
        rescue Exception
          #ignore
        end
      else
        begin
          @driver.window.maximize
        rescue
          #ignore
        end
      end

      @driver

    rescue StandardError => e
      SdcLogger.error e.message
      SdcLogger.error e.backtrace.join("\n")
      raise e, 'Browser driver failed to start'
    end

    def kill(str)
      stdout, stdeerr, status = Open3.capture3(str)
    rescue
      # ignore
    end
  end

end

module SdcFinder

  class << self
    # @param [Browser] browser either Watir::Browser or Appium::Core::Driver
    # @param [String]  HTML tag
    # @param [Integer] timeout in seconds
    def element(browser, tag: nil, timeout: 60)
      if browser.is_a? Watir::Browser
        if tag
          element = instance_eval("browser.#{tag}(#{yield})", __FILE__, __LINE__)
          result = Watir::Wait.until(timeout: timeout) { element }
          if result
            element = instance_eval("browser.#{tag}(#{yield})", __FILE__, __LINE__)
            return SdcElement.new(element)
          end
        else
          element = browser.element(yield)
          result = Watir::Wait.until(timeout: timeout) { element }
          if result
            element = browser.element(yield)
            return SdcElement.new(element)
          end
        end
      else
        element = browser.find_element(yield)
        result = Watir::Wait.until(timeout: timeout) { element }
        if result
          element = browser.find_element(yield)
          return SdcElement.new(element)
        end
      end

      message = "Cannot locate element #{yield}"
      error = Selenium::WebDriver::Error::NoSuchElementError
      raise error, message
    end

    def elements(browser, tag: nil, timeout: 60)
      if browser.is_a? Watir::Browser
        if tag
          begin
            code = "browser.#{tag}(#{yield})"
            elements = instance_eval(code, __FILE__, __LINE__)
            result = Watir::Wait.until(timeout: timeout) { elements }
            return instance_eval(code, __FILE__, __LINE__) if result
          rescue Selenium::WebDriver::Error::TimeOutError
            # ignore
          end
        else
          elements = browser.elements(yield)
          result = Watir::Wait.until(timeout: timeout) { elements }
          return browser.elements(yield) if result
        end
      else
        elements = browser.find_elements(yield)
        result = Watir::Wait.until(timeout: timeout) { elements }
        return browser.find_elements(yield) if result
      end

      message = "Cannot locate elements #{yield}"
      error = Selenium::WebDriver::Error::NoSuchElementError
      raise error, message
    end
  end

end

class SdcPage < WatirDrops::PageObject

  class << self
    def visit(*args)
      new.tap do |page|
        if TestSession.env.mobile_device
          url = page.page_url(args[0])
          page.get(url)
        else
          page.goto(*args)
        end
        exception = Selenium::WebDriver::Error::WebDriverError
        message = "Expected to be on #{page.class}, but conditions not met"
        if page.page_verifiable?
          begin
            page.wait_until(&:on_page?)
          rescue Watir::Wait::TimeoutError
            raise exception, message
          end
        end
      end
    end

    def get(*args)
      browser.get page_url(*args)
    end

    def page_object(name, tag: nil, required: false, timeout: 60, &block)
      element(name.to_sym, required: required) do
        browser = self.class.browser
        SdcFinder.element(browser, tag: tag, timeout: timeout, &block)
      end
    end
    alias text_field page_object
    alias button page_object
    alias label page_object
    alias link page_object

    def page_objects(name, tag: nil, index: nil, required: false, timeout: 60)
      list_name = index.nil? ? name : "#{name}s".to_sym

      elements(list_name) do
        browser = self.class.browser
        SdcFinder.elements(browser, tag: tag, timeout: timeout) { yield }
      end

      if index
        element(name, required: required) do
          element = instance_eval(list_name.to_s, __FILE__, __LINE__)[index]
          SdcElement.new(element)
        end
      end
    end

    def chooser(name, chooser, verify, property, property_name)
      element(name.to_sym) do
        SdcChooser.new(instance_eval(chooser.to_s, __FILE__, __LINE__),
                       instance_eval(verify.to_s, __FILE__, __LINE__),
                       property, property_name)
      end
    end

    def po_with_verify(name, verify, property: nil)
      element(name.to_sym) do
        ElementWithVerify.new(instance_eval(element.to_s, __FILE__, __LINE__),
                              instance_eval(verify.to_s, __FILE__, __LINE__),
                              property)
      end
    end

    def checker(name, element, verify, property: nil)
      element(name.to_sym) do
        ElementChecker(instance_eval(element.to_s, __FILE__, __LINE__),
                       instance_eval(verify.to_s, __FILE__, __LINE__),
                       property)
      end
    end

    def selector(name, element, verify, property: nil)
      element(name.to_sym) do
        ElementSelector(instance_eval(element.to_s, __FILE__, __LINE__),
                       instance_eval(verify.to_s, __FILE__, __LINE__),
                       property)
      end
    end

    def sdc_number(name, text_field, increment, decrement)
      element(name.to_sym) do
        SdcNumber.new(instance_eval(text_field.to_s, __FILE__, __LINE__),
                      instance_eval(increment.to_s, __FILE__, __LINE__),
                      instance_eval(decrement.to_s, __FILE__, __LINE__))
      end
    end

    def sdc_param(name)
      define_method(name) do |*args|
        yield(*args)
      end
    end
  end

  define_method :sdc_number do |*args|
    self.class.sdc_number(*args)

    instance_eval(args.first.to_s, __FILE__, __LINE__)
  end

  define_method :chooser do |*args|
    self.class.chooser(*args)

    instance_eval(args.first.to_s, __FILE__, __LINE__)
  end
  alias checkbox chooser
  alias radio chooser

  define_method :page_objects do |*args, &block|
    self.class.page_objects(*args, &block)

    instance_eval(args.first.to_s, __FILE__, __LINE__)
  end

  define_method :page_object do |*args, &block|
    self.class.page_object(*args, &block)

    instance_eval(args.first.to_s, __FILE__, __LINE__)
  end
  alias text_field page_object
  alias button page_object
  alias label page_object
  alias selection page_object
  alias link page_object

end

class SdcDriverDecorator < BasicObject

  def initialize(driver)
    @driver = driver
  end

  def goto(*args)
    return @driver.get(*args) if @driver.respond_to?(:get)
    @driver.goto(*args)
  end

  def respond_to_missing?(name, include_private = false)
    @driver.respond_to?(name, include_private) || super
  end

  def method_missing(method, *args, &block)
    super unless @driver.respond_to?(method)
    @driver.send(method, *args, &block)
  end

end

module SdcElementHelper
  include ::Watir::Waitable
  def present?
    return send(:displayed?) if respond_to?(:displayed?)
    send(:present?)
  end

  def enabled?
    begin
      return send(:enabled?)
    rescue ::StandardError
      # ignore
    end

    false
  end

  def visible?
    begin
      return send(:visible?)
    rescue ::StandardError
      # ignore
    end

    false
  end

  def safe_hover
    begin
      send(:focus)
      send(:hover)
    rescue
      # ignore
    end

    self
  end

  def set(*args)
    return send(:send_keys, *args) if is_a? ::Selenium::WebDriver::Element
    send(:set, *args)
  end

  def safe_set(*args)

    set(*args)
  rescue Watir::Exception::UnknownObjectException
    # ignore

  end

  def set_attribute(name, value)
    value.gsub!("\n", "\\n") if value.include? "\n"
    execute_script("return arguments[0].#{name.to_s}='#{value.to_s}'", @element)
  end

  def safe_send_keys(arg, iteration: 1)
    iteration.to_i.times do
      begin
        send(:send_keys, arg)
      rescue ::StandardError
        # ignore
      end
    end

    self
  end

  def send_keys_while_present(arg, iteration: 1, timeout: 2)
    iteration.to_i.times do
      begin
        break unless send(:present?)
        send(:send_keys, arg)
        wait_while_present(timeout: timeout)
      rescue ::StandardError
        # ignore
      end
    end
  end

  def safe_click(*modifiers, ctr: 1)
    ctr.to_i.times do
      begin
        send(:click, *modifiers)
      rescue ::StandardError
        # ignore
      end
    end

    self
  end

  def double_click
    begin
      @element.double_click
    rescue
      # ignore
    end
  end

  def safe_double_click(ctr: 1)
    ctr.to_i.times do
      begin
        send(:double_click) if present?
      rescue ::StandardError
        # ignore
      end
    end

    self
  end

  def wait_until_present(timeout: 60, message: nil, interval: nil)
    if respond_to? :wait_until_present
      send(:wait_until_present, timeout: timeout, interval: interval)
    else
      Appium::Core::Wait.until_true(timeout: timeout, message: message) { present? }
    end

    self
  end

  def wait_while_present(timeout: 60, message: nil, interval: nil)
    if respond_to? :wait_while_present
      send(:wait_while_present, timeout: timeout)
    else
      Appium::Core::Wait.until_true(timeout: timeout, message: message) { !present? }
    end

    self
  end

  def safe_wait_until_present(timeout: 60, message: nil, interval: nil)
    wait_until_present(timeout: timeout, interval: interval)
  rescue ::Watir::Wait::TimeoutError
    # ignore
  rescue ::Appium::Core::Wait::TimeoutError
    # ignore
  rescue ::Selenium::WebDriver::Error::TimeOutError
    # ignore
  rescue ::Selenium::WebDriver::Error::StaleElementReferenceError
    # ignored
  end

  def safe_wait_while_present(timeout: 60, message: nil, interval: nil)
    wait_while_present(timeout: timeout)
  rescue ::Watir::Wait::TimeoutError
    # ignore
  rescue ::Appium::Core::Wait::TimeoutError
    # ignore
  rescue ::Selenium::WebDriver::Error::TimeOutError
    # ignore
  rescue ::Selenium::WebDriver::Error::StaleElementReferenceError
    # ignore
  end

  def text_value
    begin
      text = send(:text)
      return text unless text.empty?
    rescue ::StandardError
      # ignore
    end

    begin
      value = send(:value)
      return value unless value.empty?
    rescue ::StandardError
      # ignore
    end

    ''
  end

  def click_while_present(*modifiers, ctr: 2)
    ctr.to_i.times do
      begin
        safe_click(*modifiers)
        safe_wait_while_present(1)
        break unless present?
      rescue ::StandardError
        # ignore
      end
    end
  end

  def scroll_into_view
    begin
      execute_script('arguments[0].scrollIntoView();', @element)
    rescue ::StandardError
      # ignore
    end

    self
  end

  def blur_out(ctr: 1)
    ctr.to_i.times do
      safe_click
      safe_double_click
    end

    self
  end

  def class_disabled?
    attribute_include?('class', 'disable')
  end

  def class_enabled?
    attribute_include?('class', 'enabled')
  end

  def class_checked?
    attribute_include?('class', 'checked')
  end

  def attribute_include?(property, value)
    result = if respond_to? :attribute_value
               send(:attribute_value, property).include?(value)
             else
               send(:attribute, property).include?(value)
             end

    return result if [true, false].include? result
    if result.casecmp('true').zero? || result.casecmp('false').zero?
      return result.casecmp('true').zero?
    end
    result.include?(value)
  end
end

class SdcElement < BasicObject
  include ::SdcElementHelper

  def initialize(element)
    @element = element
  end

  def respond_to_missing?(name, include_private = false)
    @element.respond_to?(name, include_private) || super
  end

  def method_missing(name, *args, &block)
    super unless @element.respond_to?(name)
    @element.send(name, *args, &block)
  end
end

class ElementWithVerify < SdcElement
  def initialize(element, verify_element, property: nil)
    super(element)
    @verify = verify_element
    @property = property
  end

  def property=(property)
    @property = property
  end

  def is_attribute?(sym)
    result = if @verify.respond_to? :attribute_value
               @verify.send(:attribute_value, @property)
             else
               @verify.send(:attribute, @property)
             end

    return result if [true, false].include? result

    if result.casecmp('true').zero? || result .casecmp('false').zero?
      return result.casecmp('true').zero?
    end
    result.include?(sym.to_s)
  end

  def checked?
    is_attribute?(:checked)
  end

  def selected?
    is_attribute?(:selected)
  end

  def enabled?
    is_attribute?(:enabled)
  end

  def disabled?
    is_attribute?(:selected)
  end
end

class ElementChecker < ElementWithVerify
  def initialize(element, verify_element, property: nil)
    super(element, verify_element, property)
  end

  def check(iter: 2)
    iter.times do
      @element.click
      break if checked?
    end

    checked?
  end

  def uncheck(iter: 2)
    iter.times do
      @element.click
      break unless checked?
    end

    checked?
  end
end

class ElementSelector < ElementWithVerify
  def initialize(element, verify_element, property: nil)
    super(element, verify_element, property)
  end

  def select(iter: 2)
    iter.times do
      @element.click
      break if selected?
    end

    selected?
  end


  def unselect(iter: 2)
    iter.times do
      @element.click
      break unless selected?
    end

    selected?
  end
end

class SdcChooser < BasicObject
  include ::SdcElementHelper

  def initialize(element, verify, property, value)
    @element = element
    @verify = verify
    @property = property.to_s
    @value = value.to_s
  end

  def chosen?
    result = if @verify.respond_to? :attribute_value
               @verify.send(:attribute_value, @property)
             else
               @verify.send(:attribute, @property)
             end

    return result if [true, false].include? result

    if result.casecmp('true').zero? || result .casecmp('false').zero?
      return result.casecmp('true').zero?
    end
    result.include?(@value)
  end

  alias checked? chosen?
  alias selected? chosen?

  def choose(iter: 1)
    iter.times do
      click
      break if chosen?
    end

    chosen?
  end

  alias check choose
  alias select choose

  def unchoose(iter: 3)
    iter.times do
      click
      break unless chosen?
    end

    chosen?
  end

  alias uncheck unchoose
  alias unselect unchoose

  def respond_to_missing?(name, include_private = false)
    @element.respond_to?(name, include_private) || super
  end

  def method_missing(name, *args, &block)
    super unless @element.respond_to? name
    @element.send(name, *args, &block)
  end
end

class SdcNumber < BasicObject
  include ::SdcElementHelper

  attr_reader :increment, :decrement

  def initialize(text_field, increment, decrement)
    @element = text_field
    @increment = increment
    @decrement = decrement
  end

  def text_field
    @element
  end

  def respond_to_missing?(name, include_private = false)
    @element.respond_to?(name, include_private) || super
  end

  def method_missing(name, *args, &block)
    super unless @element.respond_to?(name)
    @element.send(name, *args, &block)
  end
end

class SdcLogger
  class << self
    def logger
      unless @logger
        @logger = ::Logger.new(STDOUT)
        @logger.datetime_format = '%H:%M:%S'
        @logger.progname = 'Stamps.com'
        @logger.formatter = proc do |severity, datetime, progname, msg|
          "#{progname} :: #{msg}\n"
        end
      end
      @logger
    end

    def respond_to_missing?(name, include_private = false)
      logger.respond_to?(name, include_private) || super
    end

    def method_missing(method, *args)
      super unless logger.respond_to?(method)
      logger.send(method, *args)
    end
  end
end

class TestData
  class << self
    def hash
      @hash ||= {}
    end
  end
end

module SdcDriver
  class << self
    def browser=(browser)
      @@browser = browser
    end
    alias driver= browser=


    def browser
      @@browser
    end
    alias driver browser
  end
end

class SdcAppiumDriver

  attr_reader :device

  def initialize(device)
    @device = device
  end

  def core_driver
    @core_driver ||= initialize_driver
  end

  def respond_to_missing?(name, include_private = false)
    @core_driver.respond_to?(name, include_private)
  end

  def method_missing(name, *args, &block)
    super unless @core_driver.respond_to?(name)
    @core_driver.send(name, *args, &block)
  end

  private

  def initialize_driver
    file = ::File.expand_path("../../sdc_device_caps/#{device.to_s}.txt", __FILE__)
    exception = ::Selenium::WebDriver::Error::WebDriverError
    message = "Missing Appium capabilities file. #{device}: #{file}"
    raise(exception, message) unless ::File.exist? file

    caps = ::Appium.load_appium_txt(file: file, verbose: true)
    ::Appium::Driver.new(caps, false)
  end
end