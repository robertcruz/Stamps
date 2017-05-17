module Stamps
  module Pam
    module CustomerSearch
      def username
        @username ||= StampsTextBox.new(browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=uname]"))
      end

      def first_name
        @first_name ||= StampsTextBox.new(browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=fname]"))
      end

      def last_name
        @last_name ||= StampsTextBox.new(browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=fname]"))
      end

      def phone
        @phone ||= StampsTextBox.new(browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=phone]"))
      end

      def email
        @email ||= StampsTextBox.new(browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=email]"))
      end

      def search_btn
        @search_btn ||= StampsElement.new(browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]"))
      end

      def user_5_2_radio
        @user_5_2_radio ||= browser.radio(css: "input[name=v6usr][value='0']")
      end

      def user_5_2_or_lower

      end

      def search
        customer_profile = CustomerProfilePage.new(param)
        customer_profile_not_found = CustomerProfileNotFound.new(param)
        30.times do |counter|
          search_btn.send_keys(:enter)
          search_btn.click
          sleep(0.5)
          return customer_profile if customer_profile.present?
          if customer_profile_not_found.present?
            logger.error "PAM:  #{customer_profile_not_found.account_status}"
            browser.back
          end
        end
        search_btn.send_keys(:enter)
        search_btn.click
        return customer_profile if customer_profile.present?
        return customer_profile_not_found if customer_profile_not_found.present?
        expect(customer_profile.present? || customer_profile_not_found.present?).to be_true, "Customer Profile or Customer Not Found page did not appear."
      end

      def present?
        username.present?
      end

      def wait_until_present(*args)
        username.wait_until_present(*args)
      end
    end

    class CustomerSearchPage < Browser::StampsModal
      include CustomerSearch
      def visit
        case param.test_env.downcase
          when /cc/
            url = "http://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@qa-clientsite:82/pam/AccountSearch.asp"
          when /sc/
            url = "http://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@site.qasc.stamps.com:82/pam/AccountSearch.asp"
          when /stg/
            url = "https://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@site.staging.stamps.com:82/pam/AccountSearch.asp"
          else
            url = nil
        end
        expect(url).not_to be_nil, "URL is nil. Check your ENV['URL'] parameter."
        logger.info "Visit: #{url}"
        browser.goto(url)
        logger.info "Visited: #{browser.url}"
        self
      end
    end
  end
end