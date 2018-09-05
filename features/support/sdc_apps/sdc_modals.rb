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
      page_object(:title) { { xpath: '//div[contains(text(), "What")]' } }
      page_object(:close) { { xpath: '//span[contains(text(), "Close")]' } }
      page_object(:more_info) { { xpath: '//span[contains(text(), "More Info")]' } }
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
    end
  end
end