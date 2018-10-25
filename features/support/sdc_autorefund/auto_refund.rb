module SdcAutoRefund

  class SdcAutoRefund < SdcPage
    page_object(:loading) { { xpath: '//div[text()="Loading..."]' } }
    page_object(:title) { { xpath: '//*[text()="RefundAssist Report"]' } }
    page_object(:terms_conditions) { { xpath: '' } }
    page_object(:update_label_status) { { xpath: '//*[text()="Update Label Status"]' } }
    page_object(:success_msg) { { xpath: '//*[text()="Thank you! Your label status has been updated."]' } }
    page_objects(:not_shipped_all) {{ xpath: '' }}
    page_objects(:shipped_all) {{ xpath: '' }}

    def not_shipped(num)
      page_object(:ns_chooser) { { xpath: "()[#{num}]" } }
      page_object(:ns_verify) { { xpath: "()[#{num}]" } }
      chooser(:radio, :ns_chooser, :ns_verify, :class, :checked)
      # page_object(:chooser) { { xpath: '//*[contains(@class,"badgebutton")]//div[text()="Today"]' } }
      # page_object(:verify) { { xpath: '//*[contains(@class,"badgebutton")]//div[text()="Today"]/../../../..' } }
    end

    def shipped(num)
      page_object(:s_chooser) { { xpath: "()[#{num}]" } }
      page_object(:s_verify) { { xpath: "()[#{num}]" } }
      chooser(:radio, :s_chooser, :s_verify, :class, :checked)
    end

    # def row
    #   Row.new
    # end

  end

  # class Row < SdcPage
  #   def not_shipped(num)
  #
  #   end
  #
  #   def shipped(num)
  #
  #   end
  #
  #   def tracking(num)
  #
  #   end
  # end
end