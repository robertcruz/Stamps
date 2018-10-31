class SdcTest
  class << self

    def configure
      SdcLogger.debug "Initializing test driver...\n"

      if TestSession.env.mobile_device
        SdcPage.browser = TestSession.mobile_device
        print "\n"
        print "\n"
        print TestSession.env.session_info(SdcPage.browser.session_id)
        print "\n"
        print "\n"

      elsif TestSession.env.selenium_platform
        SdcPage.browser = TestSession.sauce_browser
        print "\n"
        print "\n"
        print TestSession.env.session_info(SdcPage.browser.driver.session_id)
        print "\n"
        print "\n"

      elsif TestSession.env.local_browser
        SdcPage.browser = TestSession.local_browser

      else
        error_msg = 'Cannot determine if this is a browser, iOS or Android test'
        raise ArgumentError, error_msg
      end

      SdcLogger.debug 'SdcTest.configure... done!'
    end

    def start
      SdcLogger.debug 'start... '
      require_gems

      begin
        SdcLogger.level = TestSession.env.test_log_level || :error
        Selenium::WebDriver.logger.level = TestSession.env.selenium_log_level || :error
        SdcLogger.progname = SdcGlobal.scenario.tags[0].name[1.. -1]

      rescue StandardError => e
        SdcLogger.error e.message
        SdcLogger.error e.backtrace.join("\n")
        raise e
      end
      SdcLogger.debug "\n"
      SdcLogger.debug "Begin test...\n"
      SdcLogger.debug "Feature: #{SdcGlobal.scenario.feature}"
      SdcLogger.debug "Scenario: #{SdcGlobal.scenario.name}"
      SdcLogger.debug '  Tags:'
      SdcGlobal.scenario.tags.each_with_index { |tag, index| SdcLogger.debug "  Tag #{index + 1}: #{tag.name}" }
      SdcLogger.debug '  Steps:'
      SdcGlobal.scenario.test_steps.each { |steps| SdcLogger.debug "  #{steps.source.last.keyword}#{steps.text}" }
      SdcLogger.debug "\n"
    end

    def require_gems
      require 'appium_lib'
      require 'appium_lib_core'

      if /rates/.match(SdcGlobal.scenario.tags[0].name)
        require 'spreadsheet'
        require "csv"
        include Spreadsheet
      end
    end

    def legacy_web_apps_param
      @web_apps_param
      @web_apps_param.driver = SdcPage.browser
      @web_apps_param
    end

    def teardown
      SdcLogger.debug "Tear down...\n"
      SdcPage.browser.quit
      SdcLogger.debug "Done.\n"

    rescue
      # ignore
    end

    def browser_emulator_options(device_name)
      prefs = {
          prompt_for_download: false,
          default_directory: "#{Dir.getwd}/download"
      }
          options = Selenium::WebDriver::Chrome::Options.new
          options.add_emulation(device_name: device_name)
          options.add_preference(:download, prefs)
          return Selenium::WebDriver.for(:chrome, options: options)
    end

    private
    def browser_selection(str)
      if str
        case str.downcase
        when /ff|firefox|mozilla/
          return :firefox
        when /chromeb|gcb|googleb/
          return :chromeb
        when /chrome|gc|google/
          return :chrome
        when /ms|me|microsoft|edge/
          return :edge
        when /apple|osx|safari|mac/
          return :safari
        else
          return str.downcase.to_sym
        end
      end
      str
    end

    def test_env(str)
      if str
        case(str.downcase)
        when /stg/
          return :stg
        when /cc/
          return :qacc
        when /sc/
          return :qasc
        when /rat/
          return :rating
        when /prod/
          return :prod
        else
          return str.downcase.to_sym
        end
      end
      str
    end

    def browser_version(str)
      /[\d.]+ Safari|Edge\/.+|Firefox\/.+|Chrome\/[\d\.]+/.match(str)
    end

    def os_version(str)
      /(Mac OS.+?[\d_]+|Windows.+?[\d\.]+)/.match(str)
    end
  end
end

