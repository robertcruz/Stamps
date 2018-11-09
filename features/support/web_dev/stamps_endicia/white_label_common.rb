module WhiteLabel

  class Common < SdcPage
    #stamps website
    page_object(:stamps_logo) {{id: 'sdc-logo'}}
    button(:get_started) { { class: ['btn btn-success btn-xs register'] } }
    page_object(:usps_logo) {{xpath: '//div[@id="nav-usps-vendor"]'}}
    page_object(:usps_logo) {{xpath: '//div[@id="nav-usps-vendor"]'}}

    #endicia website
    page_object(:ew_logo) {{id: 'sdc-logo'}}
    page_object(:ew_get_started) {{class: ['btn pull-right color-ffffff btn-orange']}}

    #modal
    button(:modal_continue) {{id: 'btnAddrValOkay'}}
    button(:modal_cancel) {{xpath: '//div[@class="modal-footer"]/button[1]'}}
    page_objects(:modal_x, index: 0) { {class: ['close']} }

    #Print
    page_object(:print_stamps_logo) {{class: ['sdcLogo']}}

    #Header
    page_object(:stamps_logo) {{id: 'sdc-logo'}}
    page_objects(:usps_logo, index: 0) {{xpath: '//div[@id="nav-usps-vendor"]'}}
    page_objects(:header_text, index: 1) {{xpath: '//div[@id="nav-usps-vendor"]/ul/li'}}
    page_object(:learn_more_dropdown) {{class: 'dropdown-toggle'}}
    button(:login) { { class: ['btn btn-info btn-xs login'] } }
    page_object(:microphone_text) {{xpath: '//div[@id="microphone"]/p'}}
    page_object(:get_started_btn) {{xpath: '//button[@class="btn btn-success btn-xs register"]'}}
    page_object(:radio_image) {{xpath: '//img[@src="https://www.stamps.com/assets/images/home/sm55.png"]'}}

    #Footer
    page_object(:privacy_policy) {{xpath: '//*[@data-pgtitle="Privacy Policy"]'}}
    page_object(:norton_logo) { {id: 'verisign-norton'} }

    #privacy policy modal
    page_object(:pp_header) {{xpath: '//a[@class="get-content"][@data-pgtitle="Privacy Policy"]'}}
    page_object(:pp_body_header) {{xpath: '//h1[(contains(text(), "Privacy Policy"))]'}}
    button(:pp_close) {{class: 'close'}}

    #Copyright modal
    page_object(:copyright) {{xpath: '//a[@class="get-content"][@data-pgtitle="Copyright"]'}}
    page_object(:copyright_header) {{xpath: '//h3[(contains(text(), "Website Terms of Use and Copyright Notice"))]'}}
    button(:copyright_close) {{class: 'close'}}

    #Live chat modal
    page_object(:live_chat) {{id: 'live-chat'}}
    page_object(:chat_launch) {{id: 'chat-launch-pg'}}
    page_object(:chat_header) {{xpath: '//h1[(contains(text(), "Stamps.com"))]'}}

    #pro active chat
    page_object(:proactive_chat) {{id: 'proactiveChat'}}
    page_object(:proactive_chat_header) {{xpath: '//*[(contains(text(), "Stamps.com Chat"))]'}}
    page_object(:stamps_icon) {{class: 'rn_SyndicatedChatLogoImageDiv'}}
    page_object(:proactive_chat_header_label) {{xpath: '//*[(contains(text(), "Have a question? Ask me!"))]'}}
    button(:accept) {{id: 'rn_DialogButton_rn_Dialog_0_0-button'}}
    button(:decline) {{id: 'rn_DialogButton_rn_Dialog_0_1-button'}}


    #security questions
    page_object(:sq_header) {{xpath: '//h1[(contains(text(), "Before you start printing postage, make sure your account is protected."))]'}}
    page_object(:sq_header_profile) {{xpath: '//h2[(contains(text(), "Please answer these security questions:"))]'}}
    page_object(:security_question) {{xpath: '//h2[(contains(text(), "To protect your account, please answer these security questions:"))]'}}
    page_objects(:first_security_question, index: 0) {{xpath: '//div[contains(@class, "secretQuestion")]/button'}}
    page_objects(:first_security_question_help_block,  index: 0) { {xpath: '//*[@id="secretquestions"]/div/div/div/span'} }
    text_field(:first_secret_answer, tag: :text_field, required: true) { { id: 'secretAnswer1' } }
    page_objects(:first_security_answer_help_block,  index: 0) { {xpath: '//*[@id="secretquestions"]/div/div/div/span'} }
    page_objects(:second_security_question, index: 1) {{xpath: '//div[contains(@class, "secretQuestion")]/button'}}
    page_objects(:second_security_question_help_block,  index: 0) { {xpath: '//*[@id="secretquestions"]/div/div/div/span'} }
    text_field(:second_secret_answer, tag: :text_field, required: true) { { id: 'secretAnswer2' } }
    page_objects(:second_security_answer_help_block_pro_page,  index: 0) { {xpath: '//*[@id="secretquestions"]/div/div/div/span'} }
    page_objects(:second_security_answer_help_block,  index: 3) { {xpath: '//*[@id="newsecretquestions"]/div/div/div/div/div/span'} }
    page_objects(:sq_page_sq_help_block) { {xpath: '//div[@class="form-group has-error"]/span'} }


    button(:sq_get_started) { { id: 'startPrinting' } }

    #account created
    button(:account_created_continue) { {id: 'pawrContinue'} }

    #An Error Occurred
    page_object(:error_occurred_header) {{xpath: '//h3[(contains(text(), "An Error Occurred"))]'}}
    page_object(:error_occurred_p) {{id: 'unexpected'}}
    page_object(:error_occurred_error_code) {{id: 'errorCode'}}
    page_object(:error_occurred_error_description) {{id: 'errorDescription'}}

    #Offer 573 Landing Page
    page_object(:offer_573_header) {{id: 'hpHeader'}}
    page_object(:offer_573_p) {{id: 'hpSubheader'}}
    page_object(:offer_573_p2) {{id: 'hpUpgrade'}}
    page_object(:offer_573_img) {{xpath: '//img[contains(@src, "webreg/images/shippingLabels.png")]'}}

    #offer 592 Landing Page
    page_object(:offer_592_header) {{xpath: '//h1[(contains(text(), "Congratulations on your new account!"))]'}}
    page_objects(:offer_592_p) {{xpath: '//div[@id="averyCongrats"]/p'}}
    page_object(:offer_592_continue) {{id: 'averyReturn'}}
    page_objects(:offer_592_avery) {{class: ['site-logo__link']}}

    #Print Landing Page
    page_object(:print_stamps_logo) {{class: ['sdcLogo']}}
    page_object(:print_username) {{id: 'userNameText'}}
    page_object(:print_edge_detail_link) {{id: 'moreInformationDropdownSpan'}}
    page_object(:print_edge_go_on_link) {{id: 'invalidcert_continue'}}

    def dropdown_selection(str, index, name = :dropdown_element)
      page_objects(name, index: index) { { xpath: "//span[contains(text(), \"#{str}\")]" } }
    end

    def sdc_website_source_id_query(offer_id)
      if offer_id.nil?
        source_id = WhiteLabel.sdc_db_connection.execute(
          "select TOP 1 *
          from [dbo].sdct_SW_Source as sw_source
          inner join [dbo].sdct_SW_Offer as sw_offer on sw_offer.OfferId = sw_source.OfferId
          ORDER BY NEWID()")
        source_id.each do |item|
          return item['SourceId'], item['Content'], item['PromoCode'], item['OfferId'], item['TargetUrl'], item['VendorId']
        end
      else
        source_id = WhiteLabel.sdc_db_connection.execute(
          "select TOP 1 *
          from [dbo].sdct_SW_Source as sw_source
          inner join [dbo].sdct_SW_Offer as sw_offer on sw_offer.OfferId = sw_source.OfferId
		      where sw_offer.OfferId = #{offer_id}
          ORDER BY NEWID()")
        source_id.each do |item|
          return item['SourceId'], item['Content'], item['PromoCode'], item['OfferId'], item['TargetUrl'], item['VendorId']
        end
      end
    end

    def stamps_mart_source_id_query(source_id)
      source_id = WhiteLabel.stamp_mart_db_connection.execute(
      "select * FROM [Stampmart].[dbo].[smt_PromotionOffers]
       where PromoCode = '#{source_id}'")
     source_id.each do |item|
        return item['OfferID'], item['PromoCode']
      end
    end

    def username_query(username)
      username = WhiteLabel.bridge_db_connection.execute(
          "SELECT *
           FROM [Bridge].[dbo].[sdct_Bridge_User]
           where UserName = '#{username}'")
      username.each do |item|
        return item['UserName']
      end
    end

    def existing_username_query
      username = WhiteLabel.bridge_db_connection.execute(
         "select TOP 1 *
          FROM [Bridge].[dbo].[sdct_Bridge_User]
          where EmailAddress IS NOT NULL and UserName NOT like '%\\%'
          ORDER BY NEWID()")
      username.each do |item|
        return item['UserName']
      end
    end

    def plan_query(offer_id, sku)
     data = WhiteLabel.stamp_mart_db_connection.execute(
      "select  offer_pricing_plans.OfferID, offer_pricing_plans.PlanID, pricing_plans.SKU, pricing_plans.MonthlyBaseFee
       from [dbo].[smt_pricingplans] as pricing_plans
       inner join  [dbo].[smt_OfferPricingPlans] as offer_pricing_plans on  offer_pricing_plans.PlanID = pricing_plans.PlanID
       where offer_pricing_plans.OfferID = #{offer_id} and pricing_plans.SKU = '0#{sku}'")

      data.each do |item|
        return item['MonthlyBaseFee']
      end
    end

    def plan_sku
      SdcPage.browser.execute_script('return WR.model.session.reg.planSku')
    end

    def wr_model_session_offer
      SdcPage.browser.execute_script('return WR.model.session.offer')
    end
  end

  class SDCWWebsite <SdcPage
    def self.visit(str)
      dev_env = data_for(:web_dev_env, {})['dev']
      if dev_env.include?(TestSession.env.url.to_s)
        page_url {"https://#{TestSession.env.url.to_s}-win10.corp.stamps.com/stampscom/?source=#{str}&mboxDisable=1" }
      elsif TestSession.env.url == :prod
        page_url { |env| "https://www.#{env}stamps.com/?source=#{str}&mboxDisable=1" }
      else
        page_url { |env| "https://#{env}stamps.com/?source=#{str}&mboxDisable=1" }
      end

      super(case TestSession.env.url
              when :qacc
                'sdcwebsite.qacc.'
              when :stg
                'sdcwebsite.staging.'
              when :prod
                ''
            end)
    end
  end

  class EWWebsite < SdcPage

    def self.visit
      dev_env = data_for(:web_dev_env, {})['dev']
      if dev_env.include?(TestSession.env.url.to_s)
        page_url {"https://#{TestSession.env.url.to_s}-win10.corp.endicia.com/registration/" }
      elsif TestSession.env.url == :prod
        page_url { |env| "https://#{env}.endicia.com/registration/"}
      else
        page_url { |env| "https://#{env}.endicia.com/registration/"}
      end

      super(case TestSession.env.url
              when :qacc
                'registrationext.qacc'
              when :stg
                'registration.staging'
              when :prod
                'registration'
            end)
    end
  end

end