module WhiteLabel
  class ProfilePage < SdcPage
    page_object(:profile_bread_crumb) { {xpath: '//li[@id="breadcrumb_Profile"]/span'} }
    page_object(:header) { {xpath: '//div[@id="page"]/div/div/h1'} }
    page_object(:side_acct_header) { {xpath: '//h3[(contains(text(), "Why do I need to create an account?"))]'} }
    page_object(:side_acct_text) {{xpath: '//li[@id="sideaccount"]/p'}}
    page_object(:side_opt_in_header) { {xpath: '//h3[(contains(text(), "Money-saving offers and new products"))]'} }
    page_object(:side_opt_in_text) {{xpath: '//li[@id="sideoptin"]/div/div/label/span'}}
    page_object(:money_saving_offers_checkbox_chooser) { {xpath: '//li[@id="sideoptin"]/div/div'} }
    page_object(:money_saving_offers_checkbox_verify) { {id: 'sideoptin'} }
    checkbox(:money_saving_offers_checkbox, :money_saving_offers_checkbox_chooser, :money_saving_offers_checkbox_verify, 'class', 'checked')
    text_field(:email, tag: :text_field, required: true) { { id: 'email' } }
    page_objects(:email_tooltip,  index: 0) { {xpath: '//*[@id="email"]/div/div/div/div/span'} }
    text_field(:username, tag: :text_field, required: true) { { id: 'username' } }
    page_objects(:username_tooltip,  index: 0) { {xpath: '//*[@id="accountinfo"]/div/div/div/span'} }
    text_field(:password, tag: :text_field, required: true) { { id: 'password' } }
    page_objects(:password_tooltip,  index: 1) { {xpath: '//*[@id="accountinfo"]/div/div/div/span'} }
    text_field(:confirm_password, tag: :text_field, required: true) { { id: 'confirmPassword' } }
    page_objects(:confirm_password_tooltip,  index: 2) { {xpath: '//*[@id="accountinfo"]/div/div/div/span'} }
    link(:promo_code_link) { { id: 'showPromoCode' } }
    text_field(:promo_code, tag: :text_field, required: true) { { id: 'promoCode' } }
    text_field(:promo_code_hidden, tag: :text_field, required: true) { { id: 'promoCodeHidden' } }
    page_objects(:promo_code_tooltip,  index: 0) { {xpath: '//*[@id="promocode"]/div/div/div/div/span'} }
    page_object(:survey) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="usageType"]'}}
    page_object(:referrer_name) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="referrerName"]'}}
    page_objects(:money_saving_offers,  index: 0) { {id: "optIn"} }
    button(:continue) {{id: 'next'}}
    page_object(:stamps_logo) {{id: 'sdc-logo'}}
    page_object(:usps_logo) {{xpath: '//div[@id="nav-usps-vendor"]'}}

    ######### profile page mobile ########
    page_object(:profile_bread_crumb_xs) { {xpath: '//li[@id="breadcrumb_Profile"]/span'} }
    page_object(:header_xs) { {xpath: '//div[@id="page"]/div/div/h1'} }
    page_object(:side_acct_header_xs) { {xpath: '//h3[(contains(text(), "Why do I need to create an account?"))]'} }
    page_object(:side_acct_text_xs) {{xpath: '//li[@id="sideaccount"]/p'}}
    page_object(:side_opt_in_header_xs) { {xpath: '//h3[(contains(text(), "Money-saving offers and new products"))]'} }
    page_object(:side_opt_in_text_xs) {{xpath: '//li[@id="sideoptin"]/div/div/label/span'}}
    page_object(:money_saving_offers_checkbox_chooser_xs) { {xpath: '//li[@id="sideoptin"]/div/div'} }
    page_object(:money_saving_offers_checkbox_verify_xs) { {id: 'sideoptin'} }
    checkbox(:money_saving_offers_checkbox_xs, :money_saving_offers_checkbox_chooser_xs, :money_saving_offers_checkbox_verify_xs, 'class', 'checked')
    text_field(:email_xs, tag: :text_field, required: true) { { id: 'email' } }
    page_objects(:email_tooltip_xs,  index: 0) { {xpath: '//*[@id="email"]/div/div/div/div/span'} }
    text_field(:username_xs, tag: :text_field, required: true) { { id: 'username' } }
    page_objects(:username_tooltip_xs,  index: 0) { {xpath: '//*[@id="accountinfo"]/div/div/div/span'} }
    text_field(:password_xs, tag: :text_field, required: true) { { id: 'password' } }
    page_objects(:password_tooltip_xs,  index: 1) { {xpath: '//*[@id="accountinfo"]/div/div/div/span'} }
    text_field(:confirm_password_xs, tag: :text_field, required: true) { { id: 'confirmPassword' } }
    page_objects(:confirm_password_tooltip_xs,  index: 2) { {xpath: '//*[@id="accountinfo"]/div/div/div/span'} }
    link(:promo_code_link_xs) { { id: 'showPromoCode' } }
    text_field(:promo_code_xs, tag: :text_field, required: true) { { id: 'promoCode' } }
    text_field(:promo_code_hidden_xs, tag: :text_field, required: true) { { id: 'promoCodeHidden' } }
    page_objects(:promo_code_tooltip_xs,  index: 0) { {xpath: '//*[@id="promocode"]/div/div/div/div/span'} }
    page_object(:survey_xs) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="usageType"]'}}
    page_object(:referrer_name_xs) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="referrerName"]'}}
    page_objects(:money_saving_offers_xs,  index: 0) { {id: "optIn"} }
    button(:continue_xs) {{id: 'next'}}
    page_object(:stamps_logo_xs) {{id: 'sdc-logo'}}
    page_object(:usps_logo_xs) {{xpath: '//div[@id="nav-usps-vendor"]'}}

    def survey_selection(str, name = :survey_element)
      page_object(name) { {xpath: "//span[contains(text(), \" #{str} \")]" } }
    end

    def referrer_name_selection(str, name = :referrer_name_element)
      page_object(name) { { xpath: "//span[contains(text(), \"#{str}\")]" } }
    end

  end

  class MembershipPage < SdcPage
    page_object(:header) { {xpath: '//h1[(contains(text(), "Set up your personal Post Office"))]'} }
    page_object(:membership_bread_crumb) { {xpath: '//li[@id="breadcrumb_Membership"]/span'} }
    button(:back) {{id: 'prev'}}
    button(:submit) {{id: 'next'}}

    #Personal Info
    text_field(:first_name, tag: :text_field, required: true) { { id: 'firstName' } }
    page_object(:first_name_help_block) { {xpath: '//div[@class="col-xs-12 col-sm-6 gut-sm-form-r-half"]/div/div/span'} }
    text_field(:last_name, tag: :text_field, required: true) { { id: 'lastName' } }
    page_object(:last_name_help_block) { {xpath: '//div[@class="col-xs-12 col-sm-6 gut-sm-form-l-half"]/div/div/span'} }
    text_field(:company, tag: :text_field) { { id: 'companyName' } }
    text_field(:address, tag: :text_field, required: true) { { id: 'street' } }
    page_object(:address_help_block) { {xpath: '//li[@id="personalinfo"]/div/div[4]/div/div/span'} }
    page_objects(:address_auto_complete) {{xpath: '//div[@class="pac-container pac-logo"]/div'}}
    text_field(:city, tag: :text_field, required: true) { { id: 'city' } }
    page_object(:city_help_block) { {xpath: '//*[@id="personalinfo"]/div/div[contains(@class, "col-lg-5")]/div/div/span'} }
    page_object(:state) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="state"]'}}
    page_object(:state_help_block) { {xpath:  '//*[@id="personalinfo"]/div/div[contains(@class, "col-lg-3")]/div/div[@class="help-block filled"]/span'} }
    text_field(:zip, tag: :text_field) { { id: 'zip' } }
    text_field(:phone, tag: :text_field, required: true) { { id: 'phone' } }
    page_object(:phone_help_block) {{xpath: '//li[@id="personalinfo"]/div/div[8]/div/div/span'}}

    #Credit Card
    page_object(:cc_auth) {{id: 'auth-copy'}}
    text_field(:cc_holder_name, tag: :text_field, required: true) { { id: 'ccName' } }
    page_object(:cc_holder_name_help_block) {{xpath: '//li[@id="creditcard"]/div/div[1]/div[2]/div/span'}}
    text_field(:cc_number, tag: :text_field, required: true) { { id: 'ccNumber' } }
    page_object(:cc_visa) {{id: 'visa'}}
    page_object(:cc_mastercard) {{id: 'mastercard'}}
    page_object(:cc_discover) {{id: 'discover'}}
    page_object(:cc_amex) {{id: 'amex'}}
    page_object(:cc_number_help_block) {{xpath: '//li[@id="creditcard"]/div/div[2]/div/div[2]/span'}}
    page_object(:cc_month) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="ccMonth"]'}}
    page_object(:cc_month_help_block) {{xpath: '//div[contains(@class, "gut-xs-form-r-half")]/div/div[2]/span'}}
    page_object(:cc_year) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="ccYear"]'}}
    page_object(:cc_year_help_block) {{xpath: '//div[contains(@class, "gut-xs-form-l-half")]/div/div[2]/span'}}
    page_object(:cc_stamps_logo) {{xpath: '//div[@id="creditcard-auth"]/div[1]/img'}}
    page_object(:cc_usps_logo) {{xpath: '//*[@id="creditcard-auth"]/div[2]/img'}}

    #Term and Conditions
    page_object(:terms_conditions) {{id: 'termsConditions'}}
    page_object(:addr_enable_disable_check) { {xpath: '//li[@id="terms"]/div/div/div'} }
    page_object(:terms_conditions_help_block) { {xpath: '//li[@id="terms"]/div/div/div/div[2]/span'} }
    link(:terms_conditions_link) { {class: ['termsLabel terms-conditions-link']} }
    page_object(:terms_conditions_header) { {xpath: '//h3[(contains(text(), "Terms and Conditions"))]'} }

    #Billing Address
    page_object(:billing_addr_checkbox) {{id: 'useMailingAddressForBilling'}}
    page_object(:billing_addr_header) {{class: ['billingAddressForm']}}
    text_field(:billing_addr, tag: :text_field, required: true) { { id: 'billingStreet' } }
    page_object(:billing_addr_help_block) {{xpath: '//li[@id="creditcard"]/div/div[6]/div[contains(@class, "billingAddressForm")]/div/span'}}
    page_objects(:billing_addr_auto_complete) {{xpath: '//div[@class="pac-container pac-logo"]/div'}}
    text_field(:billing_city, tag: :text_field, required: true) { { id: 'billingCity' } }
    page_object(:billing_city_help_block) { {xpath: '//*[@id="creditcard"]/div/div[contains(@class, "col-lg-5")]/div/div/span'} }
    page_object(:billing_state) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="billingState"]'}}
    page_object(:billing_state_help_block) { {xpath:  '//li[@id="creditcard"]/div/div[contains(@class, "col-lg-3")]/div/div[2]/span'} }
    text_field(:billing_zip, tag: :text_field, required: true) { { id: 'billingZip' } }
    page_object(:billing_zip_help_block) { {xpath:  '//li[@id="creditcard"]/div/div[contains(@class, "col-lg-4")]/div/div/span'} }

    #Side Mailing Info
    page_object(:need_mailing_info_header) { {xpath:  '//div[@id="need-mailing-info"]/h3'} }
    page_object(:need_mailing_info_p) { {xpath:  '//div[@id="need-mailing-info"]/p'} }
    page_object(:change_mailing_addr_header) { {xpath:  '//div[@id="change-mailing-address"]/h3'} }
    page_object(:change_mailing_addr_p) { {xpath:  '//div[@id="change-mailing-address"]/p'} }
    page_object(:outside_my_office_header) { {xpath:  '//div[@id="outside-my-office"]/h3'} }
    page_object(:outside_my_office_p) { {xpath:  '//div[@id="outside-my-office"]/p'} }

    #Side Credit Card
    page_object(:cc_info_header) { {xpath: '//h3[contains(text(), "Is my credit card information safe?")]'} }
    page_object(:cc_info_header_p) { {xpath:  '//li[@id="sidecreditcard"]/div[2]/p[1]'} }
    page_object(:pricing_and_billing_header) { {xpath: '//div[@id="pricing-and-billing"]/h3'} }
    page_object(:pricing_and_billing_p) { {xpath:  '//div[@id="pricing-and-billing"]/p'} }
    page_object(:cancel_anytime_header) { {xpath: '//li[@id="sidecreditcard"]/div/h3[2]'} }
    page_object(:cancel_anytime_p) { {xpath: '//li[@id="sidecreditcard"]/div/p[2]'} }

    link(:bonus_offer_details) { {id: 'offerDetails'} }
    page_object(:bonus_offer_details_header) { {xpath: '//h3[contains(text(), "Your Stamps.com Offer")]'} }

    #username taken
    page_object(:username_taken_header) { {xpath: '//h3[(contains(text(), "Username Taken"))]'} }
    page_object(:username_taken_p) { {id: 'prev-username'} }
    text_field(:new_username, tag: :text_field, required: true) { { id: 'newUsername' } }
    page_object(:new_username_help_block) { {class: ['help-block filled']} }
    button(:username_taken_continue_btn) {{id: 'btnUserNameTakenContinue'}}
    button(:username_taken_close_btn) {{class: ['close']}}

    #Invalid Address
    page_object(:invalid_addr_header) { {xpath: '//h3[(contains(text(), "Invalid Address"))]'} }
    page_object(:invalid_addr_p) { {id: 'errorDescription'} }


    #address Standardized
    page_object(:addr_std_header) { {xpath: '//h3[(contains(text(), "Your address has been standardized"))]'} }
    page_object(:addr_std_p) { {id: 'instructions'} }
    page_object(:addr_std_addr_orig) { {id: 'addrOrig'} }
    page_object(:addr_std_addr_new) { {id: 'addrNew'} }
    button(:addr_std_continue) {{id: 'btnAddrValOkay'}}
    page_objects(:address_std_x, index: 1) {{class: ['close']}}
    button(:addr_std_cancel) {{xpath: '//div[@class="modal-footer"]/button[1]'}}

    #Exact Address
    page_object(:exact_addr_header) { {xpath: '//h3[(contains(text(), "Exact address not found"))]'} }
    page_object(:exact_addr_p) { {id: 'instructions'} }
    page_objects(:exact_addr_choice) { {xpath: '//table[@class="table table-striped"]/tbody/tr/td'} }

    #postage meter address
    page_object(:meter_header) { {xpath: '//h1[(contains(text(), "An additional postage meter address is required"))]'} }
    page_object(:meter_p) { {xpath: '//div[@class="col-xs-12"]/p'} }
    text_field(:meter_street, tag: :text_field, required: true) { { id: 'meterStreet' } }
    page_object(:meter_street_help_block) { {xpath: '//div[@class="form-group fancy-input has-error"]/div'} }
    text_field(:meter_city, tag: :text_field, required: true) { { id: 'meterCity' } }
    page_object(:meter_city_help_block) { {xpath:'//div[@class="col-xs-12 col-lg-5 gut-lg-form-r-half"]/div/div'} }
    page_object(:meter_state) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="meterState"]'}}
    page_object(:meter_state_help_block) { {xpath: '//div[contains(@class, "col-xs-12 col-sm-6 col-lg-3")]/div/div[2]'} }
    text_field(:meter_zip, tag: :text_field, required: true) { { id: 'meterZip' } }


    def dropdown_selection(str, index, name = :dropdown_element)
      page_objects(name, index: index) { {xpath: "//span[text()='#{str}']"} }
    end

    def billing_dropdown_selection(str, name = :dropdown_element)
      page_object(name) { {xpath: "//li[@id='creditcard']/div/div[contains(@class, 'col-sm-6')]/div/div[contains(@class, 'dropup open')]/div/ul/li/a/span[text()='#{str}']"} }
    end

  end

  class ChooseSupplies < SdcPage
    page_object(:cs_header) { {xpath: '//h1[(contains(text(), "Customize your Welcome Kit"))]'} }
    page_objects(:cs_paragraph) {{xpath: '//div[@class="container welcomeTextBucket"]/section/p'}}
    page_objects(:cs_postal_scale) {{xpath: '//div[@id="midCopyContent"]/div[2]/div[2]/ul/li/input[1]'}}
    page_objects(:cs_original_net_stamps) {{xpath: '//div[@id="midCopyContent"]/div[3]/div[3]/ul/li/input[1]'}}
    page_objects(:cs_patriotic_net_stamps) {{xpath: '//div[@id="midCopyContent"]/div[3]/div[6]/ul/li/input[1]'}}
    page_objects(:cs_postage_delivery_return_addr) {{xpath: '//div[@id="midCopyContent"]/div[3]/div[9]/ul/li/input[1]'}}
    page_objects(:cs_thermal_printers) {{xpath: '//div[@id="midCopyContent"]/div[3]/div[12]/ul/li/input[1]'}}
    page_objects(:cs_net_stamps) {{xpath: '//div[@id="midCopyContent"]/div[3]/div[15]/ul/li/input[1]'}}
    page_objects(:cs_business_envelopes) {{xpath: '//div[@id="midCopyContent"]/div[3]/div[18]/ul/li/input[1]'}}
    page_objects(:cs_large_mailers) {{xpath: '//*[@id="midCopyContent"]/div[3]/div[21]/ul/li/input[1]'}}
    page_object(:place_order) { {id: 'mincartButtonTopDpawr'}}
    page_object(:cs_welcome_kit) {{xpath: '//div[@id="skuList"]/div/span[1]'}}

   def atg_promotion
      SdcPage.browser.execute_script('return WR.model.session.atgPromotion')
   end

  end

  class << self

    def profile_page
      ProfilePage.new
    end

    def membership_page
      MembershipPage.new
    end

    def choose_supplies
      ChooseSupplies.new
    end

    def common_page
      Common.new
    end

    def sdcw_website
      SDCWWebsite.new
    end

    def ew_website
      EWWebsite.new
    end

    def sdc_db_connection
      SdcWebsiteDB.new
    end

    def bridge_db_connection
      VBridgeDB.new
    end

    def stamp_mart_db_connection
      StampMartDB.new
    end


  end

end