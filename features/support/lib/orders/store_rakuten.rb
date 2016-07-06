module Stamps
  module Orders
    module Stores
      class RakutenSettings < StoreSettings
        def window_title
          BrowserElement.new browser.div text: "Rakuten Settings"
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class Rakuten < Browser::Modal

        def window_title
          BrowserElement.new(browser.div text: "Connect your Rakuten Store")
        end

        def present?
          seller_id.present?
        end

        def close
          button = BrowserElement.new browser.img(css: "div[id^=connectrakutenwindow-]>div:nth-child(2)>img")
          5.times do
            button.safe_click
            break unless present?
          end
        end

        def seller_id
          BrowserTextBox.new browser.text_field(name: "RakutenSellerID")
        end

        def ftp_username
          BrowserTextBox.new (browser.text_fields(name: "AuthToken").first)
        end

        def ftp_password
          BrowserTextBox.new (browser.text_fields(name: "AuthToken").last)
        end

        def map_rakuten_sku
          checkbox_field = (browser.checkboxes(css: "input[type=button][id^=checkbox]").last)
          verify_field = checkbox_field.parent.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def connect
          button = BrowserElement.new browser.span(text: "Connect")
          settings = RakutenSettings.new param
          importing_order = Orders::Stores::ImportingOrdersModal.new param
          server_error = Orders::Stores::ServerError.new param
          connecting_button = BrowserElement.new browser.span(text: "Connecting...")

          max_server_error_retry_count = 5

          15.times do |counter|
            button.safe_click
            sleep 2
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if server_error.present?
              error_str = server_error.message
              logger.info error_str
              server_error.ok
              stop_test "Server Error: \n#{error_str}" unless counter < max_server_error_retry_count
            end
            if connecting_button.element.visible?
              logger.info connecting_button.text
            end
            return settings if settings.present?
          end
          stop_test "Rakuten Store Connect failed.  Settings Modal did not open, unable to connect."
        end
      end

      class ModifyRakutenStore < Rakuten

        def window_title
          BrowserElement.new(browser.div text: "Modify your Rakuten Store Connection")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

    end
  end
end