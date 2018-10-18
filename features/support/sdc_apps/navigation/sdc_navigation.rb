module SdcNavigation
  class SignedInUser < SdcPage
    page_object(:signed_in_user) { { xpath: '//span[@id="userNameText"]' } }
    page_object(:sign_out_link) { { xpath: '//a[text()="Sign Out"]' } }
  end

  class SignedInUserTablet < SdcPage
    page_object(:hamburger) { { xpath: '//div[contains(@class, "nav-collapse")]//div[contains(@class, "tablet")]' } }
    page_object(:my_account) { { xpath: '//a[text()="My Account"]' } }
    page_object(:manage_account) { { xpath: '//*[contains(@class, "nav-item")]//a[text()="Manage Account"]' } }
    page_object(:legal_terms) { { xpath: '//*[contains(@class, "nav-item")]//a[text()="Legal Terms"]' } }
    page_object(:sign_out) { { id: 'signOutLink' } }

    page_object(:balance) { { xpath: '//a[text()=" Balance"]' } }
    page_object(:buy_more) { { xpath: '//*[contains(@class, "nav-item")]//a[text()="Buy More"]' } }
    page_object(:view_purchase_history) { { xpath: '//*[contains(@class, "nav-item")]//a[text()="View Purchase History"]' } }
    page_object(:change_payment_method) { { xpath: '//*[contains(@class, "nav-item")]//a[text()="Change Payment Method"]' } }

    page_object(:supplies) { { xpath: '(//a[text()="Supplies"])[2]' } }
    page_object(:help) { { xpath: '(//a[text()="Help"])[2]' } }
  end

  class MailSignInModal < SdcPage
    page_object(:sign_in_link,required: 40) { { xpath: '//a[contains(@class, "signInLink")]' } }
    page_object(:username, tag: :text_field) { { id: 'UserNameTextBox' } }
    page_object(:password, tag: :text_field) { { id: 'PasswordTextBox' } }
    page_object(:sign_in) { { id: 'signInButton' } }
    page_object(:remember_username, tag: :checkbox) { { id: 'rememberUser' } }
    page_object(:invalid_sign_in) { { xpath: '//div[contains(@id, "InvalidUsernamePasswordMsg")]//label' } }
  end

  class MailSignInModalTablet < SdcPage
    page_object(:hamburger_menu) { { xpath: '//div[contains(@class, "nav-collapse")]//div[contains(@class, "tablet")]' } }
    page_object(:supplies) { { xpath: '(//a[text()="Supplies"])[2]' } }
    page_object(:sign_in) { { xpath: '//a[text()="Sign In"]' } }
    page_object(:help) { { xpath: '(//a[text()="Help"])[2]' } }
  end

  class SdcNavigationBalance < SdcPage
    page_object(:link, tag: :a) { { xpath: '//*[text()="Balance"]/..' } }
    page_object(:amount) { { xpath: '//*[contains(@class, "balance")]/a/strong/span' } }
    # page_object(:buy_more, tag: :a) { {id: 'buyMorePostageLnk'} }
    page_object(:buy_more, tag: :a) { { xpath: '//*[text()="Buy More"]' } }
    page_object(:view_purchase_history, tag: :a) { { xpath: '//*[text()="View Purchase History"]' } }
    page_object(:change_payment_method, tag: :a) { { xpath: '//*[text()="Change Payment Method"]' } }

    def add_funds
      SdcNavBalanceAddFunds.new
    end

    def confirm_transaction
      SdcNavBalanceCofirmTransaction.new
    end

    def processing_purchase
      SdcNavBalanceProcessing.new
    end

    def transaction_complete
      SdcNavBalanceTransaction.new
    end
  end

  class SdcNavBalanceAddFunds < SdcPage
    page_object(:title) { { xpath: '//*[text()="Add Funds"]' } }
    page_object(:x_btn) { { xpath: '//*[contains(@id, "purchasepostagewindow")]//*[contains(@class, "sdc-icon-mobile-close-light")]' } }
    page_object(:purchase) { { xpath: '//*[text()="Purchase"]' } }

    page_object(:edit_payment_method) { { xpath: '//*[text()="Edit payment method"]' } }
    page_object(:auto_fund_account) { { xpath: '//*[text()="Auto-fund account"]' } }
    page_object(:earn_free_credit, tag: :a) { { xpath: '//*[text()="Earn free account credit"]' } }

    page_object(:buy_10_chooser) { { xpath: '//*[@id="sdc-purchasewin-10dradio"]/../label' } }
    page_object(:buy_10_verify) { { xpath: '//*[@id="sdc-purchasewin-10dradio"]/../../..' } }
    radio(:buy_10, :buy_10_chooser, :buy_10_verify, "class", "checked")

    page_object(:buy_25_chooser) { { xpath: '//*[@id="sdc-purchasewin-25dradio"]/../label' } }
    page_object(:buy_25_verify) { { xpath: '//*[@id="sdc-purchasewin-25dradio"]/../../..' } }
    radio(:buy_25, :buy_25_chooser, :buy_25_verify, "class", "checked")

    page_object(:buy_50_chooser) { { xpath: '//*[@id="sdc-purchasewin-50dradio"]/../label' } }
    page_object(:buy_50_verify) { { xpath: '//*[@id="sdc-purchasewin-50dradio"]/../../..' } }
    radio(:buy_50, :buy_50_chooser, :buy_50_verify, "class", "checked")

    page_object(:buy_other_chooser) { { xpath: '//*[@id="sdc-purchasewin-otherdradio"]/../label' } }
    page_object(:buy_other_verify) { { xpath: '//*[@id="sdc-purchasewin-otherdradio"]/../../..' } }
    radio(:buy_other, :buy_other_chooser, :buy_other_verify, "class", "checked")

    page_object(:buy_other_amount, tag: :input) { { id: 'sdc-purchasewin-otheramount' } }
  end

  class SdcNavBalanceCofirmTransaction < SdcPage
    page_object(:title) { { xpath: '//*[text()="Confirm Transaction"]' } }
    page_object(:confirm) { { xpath: '//*[text()="Confirm"]' } }
    page_object(:body) { { xpath: '//*[@class="sdc-dialoguemodal-confirm-purchase"]' } }
  end

  class SdcNavBalanceProcessing < SdcPage
    page_object(:title) { { xpath: '//*[text()="Processing Purchase"]' } }
  end

  class SdcNavBalanceTransaction < SdcPage
    page_object(:title) { { xpath: '//*[text()="Transaction Complete"]' } }
    page_object(:body) { { xpath: '//*[contains(text(), "Your fund request for")]' } }
    page_object(:ok_btn) { { xpath: '//*[text()="OK"]' } }
  end

  class << self
    def user_drop_down
      SignedInUser.new
    end

    def mail_sign_in_modal
      return MailSignInModalTablet.new if TestSession.env.responsive
      MailSignInModal.new
    end

    def balance
      SdcNavigationBalance.new
    end

    def nav_element(str)
      xpath = if SdcPage.browser.url.include? 'account'
                "//a[starts-with(text(),'#{str}')]"
              elsif TestSession.env.mobile_device
                "//div[starts-with(@class,'tablet')]//a[starts-with(text(),'#{str}')]"
              else
                "//ul[@class='nav hide-on-phone']//a[starts-with(text(),'#{str}')]"
              end

      klass = Class.new(SdcPage) do
        page_object(:navigation_item) { { xpath: xpath } }
      end

      klass.new.navigation_item
    end

    def history_selection(str)
      xpath = if TestSession.env.mobile_device
                "//div[starts-with(@class,'tablet')]//a[text()='#{str}']"
              else
                "//ul[@class='nav hide-on-phone']//a[text()='#{str}']"
              end

      klass = Class.new(SdcPage) do
        page_object(:history_selection) { { xpath: xpath } }
      end

      klass.new.history_selection
    end
  end
end
