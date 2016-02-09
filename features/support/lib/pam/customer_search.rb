module Pam
  class CustomerSearch < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? @browser.input(:css => "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]")
    end

    def wait_until_present
      browser_helper.wait_until_present @browser.input(:css => "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]")
    end

    def username
      Textbox.new @browser.text_field(:css => "form[name=searchForm]>table>tbody>tr>td>input[name=uname]")
    end

    def first_name
      Textbox.new @browser.text_field(:css => "form[name=searchForm]>table>tbody>tr>td>input[name=fname]")
    end

    def last_name
      Textbox.new @browser.text_field(:css => "form[name=searchForm]>table>tbody>tr>td>input[name=fname]")
    end

    def phone
      Textbox.new @browser.text_field(:css => "form[name=searchForm]>table>tbody>tr>td>input[name=phone]")
    end

    def email
      Textbox.new @browser.text_field(:css => "form[name=searchForm]>table>tbody>tr>td>input[name=email]")
    end

    def search
      button = Stamps::Browser::Input.new @browser.input(:css => "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]")
      customer_profile = CustomerProfile.new @browser
      customer_profile_not__found = CustomerProfileNotFound.new @browser
      5.times do
        button.send_keys :enter
        button.safe_click
        sleep 1
        return customer_profile if customer_profile.present?
        return customer_profile_not__found if customer_profile_not__found.present?
      end
    end
  end
end