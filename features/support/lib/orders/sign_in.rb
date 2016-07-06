module Stamps
  module Orders
    module LandingPage
      class WelcomeModal < Browser::Modal
        private
        def okay_button
          browser.span text: 'OK'
        end

        public
        def present?
          okay_button.present?
        end

        def wait_until_present
          begin
            okay_button.wait_until_present
          rescue
            #ignore
          end
        end

        def ok
          5.times{
            browser_helper.safe_click okay_button
            break unless okay_button.present?
          }
        end
      end

      class OrdersWelcomeModal < Browser::Modal
        def present?
          (browser.span text: "Continue").present?
        end

        def close
          button = BrowserElement.new browser.img(css: 'img[class*=x-tool-close]')
          5.times do
            button.safe_click
            break unless button.present?
          end
        end

        def wait_until_present
          browser_helper.wait_until_present (browser.span text: "Continue")
        end

        def continue
          button = BrowserElement.new (browser.span text: "Continue")
          10.times{
            button.safe_click
            break unless button.present?
          }
        end
      end

      class SignInPage < Browser::Modal
        def username
          BrowserTextBox.new browser.text_field Orders::Locators::SignIn::username
        end

        def password
          BrowserTextBox.new browser.text_field Orders::Locators::SignIn::password
        end

        def sign_in_button
          button = browser.button Orders::Locators::SignIn::sign_in
          input = browser.input Orders::Locators::SignIn::sign_in
          BrowserElement.new (button.present?)?button:input
        end

        def remember_my_username
          stop_test "Not yet implemented."
        end

        def first_time_sign_in usr, pw
          username_textbox = self.username
          password_textbox = self.password
          button = self.sign_in_button

          grid = Orders::Grid::OrdersGrid.new param
          welcome_orders_page = OrdersWelcomeModal.new param
          market_place = Orders::Stores::MarketPlace.new param

          30.times do
            username_textbox.wait_until_present
            username_textbox.set_until usr
            password_textbox.set pw
            button.safe_send_keys :enter
            button.safe_send_keys :enter
            button.safe_click
            button.safe_click

            welcome_orders_page.wait_until_present
            welcome_orders_page.close if welcome_orders_page.present?
            welcome_orders_page.continue if welcome_orders_page.present?

            #market_place.wait_until_present
            market_place.close if market_place.present?
            break if grid.present?
          end
        end

        def sign_in *args
          username_textbox = self.username
          password_textbox = self.password
          button = self.sign_in_button

          grid = Orders::Grid::OrdersGrid.new param
          navbar = Orders::Navigation::NavigationBar.new param
          welcome_orders_page = OrdersWelcomeModal.new param
          plugin_issue = ErrorStampsPluginIssue.new param
          toolbar = Orders::Toolbar::Toolbar.new param
          market_place = Orders::Stores::MarketPlace.new param

          raise "Orders Sign-in page is not loaded!" unless browser.url.include? "Orders"

          case args.length
            when 1
              if args[0] == :default
                username = ENV["USR"]
                password = ENV["PW"]
              else
                raise "Invalid parameter. Usage: sign_in :default or sign_in username,password"
              end
            when 2
              username = args[0]
              password = args[1]
            else
              raise "Invalid parameter. Usage: sign_in :default or sign_in username,password"
          end

          raise "Username or Password is not set. Check your cucumber.yml file or Jenkins job." if username.nil? || password.nil?


          3.times do
            begin
              break if grid.present?
              username_textbox.wait_until_present
              username_textbox.set username
              password_textbox.set password
              button.safe_send_keys :enter
              button.safe_click
              button.safe_click
              sleep 1
              break if grid.present?
              break if grid.present?
              break if grid.present?
              break if grid.present?
              break if grid.present?
              button.safe_send_keys :enter
              sleep 1
              break if grid.present?
              break if grid.present?
              button.safe_click
              break if grid.present?
              break if grid.present?
              username_textbox.set username
              break if grid.present?
              password_textbox.set password
              break if grid.present?
              button.safe_click
              break if grid.present?
              button.safe_click
              break if grid.present?
              username_textbox.set username
              break if grid.present?
              password_textbox.set password
              break if grid.present?

              if welcome_orders_page.present?
                welcome_orders_page.continue
                break
              end

              if market_place.present?
                market_place.close
                break
              end

              logger.info "#{username} is #{(navbar.present?)?"signed-in!":"not signed-in."}"

              grid.wait_until_present
              logger.info "#{username} Orders Grid is #{(toolbar.present?)?"ready.":"not ready."}"

              break if grid.present?
            rescue Exception => e
              logger.error "ERROR ERROR ERROR "
              logger.error " #{e.backtrace}"
              logger.error " #{e.message}"
              logger.error " #{e.message}"
              logger.error "ERROR ERROR ERROR "
            end
          end

          begin
            logger.info 'LOGIN FAILED!'
            logger.info 'LOGIN FAILED!'
            logger.info 'LOGIN FAILED!'
            logger.info "Teardown Test!"
            stop_test "Sign-in failed!  Username #{username} is unable to sign-in on #{ENV["URL"]}"
          end unless navbar.present?

          logger.info "Signed-in Username is #{navbar.username.text}"

          if plugin_issue.present?
            TestHelper.teardown
            stop_test "Stamps.com Plugin Issue"
          end

        end
      end
    end
  end
end