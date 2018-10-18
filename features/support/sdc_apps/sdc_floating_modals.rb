module SdcWebsite
  module SdcModals
    class ReadyToPrint < SdcPage
      page_object(:window) { { xpath: '//div[@id="sdc-window-tutorial"]' } }
      page_object(:title) { { xpath: '//div[@id="sdc-window-tutorial_header-targetEl"]//div//div' } }
      page_object(:close) { { xpath: '//span[text()="Close"]' } }
      page_object(:x_button) { { xpath: '//span[contains(@class, "icon-mobile-close-light")]' } }
      page_object(:body) { { xpath: '//div[@id="sdc-window-tutorial-innerCt"]' } }
    end

    class SdcRatingError < SdcPage
      page_object(:window_title) { { xpath: '//div[text()="Error"]' } }
      page_object(:body) { { xpath: '//div[contains(@class, "sdc-warning dialogue-content-body")]/div/div' } }
      page_object(:ok) { { xpath: '//span[contains(text(), "OK")]' } }
      page_object(:close) { { xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]' } }

    end

    class SdcWhatsNew < SdcPage
      page_object(:window) { { xpath: '//div[contains(@id,"dialoguemodal")][contains(@class,"x-window-default-closable")]' } }
      page_object(:x_button) { { xpath: '//span[contains(@class, "icon-mobile-close-light")]' } }
      page_object(:title) { { xpath: '//div[contains(text(), "What")]' } }
      page_object(:close) { { xpath: '//span[contains(text(), "Close")]' } }
      page_object(:more_info) { { xpath: '//span[contains(text(), "More Info")]' } }
    end

    class TutorialBase < SdcPage
      page_object(:window) { { xpath: '//div[@id="sdc-window-tutorial"]' } }
      page_object(:title) { { xpath: '//div[@id="sdc-window-tutorial_header-targetEl"]//div[contains(@class, "x-title-text-default")]' } }
      page_object(:body) { { xpath: '//div[@id="sdc-window-tutorial-innerCt"]' } }
      page_object(:x_button) { { xpath: '//span[contains(@class, "icon-mobile-close-light")]' } }
    end

    class TutorialWindow < TutorialBase
      page_object(:next) { { xpath: '//span[text()="Next"]' } }
      page_object(:close) { { xpath: '//span[contains(text(), "Close")]' } }
    end

    class LearnMore < TutorialBase
      page_object(:close) { { xpath: '//span[contains(text(), "Close")]' } }
      page_object(:learn_more) { { xpath: '//span[contains(text(), "Learn More")]' } }
    end


    class AddAdvancedShippingFeatures < SdcPage
      page_object(:window) { { xpath: '//div[starts-with(@id, "shipstationsinglepageupgradeview-")][contains(@class, "x-window-default-closable")]' } }
      page_object(:x_button) { { xpath: '//span[contains(@class, "icon-mobile-close-light")]' } }
    end

    class InsuranceTerms < SdcPage
      page_object(:window) { { xpath: '//div[starts-with(@id, "termsconditions-")][contains(@class, "x-window-default-closable")]' } }
      page_object(:title) { { xpath: '//div[text()="Stamps.com Insurance Terms and Conditions"]' } }
      page_object(:terms_link) { { xpath: '//u[text()="Stamps.com Insurance Terms and Conditions"]' } }
      page_object(:x_button) { { xpath: '//span[contains(@class, "sdc-icon-mobile-close-light")]' } }
      page_objects(:i_agree_btns) { { xpath: '//*[text()="I Agree"]' } }
      page_objects(:cancel_btns) { { xpath: '//*[text()="Cancel"]' } }
    end

    class << self
      def whats_new
        SdcWhatsNew.new
      end

      def rating_error
        SdcRatingError.new
      end

      def ready_to_print
        ReadyToPrint.new
      end

      def tutorial_window
        TutorialWindow.new
      end

      def learn_more
        LearnMore.new
      end

      def advanced_shipiping_features
        AddAdvancedShippingFeatures.new
      end

      def insurance_terms
        InsuranceTerms.new
      end
    end
  end
end