module SdcHistory
  module Details
    class << self
      def loading
        klass = Class.new(SdcPage) do
          page_object(:loading) { { xpath: '(//div[text()="Loading..."])[3]' } }
        end
        klass.new.loading
      end

      def status
        klass = Class.new(SdcPage) do
          page_object(:status) { { xpath: '//div[contains(@class, "sdc-ship-status")]' } }
        end
        klass.new.status
      end

      def tracking
        klass = Class.new(SdcPage) do
          page_object(:tracking) { { xpath: '//div[contains(@class, "tracking-collapsed")][not(contains(@class, "disabled"))]' } }
        end
        klass.new.tracking
      end

      def create_return_label
        klass = Class.new(SdcPage) do
          page_object(:create_return_label) { { xpath: '//*[text()="Create Return Label"][contains(@class, "small")]' } }
        end
        klass.new.create_return_label
      end

      def email_tracking_info
        klass = Class.new(SdcPage) do
          page_object(:email_tracking_info) { { xpath: '//*[text()="Email Tracking Info"][contains(@id, "button")]' } }
        end
        klass.new.email_tracking_info
      end

      def header
        Header.new
      end

      def addresses
        Addresses.new
      end

      def services
        Services.new
      end

      def reference
        Reference.new
      end
    end

    class Header < SdcPage
      page_object(:title) { { xpath: '//*[contains(@id, "singlePrintDetailsForm_header")]//*[contains(@id, "title")]//*' } }
      page_object(:toolbar_menu) { { xpath: '//*[contains(@class, "x-btn-after-title")]' } }
      page_object(:toolbar_menu_tooltip) { { xpath: '//b[text()="More"]' } }

      page_object(:create_return_label) { { xpath: '//div[contains(@id, "menu")]//*[text()="Create Return Label"]' } }
      page_object(:email_tracking_info) { { xpath: '//div[contains(@id, "menu")]//*[text()="Email Tracking Info"]' } }
      page_object(:track_on_usps) { { xpath: '//div[contains(@id, "menu")]//*[text()="Track on USPS.com"]' } }
      page_object(:print_receipt) { { xpath: '//div[contains(@id, "menu")]//*[text()="Print Receipt"]' } }
      page_object(:collapse_panel) { { xpath: '//div[contains(@id, "menu")]//*[text()="Collapse Panel"]' } }
    end

    class Addresses < SdcPage
      page_object(:title) { { xpath: '//div[text()="Loading..."]' } }
      page_object(:after_title_tool) { { xpath: '//div[text()="Loading..."]' } }

      page_object(:shipped_to) { { xpath: '//*[text()="Shipped To:"]/../../div/*' } }
      page_object(:shipped_from) { { xpath: '//*[text()="Shipped From:"]/../../div/*' } }
      page_object(:return_to) { { xpath: '//*[text()="Return To:"]/../../div/*' } }
    end

    class Services < SdcPage
      page_object(:title) { { xpath: '' } }
      page_object(:after_title_tool) { { xpath: '' } }
      page_object(:price) { { xpath: '' } }

      page_object(:carrier) { { xpath: '' } }
      page_object(:service) { { xpath: '' } }
      page_object(:service_price) { { xpath: '' } }
      page_object(:packaging) { { xpath: '' } }
      page_object(:incsurance) { { xpath: '' } }
      page_object(:tracking) { { xpath: '' } }
      page_object(:weight) { { xpath: '' } }


    end

    class Reference < SdcPage
      page_object(:title) { { xpath: '' } }
      page_object(:after_title_tool) { { xpath: '' } }

      def cost_code
        HistoryDetailCostcode.new
      end
    end

    class HistoryDetailCostcode <SdcPage
      page_object(:text_field, tag: :text_field) { { xpath: '//span[text()="Cost Code:"]/following::input[1]' } }
      page_object(:drop_down) { { xpath: '//span[text()="Cost Code:"]//following::div[contains(@class, "arrow")]' } }
      page_objects(:costcode_list){ { xpath: '//div[contains(@id, "changeCostCode")]//following::li' } }

      def costcode_random(position)
        xpath_text = "//div[contains(@id, 'changeCostCode')]//following::li[#{position}]"
        page_object(:costcode_text, required: true, timeout: 10) { { xpath: xpath_text } }
      end

      def selection(value)
        page_object(:selection_obj) { { xpath: "//li[text()='#{value}']" } }
      end

    end

  end
end