module Batch

  #
  # Navigation bar containing Sign-in, etc
  #
  class NavigationBar < BrowserObject
    private

    def login_div
      div = @browser.div :id => "loginDiv"
      begin
        div.wait_until_present 30
      rescue
        #ignore
      end
      log "Logout successful?  #{(div.present?)? 'Yes': 'No'}"
      div
    end

    def balance_label
      @browser.span(:id => 'postageBalanceAmt')
    end


    def buy_more_link
      @browser.a(:id => 'buyMorePostageLnk')
    end

    def username_field
      @browser.span(:id => 'userNameText')
    end

    def sign_out_link
      @browser.link :id => "signOutLink"
    end

    public

    def select_buy_more

      @browser.window.move_to 0, 0
      @browser.window.resize_to 1500, 850
      @browser.window.move_to 3000, 500

      balance_label.focus
      browser_helper.click balance_label, "Balance"
      balance_label.hover
      buy_more_link.focus
      buy_more_link.wait_until_present(10)
      log "Clicking Buy More link"
      browser_helper.click buy_more_link, "BuyMoreLink"


      #balance_label.wait_while_present
      @browser.window.move_to 0, 0

    end

    def buy_more
      BuyPostage.new(@browser)
    end

    def balance
      balance = balance_label.text
      log balance
      new_balance = test_helper.strip(test_helper.strip(balance, "$", ""), ",", "")
      log new_balance
      balance_f = new_balance.to_f
      log balance_f
      balance_f
    end

    def sign_out
      5.times { #todo must hover over signout link
        begin
          @browser.window.move_to 0, 0
          @browser.window.resize_to 1200, 750
          @browser.window.move_to 3000, 500
          username_field.hover
          browser_helper.click username_field, "userNameText" unless sign_out_link.present?
          sign_out_link.hover
          browser_helper.click sign_out_link, "signOutLink"
          username_field.wait_while_present
          @browser.window.move_to 0, 0
          break if browser_helper.field_present? login_div
        rescue
          #ignore
        end
      }
    end

    def username
      username_field.when_present.text
    end

    def wait_until_present(timeout)
      username_field.wait_until_present(timeout)
    end

    def present?
      browser_helper.field_present?  username_field
    end

  end
end