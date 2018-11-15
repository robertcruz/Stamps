module SdcHistory
  module MultipleDetails
    class << self
      def loading
        klass = Class.new(SdcPage) do
          page_object(:loading) { { xpath: '(//div[text()="Loading..."])[3]' } }
        end
        klass.new.loading
      end

      def header
        Header.new
      end

    end

    class Header < SdcPage
      #to-do Navya to change the xpaths
      page_object(:title) { { xpath: '//*[contains(@id, "singlePrintDetailsForm_header")]//*[contains(@id, "title")]//*' } }
      page_object(:toolbar_menu) { { xpath: '//*[contains(@class, "x-btn-after-title")]' } }
      page_object(:toolbar_menu_tooltip) { { xpath: '//b[text()="More"]' } }

      page_object(:create_return_label) { { xpath: '//div[contains(@id, "menu")]//*[text()="Create Return Label"]' } }
      page_object(:email_tracking_info) { { xpath: '//div[contains(@id, "menu")]//*[text()="Email Tracking Info"]' } }
      page_object(:track_on_usps) { { xpath: '//div[contains(@id, "menu")]//*[text()="Track on USPS.com"]' } }
      page_object(:print_receipt) { { xpath: '//div[contains(@id, "menu")]//*[text()="Print Receipt"]' } }
      page_object(:collapse_panel) { { xpath: '//div[contains(@id, "menu")]//*[text()="Collapse Panel"]' } }
    end

  end
end