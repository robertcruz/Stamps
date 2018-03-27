module Stamps
  module Orders
    class OrdersWelcomeModal < SdcPageObject
      element(:title) {SdcElement.new(browser.div(text: 'Welcome!'))}
      element(:msg_container) {SdcElement.new(browser.div(id: 'sdc-window-tutorial-innerCt'))}
      element(:next_button) {SdcElement.new(browser.span(text: 'Next'))}
      element(:close_button) {SdcElement.new(browser.img(css: 'img[class$=x-tool-close]'))}
      element(:add_manual_order) {SdcElement.new(browser.xxxxxxx)}

      def close
        close_button.click_while_present
      end

      def message
        msg_container.text_value
      end

      def next
        10.times do
          next_button.safe_click
          break
        end
      end
    end

    class LandingPage < SdcPageObject
      element(:username, required: true) { SdcElement.new(browser.text_field(css: '[placeholder=USERNAME]')) }
      element(:password, required: true) { SdcElement.new(browser.text_field(css: '[placeholder=PASSWORD]')) }
      element(:sign_in, required: true) { SdcElement.new(browser.span(text: 'Sign In')) }
      element(:loading_orders) { SdcElement.new(browser.div(text: 'Loading orders...')) }
      element(:remember_me) { SdcChooser.new(SdcElement.new(browser.span(:id, '[class*=remember-username-checkbox]')),
                                             SdcElement.new(browser.div(css: '[class*=remember-username-checkbox] [id$=-displayEl]')),
                                             'class', 'checked') }
      element(:signed_in_user) {SdcElement.new(browser.span(id: 'userNameText'))}

      page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

      def present?
        username.present? && password.present? && sign_in.present? && remember_me.present?
      end

      def sign_in_with(usr, pwd, persist = 2)
        username.set usr
        password.set pwd
        sign_in.safe_click(ctr: 2).send_keys_while_present(:enter, ctr:2)
        username.safe_wait_while_present(4)
        loading_orders.safe_wait_until_present(2).safe_wait_while_present(10)
        signed_in_user.safe_wait_until_present(5).text_value
      end
    end
  end
end