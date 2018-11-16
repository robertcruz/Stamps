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
        page_object(:title) { { xpath: '//*[contains(@id, "multiPrintDetails")]//*[contains(@id, "title")]//*' } }
        page_object(:toolbar_menu) { { xpath: '//*[contains(@id, "multiPrintDetails")]//*[contains(@class, "x-btn-after-title")]' } }

        page_object(:collapse_panel) { { xpath: '//*[contains(@id, "multiPrintDetails")]//div[contains(@id, "menu")]//*[text()="Collapse Panel"]' } }
      end
  end
end