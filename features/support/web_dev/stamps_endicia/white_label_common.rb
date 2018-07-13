module WhiteLabel

  class Common < SdcPage
    #stamps website
    page_object(:stamps_logo) {{id: 'sdc-logo'}}
    button(:get_started) { { class: ['btn btn-success btn-xs register'] } }

    #security questions
    page_object(:sq_header) {{xpath: '//h1[(contains(text(), "Before you start printing postage, make sure your account is protected."))]'}}
    page_object(:security_question) {{xpath: '//h2[(contains(text(), "To protect your account, please answer these security questions:"))]'}}
    page_objects(:first_security_question, index: 0) {{xpath: '//div[contains(@class, "secretQuestion")]/button'}}
    text_field(:first_secret_answer, tag: :text_field, required: true) { { id: 'secretAnswer1' } }
    page_objects(:second_security_question, index: 1) {{xpath: '//div[contains(@class, "secretQuestion")]/button'}}
    text_field(:second_secret_answer, tag: :text_field, required: true) { { id: 'secretAnswer2' } }
    button(:sq_get_started) { { id: 'startPrinting' } }

    #username taken
    page_object(:username_taken_header) { {xpath: '//h3[(contains(text(), "Username Taken"))]'} }
    page_objects(:username_taken_p1, index: 0) { {id: 'prev-username'} }
    page_objects(:username_taken_p2, index: 1) { {id: 'prev-username'} }
    text_field(:new_username, tag: :text_field, required: true) { { id: 'newUsername' } }
    button(:username_taken_continue_btn) {{id: 'btnUserNameTakenContinue'}}
    button(:username_taken_close_btn) {{class: ['close']}}

    def dropdown_selection(str, index, name = :dropdown_element)
      page_objects(name, index: index) { { xpath: "//span[contains(text(), \"#{str}\")]" } }
    end

    def source_id_query
     source_id = WhiteLabel.db_connection.execute(
         "select TOP 1 *
          from [dbo].sdct_SW_Source as sw_source
          inner join [dbo].sdct_SW_Offer as sw_offer on sw_offer.OfferId = sw_source.OfferId
          ORDER BY NEWID()")
         # "select *
         #  from [dbo].sdct_SW_Source as sw_source
         #  inner join [dbo].sdct_SW_Offer as sw_offer on sw_offer.OfferId = sw_source.OfferId
         #  where sw_source.SourceId = 'si00001331'")

      source_id.each do |item|
          return item['SourceId'], item['Content']
      end

    end

  end

  class SDCWWebsite <SdcPage
    def self.visit
      page_url { |env| "https://#{env}stamps.com/?source=#{TestData.hash[:source_id]}" }
      super(case SdcEnv.env
              when :qacc
                'sdcwebsite.qacc.'
              when :stg
                'sdcwebsite.staging.'
              when :prod
                ''
              else
                # ignore
            end)
    end
  end

  class EWWebsite < SdcPage

    def self.visit
      page_url { |env| "https://#{env}endicia.com/" }
      super(case SdcEnv.env
              when :qacc
                'registration.qacc.'
              when :stg
                'registration.staging.'
              when :prod
                ''
              else
                # ignore
            end)
    end
  end

end