module SdcOrders
  module SdcOrdersModals
    class SdcExactAddressNotFound < SdcPage
      page_object(:title) { { xpath: '//*[text()="Exact Address Not Found"]' } }
      page_object(:accept) { { xpath: '//*[text()="Accept"]' } }

      def element_at_row(index)
        xpath = "(//input[@name='addrAmbig'])[#{index}]"
        page_object("item_description#{index}", tag: :radio) { { xpath: xpath } }
      end
    end

    class ServerError < SdcPage
      page_object(:title) { { xpath: '//*[text()="Server Error"]' } }
      page_object(:body) { { xpath: '//div[contains(@class, "sdc-warning")]//div[contains(@id, "-innerCt")]' } }
      page_object(:ok) { { xpath: '//span[text()="OK"]' } }
    end

    class ManageShippingAddresses < SdcPage
      page_object(:title) { { xpath: '//*[text()="Manage Shipping Addresses"]' } }
      page_object(:add) { { xpath: '//*[contains(@id, "manageShipFromWindow")]//*[text()="Add"]' } }
      page_object(:edit) { { xpath: '//*[contains(@id, "manageShipFromWindow")]//*[text()="Edit"]' } }
      page_object(:delete) { { xpath: '//*[contains(@id, "manageShipFromWindow")]//*[text()="Delete"]' } }
      page_object(:x_btn) { { xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]' } }
      page_objects(:addresses) { { xpath: '//*[contains(@id, "manageShipFromWindow")]//table[contains(@id, "tableview")]' } }

      def address_element(num)
        page_object(:address) { { xpath: "(//*[contains(@id, 'manageShipFromWindow')]//table[contains(@id, 'tableview')])[#{num}]" } }
      end
    end

    class AddEditShippingAddress < SdcPage
      page_object(:title) { { xpath: '//*[contains(@id, "editshipfromAddressWindow")]//*[contains(@class, "x-title-text")]' } }
      page_object(:ship_from_zip, tag: :text_field) { { xpath: '//*[@name="OriginZip"]' } }
      page_object(:name, tag: :text_field) { { xpath: '//*[@name="FullName"]' } }
      page_object(:company, tag: :text_field) { { xpath: '//*[@name="Company"]' } }
      page_object(:address, tag: :text_field) { { xpath: '//*[@name="Street1"]' } }
      page_object(:address2, tag: :text_field) { { xpath: '//*[@name="Street2"]' } }
      page_object(:city, tag: :text_field) { { xpath: '//*[@name="City"]' } }
      page_object(:zip, tag: :text_field) { { xpath: '//*[@name="Zip"]' } }
      page_object(:phone, tag: :text_field) { { xpath: '//*[@name="Phone"]' } }
      page_object(:save) { { xpath: '//*[text()="Save"]/../..' } }
      page_object(:x_btn) { { xpath: '//*[contains(@id, "editshipfromAddressWindow")]//*[contains(@class, "sdc-icon-mobile-close-light")]' } }

      def state
        ManageShippingAddressesState.new
      end
    end

    class DeleteShippingAddress < SdcPage
      page_object(:title) { { xpath: '//*[text()="Delete Shipping Address"]' } }
      page_object(:delete) { { xpath: '//*[contains(@id, "dialoguemodal")]//*[text()="Delete"]/../..' } }
      page_object(:x_btn) { { xpath: '//*[contains(@id, "dialoguemodal")]//*[contains(@class, "sdc-icon-mobile-close-light")]' } }
    end

    class ManageShippingAddressesState < SdcPage
      page_object(:drop_down) { { xpath: '//*[contains(@id, "statecombobox")]//div[contains(@id, "trigger-picker")]' } }
      page_object(:text_field, tag: :text_field) { { xpath: '//input[contains(@id, "statecombobox")]' } }

      def selection_element(str)
        page_object(:selection) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    class PrintModalPrintOn < SdcPage
      page_object(:text_field, tag: :text_field) { { xpath: '//input[contains(@id, "printmediadroplist")]' } }
      page_object(:drop_down) { { xpath: '//*[contains(@id, "printmediadroplist")]/div[contains(@id, "trigger-picker")]' } }
      page_object(:blur_out) { { xpath: '//span[text()="Printing On:"]' } }

      def selection(str)
        page_object(:selection_obj) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    class ShipDateMonthPicker < SdcPage
      page_object(:ok) { { xpath: '//*[@class="x-monthpicker-buttons"]//*[text()="OK"]' } }
      page_object(:cancel) { { xpath: '//*[@class="x-monthpicker-buttons"]//*[text()="Cancel"]' } }
      page_object(:year_prev) { { xpath: '//*[contains(@class,"x-monthpicker-yearnav-prev")]' } }
      page_object(:year_next) { { xpath: '//*[contains(@class,"x-monthpicker-yearnav-next")]' } }

      def selection_month(month)
        page_object(:month) { { xpath: "//a[text()='#{month}']" } }
      end

      def selection_year(year)
        page_object(:year) { { xpath: "//*[contains(@class, 'x-monthpicker-year')]//a[text()='#{year}']" } }
      end
    end

    class ShipDateDatepicker < SdcPage
      page_object(:head_link) { { xpath: '//*[@class="x-datepicker-header"]//span[contains(@id, "btnWrap")]' } }
      page_object(:today) { { xpath: '//*[contains(@class, "x-datepicker-footer")]//*[contains(@id, "btnWrap")]' } }

      def selection_day(day)
        page_object(:day) { { xpath: "//td[contains(@class, 'x-datepicker-active')]/*[text()='#{day}']/.." } }
      end

      def month_picker
        @month_year ||= ShipDateMonthPicker.new
      end
    end

    class PrintShipDate < SdcPage
      page_object(:text_field, tag: :text_field) { { xpath: '//input[contains(@id, "datefield")]' } }
      page_object(:drop_down) { { xpath: '//*[contains(@class, "x-form-date-trigger")]' } }

      def datepicker
        ShipDateDatepicker.new
      end
    end

    class PrintModalPrinter < SdcPage
      page_object(:text_field, tag: :text_field) { { id: 'sdc-printpostagewindow-printerdroplist-inputEl' } }
      page_object(:drop_down) { { id: 'sdc-printpostagewindow-printerdroplist-trigger-picker' } }

      def selection_element(name: :selection, value: 'factory')
        page_object(name) { { xpath: "//li[text()='#{value}']" } }
      end
    end

    class OrdersPrintModal < SdcPage
      page_object(:title) { { xpath: '//div[contains(@id, "printwindow")]//div[contains(text(),"You have")]' } }
      page_object(:print) { { id: 'sdc-printwin-printbtn-btnWrap' } }
      page_object(:print_sample) { {} }
      page_object(:total) { { xpath: '//*[contains(@class, "sdc-displayfield-font-style")]//div/*[contains(@id, "displayfield")]' } }
      page_object(:close) { { xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]' } }

      def print_on
        PrintModalPrintOn.new
      end

      def ship_date
        PrintShipDate.new
      end

      def printer
        PrintModalPrinter.new
      end
    end

    class SdcOrdersModalsSettingsGeneral < SdcPage
      page_object(:title) { { xpath: '//label[text()="General Settings"]' } }
      page_object(:postdate_text_field) { { xpath: '(//*[contains(@id, "generaltabview")]//input[contains(@class, "x-form-text")])[2]' } }
      page_object(:postdate_drop_down) { { xpath: '(//*[contains(@id, "generaltabview")]//div[contains(@class, "x-form-arrow-trigger")])[2]' } }

      page_object(:logoff_text_field) { { xpath: '(//*[contains(@id, "generaltabview")]//input[contains(@class, "x-form-text")])[1]' } }
      page_object(:logoff_drop_down) { { xpath: '(//*[contains(@id, "generaltabview")]//div[contains(@class, "x-form-arrow-trigger")])[1]' } }

      page_object(:balance_text_field) { { xpath: '(//*[contains(@id, "generaltabview")]//input[contains(@class, "x-form-text")])[3]' } }
      page_object(:balance_drop_down) { { xpath: '(//*[contains(@id, "generaltabview")]//div[contains(@class, "x-form-arrow-trigger")])[3]' } }

      def selection(str)
        page_object(:selection_obj) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    class OrdersSettingsStores < SdcPage

    end
    class SdcOrdersSettingsInt < SdcPage

    end

    class OrdersSettingsLabel < SdcPage

    end

    class PrintAllOrders < SdcPage
      page_object(:title) { { xpath: '//*[text()="General"]' } }
      page_object(:print_all) { { xpath: '//*[text()="Print All"]' } }
      page_object(:cancel) { { xpath: '//*[text()="Cancel"]' } }
      page_object(:x_btn) { { xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]' } }
    end

    class OrdersSettingsModal < SdcPage
      page_object(:general) { { xpath: '//span[text()="General"]' } }
      page_object(:stores) { { xpath: '//*[text()="Stores"]' } }
      page_object(:international) { { xpath: '//*[text()="International"]' } }
      page_object(:label_msgs) { { xpath: '//*[text()="Label Messages"]' } }
      page_object(:title) { { xpath: '(//*[text()="Orders Settings"])[1]' } }
      # page_object(:done) { {id: ''} }     //generated dynamically for each view
      page_object(:close) { { xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]' } }

      def general_settings
        SdcOrdersModalsSettingsGeneral.new
      end

      def stores_settings
        OrdersSettingsStores.new
      end

      def int_settings
        SdcOrdersSettingsInt.new
      end

      def label_msgs_settings
        OrdersSettingsLabel.new
      end
    end

    class << self
      def print
        OrdersPrintModal.new
      end

      def settings
        OrdersSettingsModal.new
      end

      def manage_shipping_addresses
        ManageShippingAddresses.new
      end

      def add_edit_shipping_address
        AddEditShippingAddress.new
      end

      def delete_shipping_address
        DeleteShippingAddress.new
      end

      def print_all
        PrintAllOrders.new
      end

      def server_error
        ServerError.new
      end

      def exact_address_not_found
        SdcExactAddressNotFound.new
      end
    end
  end
end
