module SdcMail
  module SdcPrintForm

    module MailFromContainer
      class MailFrom < SdcPage
        page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-shipfromdroplist-trigger-picker"]' } }
        page_object(:text_field, tag: :text_field) { { xpath: '//*[@name="ShipFrom"]' } }

        def selection(name, str)
          page_object(name) { { xpath: "//li[contains(text(), '#{str}')]" } }
        end
      end

      def mail_from
        MailFrom.new
      end
    end

    module MailToContainer
      class MailTo < SdcPage
        # Mail To Drop down
        page_objects(:add_buttons) { { xpath: '//span[contains(@class, "sdc-icon-add-button")]' } }
        page_object(:dom_drop_down) { { xpath: '//*[@id="sdc-mainpanel-matltocountrydroplist-trigger-picker"]' } }
        page_object(:int_drop_down) { { xpath: '//*[@id="shiptoview-international-targetEl"]//div[contains(@id, "-trigger-picker")][starts-with(@id, "combo")]' } }
        page_objects(:dom_text_field, index: 0, tag: :text_fields) { { xpath: '//input[@name="ShipCountryCode"]' } }
        page_objects(:int_text_field, index: 1, tag: :text_fields) { { xpath: '//input[@name="ShipCountryCode"]' } }

        page_objects(:text_fields, tag: :text_fields) { { xpath: '//input[@name="ShipCountryCode"]' } }
        page_objects(:drop_downs, tag: :text_fields) { { xpath: '' } }

        page_object(:link) { { xpath: '//label[contains(@class, "sdc-mainpanel-shiptolinkbtn")]//b' } }
        # Domestic Address
        page_object(:text_area, tag: :textarea) { { xpath: '//textarea[@name="freeFormAddress"]' } }
        # International Address
        page_object(:name, tag: :text_field) { { xpath: '//input[@name="ShipName"]' } }
        page_object(:company, tag: :text_field) { { xpath: '//input[@name="ShipCompany"]' } }
        page_object(:address1, tag: :text_field) { { xpath: '//input[@name="ShipStreet1"]' } }
        page_object(:address2, tag: :text_field) { { xpath: '//input[@name="ShipStreet2"]' } }
        page_object(:city, tag: :text_field) { { xpath: '//input[@name="ShipCity"]' } }
        page_object(:province, tag: :text_field) { { xpath: '//input[@name="ShipState"]' } }
        page_object(:postal_code, tag: :text_field) { { xpath: '//input[@name="ShipPostalCode"]' } }
        page_objects(:phone, tag: :text_fields, index: 0) { { xpath: '//input[@name="ShipPhone"]' } }
        page_objects(:int_phone, tag: :text_fields, index: 1) { { xpath: '//input[@name="ShipPhone"]' } }

        def add_button
          add_buttons.each do |button|
            return SdcElement.new(button) if button.present?
          end

          error = Selenium::WebDriver::Error::NoSuchElementError
          error_message = 'Cannot get an add button'
          raise error, error_message
        end

        def drop_down
          drop_downs.each do |button|
            return SdcElement.new(button) if button.present?
          end

          error = Selenium::WebDriver::Error::NoSuchElementError
          error_message = 'Cannot get a Ship-To Country drop down'
          raise error, error_message
        end

        def text_field
          text_fields.each do |button|
            return SdcElement.new(button) if button.present?
          end

          error = Selenium::WebDriver::Error::NoSuchElementError
          error_message = 'Cannot get a Ship-To Country text field'
          raise error, error_message
        end

        def selection(name, str)
          page_object(name) { { xpath: "//li[text()='#{str}']" } }
        end

        def list_of_values(name, company)
          page_object(:mail_to_lov) { { xpath: "//div[text()='#{name}, #{company}']" } }
        end
      end

      def mail_to
        MailTo.new
      end
    end

    module EmailTrackingContainer
      class EmailTracking < SdcPage
        text_field(:text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-emailtextfield-webpostage-inputEl"]' } }
        text_field(:label, tag: :text_field) { { xpath: '//div[starts-with(@id,"printFormPanel-")][contains(@id,"-innerCt")]//input[starts-with(@id,"checkbox-")][contains(@id,"-inputEl")]' } }

      end

      def email_tracking
        EmailTracking.new
      end
    end

    module ExtraServicesContainer
      class PrintFormExtraServicesContainer < SdcPage
        page_object(:select) { { xpath: '//*[@id="sdc-mainpanel-extraservicesbtn-btnInnerEl"]' } }
        page_object(:cost) { { xpath: '//*[@id="sdc-mainpanel-extraservicespricelabel"]' } }
      end

      def extra_services
        PrintFormExtraServicesContainer.new
      end
    end

    module AdvancedOptionsContainer

      class AdvancedOptionsCostCode < SdcPage
        text_field(:text_field, tag: :text_field) { { xpath: '//input[contains(@id, "costcodesdroplist")]' } }
        page_object(:drop_down) { { xpath: '//*[contains(@id, "costcodesdroplist")][contains(@class, "arrow")]' } }

        def selection_element(name: 'selection', value: 'None')
          page_object(name) { { xpath: "//li[text()='#{value}']" } }
        end
      end

      class AdvancedOptions < SdcPage

        page_object(:reference_num, tag: :text_field) { { xpath: '//label[text()="Reference #:"]/..//input[@maxlength="50"]' } }
        page_object(:reference_num_disabled, tag: :text_field) { { xpath: '//label[text()="Reference #:"]/..//input[contains(@placeholder,"Contact List")]' } }

        page_object(:ref_num_chooser) { { xpath: '//label[text()="Use Reference # from Contact List"]/preceding-sibling::span' } }
        page_object(:ref_num_verify) { { xpath: '//label[text()="Use Reference # from Contact List"]/../../..' } }
        chooser(:use_ref_num_from_contact_list, :ref_num_chooser, :ref_num_verify, :class, :checked)

        page_object(:cost_code_disabled, tag: :text_field) { { xpath: '//label[text()="Cost Code:"]/..//input[contains(@placeholder,"Contact List")]' } }
        page_object(:cost_code_chooser) { { xpath: '//label[text()="Use Cost Code from Contact List"]/preceding-sibling::span' } }
        page_object(:cost_code_verify) { { xpath: '//label[text()="Use Cost Code from Contact List"]/../../..' } }
        chooser(:use_cost_code_from_contact_list, :cost_code_chooser, :cost_code_verify, :class, :checked)

        page_object(:hide_label_value_chooser) { { xpath: '//*[text()="Hide Label Value"]/../span' } }
        page_object(:hide_label_value_verify) { { xpath: '//*[text()="Hide Label Value"]/../../..' } }
        checkbox(:hide_label_value, :hide_label_value_chooser, :hide_label_value_verify, 'class', 'checked')

        page_object(:print_receipt_chooser) { { xpath: '//*[text()="Print Receipt"]/../span' } }
        page_object(:print_receipt_verify) { { xpath: '//*[text()="Print Receipt"]/../../..' } }
        checkbox(:print_receipt, :print_receipt_chooser, :print_receipt_verify, 'class', 'checked')

        page_object(:print_reference_chooser) { { xpath: '//*[text()="Print Reference #"]/../span' } }
        page_object(:print_reference_verify) { { xpath: '//*[text()="Print Reference #"]/../../..' } }
        checkbox(:print_reference, :print_reference_chooser, :print_reference_verify, 'class', 'checked')

        page_object(:return_address_chooser) { { xpath: '//*[text()="Return Address"]/../span' } }
        page_object(:return_address_verify) { { xpath: '//*[text()="Return Address"]/../../..' } }
        checkbox(:return_address, :return_address_chooser, :return_address_verify, 'class', 'checked')

        page_object(:delivery_address_chooser) { { xpath: '//*[text()="Delivery Address"]/../span' } }
        page_object(:delivery_address_verify) { { xpath: '//*[text()="Delivery Address"]/../../..' } }
        checkbox(:delivery_address, :delivery_address_chooser, :delivery_address_verify, 'class', 'checked')

        page_object(:postage_chooser) { { xpath: '//*[text()="Postage"]/../span' } }
        page_object(:postage_verify) { { xpath: '//*[text()="Postage"]/../../..' } }
        checkbox(:postage, :postage_chooser, :postage_verify, 'class', 'checked')

        page_object(:service_commitments) { { xpath: '//*[text()="Service Commitments"]' } }

        page_object(:certified_mail_chooser) { { id: 'sdc-mainpanel-cmcheckbox-displayEl' } }
        page_object(:certified_mail_verify) { { xpath: '//*[@id="sdc-mainpanel-cmcheckbox-bodyEl"]/..' } }
        checkbox(:certified_mail, :certified_mail_chooser, :certified_mail_verify, 'class', 'checked')

        page_object(:return_receipt_chooser) { { id: 'sdc-mainpanel-rrcheckbox-displayEl' } }
        page_object(:return_receipt_verify) { { xpath: '//*[@id="sdc-mainpanel-rrcheckbox-bodyEl"]/..' } }
        checkbox(:return_receipt, :return_receipt_chooser, :return_receipt_verify, 'class', 'checked')

        page_object(:electronic_return_receipt_chooser) { { id: 'sdc-mainpanel-rrecheckbox-displayEl' } }
        page_object(:electronic_return_receipt_verify) { { xpath: '//*[@id="sdc-mainpanel-rrecheckbox-bodyEl"]/..' } }
        checkbox(:electronic_return_receipt, :electronic_return_receipt_chooser, :electronic_return_receipt_verify, 'class', 'checked')

        page_object(:restricted_delivery_chooser) { { xpath: '//span[contains(@class, "sdc-mainpanel-rdcheckbox")]' } }
        page_object(:restricted_delivery_verify) { { xpath: '//span[contains(@class, "sdc-mainpanel-rdcheckbox")]/../../..' } }
        checkbox(:restricted_delivery, :restricted_delivery_chooser, :restricted_delivery_verify, 'class', 'checked')

        page_object(:calc_chooser) { { xpath: '//*[@id="sdc-mainpanel-calculatepostageradio-displayEl"]' } }
        page_object(:calc_verify) { { xpath: '//*[@id="sdc-mainpanel-calculatepostageradio"]' } }
        chooser(:calculate_postage_amount, :calc_chooser, :calc_verify,
                :class, :checked)

        page_object(:spec_chooser) { { xpath: '//*[@id="sdc-mainpanel-specifypostageradio-displayEl"]' } }
        page_object(:spec_verify) { { xpath: '//*[@id="sdc-mainpanel-specifypostageradio"]' } }
        chooser(:specify_postage_amount, :spec_chooser, :spec_verify,
                :class, :checked)

        def cost_code
          AdvancedOptionsCostCode.new
        end
      end

      def advanced_options
        AdvancedOptions.new
      end
    end

    module WeightContainer
      class Weight < SdcPage
        text_field(:lbs_text_field, tag: :text_field) { { xpath: '//*[@name="WeightLbs"]' } }
        page_object(:lbs_increment) { { xpath: '//*[contains(@class,"pounds")]//*[contains(@class,"up")]' } }
        page_object(:lbs_decrement) { { xpath: '//*[contains(@class,"pounds")]//*[contains(@class,"down")]' } }
        sdc_number(:lbs, :lbs_text_field, :lbs_increment, :lbs_decrement)

        text_field(:oz_text_field, tag: :text_field) { { xpath: '//*[@name="WeightOz"]' } }
        page_object(:oz_increment) { { xpath: '//*[contains(@class,"ounces")]//*[contains(@class,"up")]' } }
        page_object(:oz_decrement) { { xpath: '//*[contains(@class,"ounces")]//*[contains(@class,"down")]' } }
        sdc_number(:oz, :oz_text_field, :oz_increment, :oz_decrement)

        page_object(:weigh) { { xpath: '//span[contains(text(), "Weigh")]' } }

        page_object(:auto) { { xpath: '//*[contains(@class,"autoweight-checkbox")]//input' } }
      end

      def weight
        Weight.new
      end
    end

    module DimensionsContainer
      class Dimensions < SdcPage
        text_field(:l_text_field, tag: :text_field) { { xpath: '//*[@name="Length"]' } }
        page_object(:l_increment) { { xpath: '(//div[starts-with(@id, "dimensionsview-")]//*[contains(@class, "up")])[1]' } }
        page_object(:l_decrement) { { xpath: '(//div[starts-with(@id, "dimensionsview-")]//*[contains(@class, "down")])[1]' } }
        sdc_number(:length, :l_text_field, :l_increment, :l_decrement)

        text_field(:w_text_field, tag: :text_field) { { xpath: '//*[@name="Width"]' } }
        page_object(:w_increment) { { xpath: '(//div[starts-with(@id, "dimensionsview-")]//*[contains(@class, "up")])[2]' } }
        page_object(:w_decrement) { { xpath: '(//div[starts-with(@id, "dimensionsview-")]//*[contains(@class, "down")])[2]' } }
        sdc_number(:width, :w_text_field, :w_increment, :w_decrement)

        text_field(:h_text_field, tag: :text_field) { { xpath: '//*[@name="Height"]' } }
        page_object(:h_increment) { { xpath: '(//div[starts-with(@id, "dimensionsview-")]//*[contains(@class, "up")])[3]' } }
        page_object(:h_decrement) { { xpath: '(//div[starts-with(@id, "dimensionsview-")]//*[contains(@class, "down")])[3]' } }
        sdc_number(:height, :h_text_field, :h_increment, :h_decrement)
      end

      def dimensions
        Dimensions.new
      end
    end

    module ServiceContainer
      class Service < SdcPage
        text_field(:text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-servicedroplist-inputEl"]' } }
        page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-servicedroplist-trigger-picker"]' } }
        page_object(:cost) { { xpath: '//*[@id="sdc-mainpanel-servicepricelabel"]' } }

        def service_element(name, str)
          page_object(name) { { xpath: "//*[@id='#{data_for(:mail_services, {})[str]}']//td[@class='x-boundlist-item-text']" } }
        end

        def inline_cost_element(name, str)
          page_object(name) { { xpath: "//*[@id='#{data_for(:mail_services, {})[str]}']//td[@class='x-boundlist-item-amount']" } }
        end
      end

      def service
        Service.new
      end
    end

    module InsuranceContainer
      class Insurance < SdcPage
        text_field(:insurance_text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-insureamtnumberfield-inputEl"]' } }
        page_object(:insurance_increment) { { xpath: '//*[@id="sdc-mainpanel-insureamtnumberfield-trigger-spinner"]//*[contains(@class, "up")]' } }
        page_object(:insurance_decrement) { { xpath: '//*[@id="sdc-mainpanel-insureamtnumberfield-trigger-spinner"]//*[contains(@class, "down")]' } }
        sdc_number(:insurance, :insurance_text_field, :insurance_increment, :insurance_decrement)
        page_object(:cost) { { xpath: '//*[@id="sdc-mainpanel-insurancepricelabel"]' } }
      end

      def insure_for
        Insurance.new
      end
    end

    module TrackingContainer
      class Tracking < SdcPage
        text_field(:text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-trackingdroplist-inputEl"]' } }
        page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-trackingdroplist-trigger-picker"]' } }
        page_object(:cost) { { xpath: '//*[@id="sdc-mainpanel-trackingpricelabel"]' } }

        def tracking_element(name: "selection", value: "None")
          page_object(name) { { xpath: "//*[@id='#{data_for(:mail_tracking_service, {})[value]}']//td[@class='x-boundlist-item-text']" } }
        end

        def inline_cost_element(name, str)
          page_object(name) { { xpath: "//*[@id='#{data_for(:mail_tracking_service, {})[str]}']//td[@class='x-boundlist-item-amount']" } }
        end
      end

      def tracking
        Tracking.new
      end
    end

    module MailDateContainer
      class Picker < SdcPage
        page_object(:today) { { xpath: '//*[@class="x-datepicker-footer"]//span[contains(@id, "btnInnerEl")]' } }

        def date_elements(name, str)
          page_objects(name) { { xpath: "//div[text()='#{str}']" } }
        end

        def today_element
          page_object(:date_today) { { xpath: '//*[@class="x-datepicker-date"][@title="Today"]' } }
        end

      end

      class MailDate < SdcPage
        page_object(:picker_button) { { xpath: '//div[starts-with(@id, "datefield-")][contains(@id, "-trigger-picker")]' } }
        text_field(:text_field, tag: :text_field) { { xpath: '//input[starts-with(@id, "datefield-")]' } }

        def picker
          Picker.new
        end
      end

      def mail_date
        MailDate.new
      end
    end

    #todo-Alex tracking_label copy_tracking reprint
    module PostageMessagePanelContainer
      class MessagePanel < SdcPage
        page_object(:tracking_number) { { xpath: '//span[@id="trackingNumber"]' } }
        page_object(:tracking_label) { { xpath: '//span[@id="trackingNumber"]/..' } }
        page_object(:copy_tracking) { { xpath: '//span[text()="Copy Tracking"]' } }
        page_object(:reprint) { { xpath: '//span[text()="Reprint"]' } }
        page_object(:save_as_favorite) { { xpath: '//span[text()="Save as Favorite"]' } }
      end

      def message_panel
        MessagePanel.new
      end
    end

    class Contents < SdcPage
      page_object(:customs_form) { { xpath: '//*[@id="sdc-mainpanel-editcustombtn-btnInnerEl"]' } }
      page_object(:restrictions) { { xpath: '//*[text()="Restrictions..."]' } }
    end

    class MailMessageToolbar < SdcPage
      page_object(:message_label) { { xpath: '//div[contains(@class,"app-container-form-messages")]//label[@class="x-component x-component-default"]' } }
      page_object(:close) { { xpath: '//div[contains(@class,"app-container-form-messages")]//a//span[contains(@class,"sdc-icon-message-close-dark")]' } }
    end

    class PrintFormBase < SdcPage
      include MailFromContainer
      include MailToContainer
      include WeightContainer
      include ServiceContainer
      include AdvancedOptionsContainer

      page_object(:show_advanced_options) { { xpath: '//*[text()="Show Advanced Options"]' } }
      page_object(:hide_advanced_options) { { xpath: '//*[text()="Hide Advanced Options"]' } }

      def message_toolbar
        MailMessageToolbar.new
      end
    end

    class Stamps < PrintFormBase
      include ExtraServicesContainer
      include AdvancedOptionsContainer

      page_object(:serial_number, tag: :text_field) { { xpath: '//*[@name="NsSerial"]' } }

      # page_object(:calc_chooser) { { xpath: '//*[@id="sdc-mainpanel-calculatepostageradio-displayEl"]' } }
      # page_object(:calc_verify) { { xpath: '//*[@id="sdc-mainpanel-calculatepostageradio"]' } }
      # chooser(:calculate_postage_amount, :calc_chooser, :calc_verify,
      #         :class, :checked)
      #
      # page_object(:spec_chooser) { { xpath: '//*[@id="sdc-mainpanel-specifypostageradio-displayEl"]' } }
      # page_object(:spec_verify) { { xpath: '//*[@id="sdc-mainpanel-specifypostageradio"]' } }
      # chooser(:specify_postage_amount, :spec_chooser, :spec_verify,
      #         :class, :checked)

      text_field(:qty_text_field, tag: :text_field) { { xpath: '//*[@name="NsQuantity"]' } }
      page_object(:qty_increment) { { xpath: '//*[contains(@id,"printPreviewPanel-")]//*[contains(@class,"up")]' } }
      page_object(:qty_decrement) { { xpath: '//*[contains(@id,"printPreviewPanel-")]//*[contains(@class,"down")]' } }
      sdc_number(:quantity, :qty_text_field, :qty_increment, :qty_decrement)

      text_field(:amt_text_field, tag: :text_field) { { xpath: '//*[@name="NsSpecifyAmount"]' } }
      page_object(:amt_increment) { { xpath: '//*[@name="NsSpecifyAmount"]/../..//*[contains(@class,"up")]' } }
      page_object(:amt_decrement) { { xpath: '//*[@name="NsSpecifyAmount"]/../..//*[contains(@class,"down")]' } }
      sdc_number(:stamp_amount, :amt_text_field, :amt_increment, :amt_decrement)

      page_object(:print_all_chooser) { { xpath: '//*[text()="Print All"]/../span' } }
      page_object(:print_all_verify) { { xpath: '//*[text()="Print All"]/../../..' } }
      checkbox(:print_all, :print_all_chooser, :print_all_verify, 'class', 'checked')
    end

    class ShippingLabels < PrintFormBase
      include EmailTrackingContainer
      include InsuranceContainer
      include TrackingContainer
      include DimensionsContainer
      include ExtraServicesContainer
      include MailDateContainer
      include PostageMessagePanelContainer

      def contents
        Contents.new
      end
    end

    class Envelopes < PrintFormBase
      include ExtraServicesContainer
      include InsuranceContainer
      include MailDateContainer

    end

    class CertifiedMail < PrintFormBase
      include EmailTrackingContainer
      include DimensionsContainer
      include InsuranceContainer
      include MailDateContainer

      page_object(:cm_chooser) { { xpath: '//*[@id="sdc-mainpanel-cmcheckbox-inputEl"]' } }
      page_object(:cm_verify) { { xpath: '//*[@id="sdc-mainpanel-cmcheckbox"]' } }
      chooser(:certified_mail, :cm_chooser, :cm_verify, :class, :checked)
      page_object(:certified_mail_cost) { { xpath: '//*[@id="sdc-mainpanel-cmpricelabel"]' } }

      page_object(:rr_chooser) { { xpath: '//*[@id="sdc-mainpanel-rrcheckbox-inputEl"]' } }
      page_object(:rr_verify) { { xpath: '//*[@id="sdc-mainpanel-rrcheckbox"]' } }
      chooser(:return_receipt, :rr_chooser, :rr_verify, :class, :checked)
      page_object(:return_receipt_cost) { { xpath: '//*[@id="sdc-mainpanel-rrpricelabel"]' } }

      page_object(:err_chooser) { { xpath: '//*[@id="sdc-mainpanel-rrecheckbox-inputEl"]' } }
      page_object(:err_verify) { { xpath: '//*[@id="sdc-mainpanel-rrecheckbox"]' } }
      chooser(:electronic_return_receipt, :err_chooser, :err_verify, :class, :checked)
      page_object(:electronic_return_receipt_cost) { { xpath: '//*[@id="sdc-mainpanel-rrepricelabel"]' } }

      page_object(:rd_chooser) { { xpath: '//input[contains(@class, "sdc-mainpanel-rdcheckbox")]' } }
      page_object(:rd_verify) { { xpath: '//input[contains(@class, "sdc-mainpanel-rdcheckbox")]/../../..' } }
      chooser(:restricted_delivery, :rd_chooser, :rd_verify, :class, :checked)
      page_object(:restricted_delivery_cost) { { xpath: '//*[@id="restrictedDeliveryCostLabel"]' } }

    end

    class Rolls < PrintFormBase
      include EmailTrackingContainer
      include InsuranceContainer
      include TrackingContainer
      include DimensionsContainer
      include ExtraServicesContainer
      include MailDateContainer

      def contents
        Contents.new
      end
    end
  end
end
