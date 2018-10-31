module SdcHistory
  module Modals
    class << self
      def refund
        Refund.new
      end

      def manage_pickups
        ManagePickups.new
      end

      def schedule_pickup
        SchedulePickup.new
      end

      def schedule_pickup_confirm
        SchedulePickupConfirm.new
      end

      def pickup_error
        PickupError.new
      end

      def scan_form
        ScanForm.new
      end

      def reprint_scan_form
        ReprintScanForm.new
      end

      def change_cost_code
        ChangeCostCode.new
      end

      def return_label
        ReturnLabel.new
      end

      def container_label
        ContainerLabel.new
      end

      def ready_to_print
        ReadyToPrint.new
      end

      def your_container_label
        YourContainerLabel.new
      end

      def reprint
        Reprint.new
      end

      def welcome
        Welcome.new
      end
    end

    class SchedulePickupState < SdcPage
      page_object(:text_field, tag: :text_field) { { xpath: '//input[@name="State"]' } }
      page_object(:drop_down) { { xpath: '//input[@name="State"]/../../*[contains(@class, "trigger")]' } }

      def selection(str)
        page_object(:selection_obj) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    class SchedulePickupPackageLocation < SdcPage
      page_object(:text_field, tag: :text_field) { { xpath: '//input[@name="PackageLocation"]' } }
      page_object(:drop_down) { { xpath: '//input[@name="PackageLocation"]/../../*[contains(@class, "trigger")]' } }

      def selection(str)
        page_object(:selection_obj) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    class NewCostCode < SdcPage
      page_object(:text_field, tag: :text_field) { { xpath: '//div[contains(@id, "changeCostCode")]//input' } }
      page_object(:drop_down) { { xpath: '//div[contains(@id, "changeCostCode")]//*[contains(@class, "arrow")]' } }

      def selection(str)
        page_object(:selection_obj) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    class ScanFormError < SdcPage
      #title, xbtn, close, learn more
    end

    class ReturnLabelService < SdcPage
      text_field(:s_text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-servicedroplist-inputEl"]' } }
      page_object(:s_drop_down) { { xpath: '//*[@id="sdc-mainpanel-servicedroplist-trigger-picker"]' } }
      page_object(:cost) { { xpath: '//*[@id="sdc-mainpanel-servicepricelabel"]' } }

      def service_element(name, str)
        page_object(name) { { xpath: "//*[@id='#{data_for(:mail_services, {})[str]}']//td[@class='x-boundlist-item-text']" } }
      end

      def inline_cost_element(name, str)
        page_object(name) { { xpath: "//*[@id='#{data_for(:mail_services, {})[str]}']//td[@class='x-boundlist-item-amount']" } }
      end
    end

    class ReturnLabelInsurance < SdcPage
      text_field(:insurance_text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-insureamtnumberfield-inputEl"]' } }
      page_object(:insurance_increment) { { xpath: '//*[@id="sdc-mainpanel-insureamtnumberfield-trigger-spinner"]//*[contains(@class, "up")]' } }
      page_object(:insurance_decrement) { { xpath: '//*[@id="sdc-mainpanel-insureamtnumberfield-trigger-spinner"]//*[contains(@class, "down")]' } }
      sdc_number(:insurance, :insurance_text_field, :insurance_increment, :insurance_decrement)
      page_object(:cost) { { xpath: '//*[@id="sdc-mainpanel-insurancepricelabel"]' } }
    end

    class ReturnLabelTracking < SdcPage
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

    class ReturnLabelCostCode < SdcPage
      text_field(:text_field, tag: :text_field) { { xpath: '//*[@name="CostCode"]' } }
      page_object(:drop_down) { { xpath: '//input[@name="CostCode"]/../../*[contains(@class, "trigger")]' } }

      def selection(str)
        page_object(:selection_obj) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    class PrintingOn < SdcPage
      page_object(:text_field) { { xpath: '//input[contains(@id, "printmediadroplist")]' } }
      page_object(:drop_down) { { xpath: '//div[contains(@id, "printmediadroplist")]//div[contains(@class, "arrow")]' } }

      def selection_element(name: :selection, value: 'factory')
        page_object(name) { { xpath: "//li[text()='#{value}']" } }
      end
    end

    class Printer < SdcPage
      page_object(:text_field) { { xpath: '//input[contains(@name, "printers")]' } }
      page_object(:drop_down) { { xpath: '//input[contains(@name, "printers")]/parent::*/parent::*/div[contains(@id, "trigger-picker")]' } }

      def selection_element(name: :selection, value: 'factory')
        page_object(name) { { xpath: "//li[text()='#{value}']" } }
      end
    end

    class PaperTray < SdcPage
      page_object(:text_field, tag: :text_field) { { xpath: '//*[text()="Paper Tray:"]/../..//input' } }
      page_object(:drop_down) { { xpath: '//*[text()="Paper Tray:"]/../..//div[contains(@class, "arrow")]' } }

      def selection_element(name: :selection, value: 'Normal')
        page_object(name) { { xpath: "//li[text()='#{value}']" } }
      end
    end

    class Refund < SdcPage
      page_object(:title) { {xpath: '//*[contains(@class, "x-title-text")][text()="Refund"]'} }
      page_object(:submit) { {xpath: '//*[text()="Submit"]'} }
      page_object(:cancel) { {xpath: '//*[text()="Cancel"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
    end

    class ManagePickups < SdcPage
      page_object(:title) { {xpath: '//*[contains(@class, "x-title-text")][text()="Manage Pickups"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:edit_pickup) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:cancel_pickup) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }

      def row_select(num)
        page_object(:row) { {xpath: "(//div[contains(@id, 'manage-pickup-window')]//tr)[#{num}]" } }
      end
    end

    class SchedulePickup < SdcPage
      page_object(:title) { {xpath: '//*[text()="Schedule Pickup"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:submit) { {xpath: '//*[text()="Submit"]'} }
      page_object(:cancel) { {xpath: '//*[text()="Cancel"]'} }

      page_object(:first_name, tag: :text_field) { {xpath: '//input[@name="FirstName"]'} }
      page_object(:last_name, tag: :text_field) { {xpath: '//input[@name="LastName"]'} }
      page_object(:company, tag: :text_field) { {xpath: '//input[@name="Company"]'} }
      page_object(:address, tag: :text_field) { {xpath: '//input[@name="Address"]'} }
      page_object(:city, tag: :text_field) { {xpath: '//input[@name="City"]'} }
      page_object(:zip, tag: :text_field) { {xpath: '//input[@name="Zip"]'} }
      page_object(:phone_number, tag: :text_field) { {xpath: '//input[@name="PhoneNumber"]'} }
      page_object(:phone_ext, tag: :text_field) { {xpath: '//input[@name="PhoneExt"]'} }
      page_object(:express_mail_pieces, tag: :text_field) { {xpath: '//input[@name="ExpressMailPieces"]'} }
      page_object(:priority_mail_pieces, tag: :text_field) { {xpath: '//input[@name="PriorityMailPieces"]'} }
      page_object(:international_pieces, tag: :text_field) { {xpath: '//input[@name="InternationalPieces"]'} }
      page_object(:first_class_pieces, tag: :text_field) { {xpath: '//input[@name="FirstClassPieces"]'} }
      page_object(:other_pieces, tag: :text_field) { {xpath: '//input[@name="OtherPieces"]'} }
      page_object(:estimated_weight, tag: :text_field) { {xpath: '//input[@name="EstimatedWeight"]'} }
      page_object(:special_instructions, tag: :text_field) { {xpath: '//input[@name="SpecialInstructions"]'} }

      def state
        SchedulePickupState.new
      end

      def package_location
        SchedulePickupPackageLocation.new
      end
    end

    class SchedulePickupConfirm < SdcPage
      page_object(:title) { {xpath: '//*[text()="Schedule Pickup"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:print_scan_form) { {xpath: '//*[text()="Print Scan Form"]'} }
      page_object(:done) { {xpath: '//*[text()="Done"]'} }
    end

    class PickupError < SdcPage
      page_object(:title) { {xpath: '//*[text()="Pickup Error"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:close) { {xpath: '//*[text()="Close"]'} }
      page_object(:learn_more) { {xpath: '//*[text()="Learn More"]'} }
    end

    class ScanForm < SdcPage
      page_object(:title) { {xpath: '//div[contains(@id,"title")][text()="SCAN Form"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:close) { {xpath: '//*[text()="Close"]'} }
      page_object(:print_scan_form) { {xpath: '//*[text()="Print SCAN Form"]'} }

      page_object(:chooser_elem) { { xpath: '//div[contains(@id, "scan-confirmation")]//span[contains(@id, "checkbox")]' } }
      page_object(:verify_elem) { { xpath: '//div[contains(@id, "scan-confirmation")]//div[contains(@class, "checkbox")]' } }
      checkbox(:print_details, :chooser_elem, :verify_elem, 'class', 'checked')
    end

    class ReprintScanForm < SdcPage
      page_object(:title) { {xpath: '//div[text()="Reprint SCAN Form"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:close) { {xpath: '//*[text()="Close"]'} }
      page_object(:print_scan_form) { {xpath: '//*[text()="Print SCAN Form"]'} }
      page_object(:print_details) { {xpath: '//*[text()="Print Details"]'} }

      def row_select(num)
        page_object(:row) { {xpath: "(//div[contains(@id, 'reprint-scan-form')]//tr)[#{num}]"} }
      end
    end

    class ChangeCostCode < SdcPage
      page_object(:title) { {xpath: '//div[text()="Change Cost Code"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:save) { {xpath: '//*[text()="Save"]'} }

      def new_cost_code
        NewCostCode.new
      end
    end

    class ReturnLabel < SdcPage
      page_object(:title) { {xpath: '//*[text()="Return Label"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:continue) { {xpath: '//*[text()="Continue"]'} }
      page_object(:from, tag: :textarea) { {xpath: '//textarea[@name="ReturnFrom"]'} }
      page_object(:to, tag: :textarea) { {xpath: '//textarea[@name="ReturnTo"]'} }

      #
      text_field(:lbs_text_field, tag: :text_field) { { xpath: '//*[@name="WeightLbs"]' } }
      page_object(:lbs_increment) { { xpath: '//*[contains(@class,"pounds")]//*[contains(@class,"up")]' } }
      page_object(:lbs_decrement) { { xpath: '//*[contains(@class,"pounds")]//*[contains(@class,"down")]' } }
      sdc_number(:lbs, :lbs_text_field, :lbs_increment, :lbs_decrement)

      text_field(:oz_text_field, tag: :text_field) { { xpath: '//*[@name="WeightOz"]' } }
      page_object(:oz_increment) { { xpath: '//*[contains(@class,"ounces")]//*[contains(@class,"up")]' } }
      page_object(:oz_decrement) { { xpath: '//*[contains(@class,"ounces")]//*[contains(@class,"down")]' } }
      sdc_number(:oz, :oz_text_field, :oz_increment, :oz_decrement)
      #

      page_object(:rma_memo, tag: :text_field) { {xpath: '//*[@name="RMAMemo"]'} }
      page_object(:total) { {xpath: '(//*[text()="Total:"]/../*)[2]'} }

      def service
        ReturnLabelService.new
      end

      def insure_for
        Insurance.new
      end

      def tracking
        Tracking.new
      end

      def cost_code
        ReturnLabelCostCode.new
      end
    end

    class ContainerLabel < SdcPage
      page_object(:title) { {xpath: '//div[contains(@id,"title")][text()="Container Label"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:cancel) { {xpath: '//*[text()="Cancel"]'} }
      page_object(:print_label) { {xpath: '//*[text()="Print Label"]'} }
      page_object(:packages) { {xpath: '//*[contains(@id, "containerLabelModal")]//p/b'} }

      text_field(:nc_text_field, tag: :text_field) { { xpath: '//*[contains(@id, "containerLabelModal")]//input' } }
      page_object(:nc_increment) { { xpath: '//*[contains(@id, "containerLabelModal")]//*[contains(@class, "up")]' } }
      page_object(:nc_decrement) { { xpath: '//*[contains(@id, "containerLabelModal")]//*[contains(@class, "down")]' } }
      sdc_number(:number_container, :nc_text_field, :nc_increment, :nc_decrement)
    end

    class ReadyToPrint < SdcPage
      page_object(:title) { {xpath: '//div[contains(text(), "ready to print")]'} }
      page_object(:print) { {xpath: '//*[text()="Print"]'} }
      page_object(:total_cost) { {xpath: '//*[text()="Total Cost:"]/..//div[contains(test(), "$")]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }

      def printing_on
        PrintingOn.new
      end
      def printer
        Printer.new
      end

      def paper_tray
        PaperTray.new
      end
    end

    class YourContainerLabel < SdcPage
      page_object(:title) { {xpath: '//div[contains(@id,"title")][text()="Your Container Label"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:close) { {xpath: '//*[text()="Close"]'} }
      page_object(:reprint) { {xpath: '//*[text()="Reprint"]'} }
    end

    class Reprint < SdcPage
      page_object(:title) { {xpath: '//div[text()="Reprint"]'} }
      page_object(:reprint) { {xpath: '//span[text()="Reprint"]'} }
      page_object(:total_cost) { {xpath: '//*[text()="Total Cost:"]/..//div[contains(test(), "$")]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }

      def printing_on
        PrintingOn.new
      end
      def printer
        Printer.new
      end

      def paper_tray
        PaperTray.new
      end
    end

    class Welcome < SdcPage
      page_object(:title) { {xpath: '//*[text()="Welcome!"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:next) { {xpath: '//*[text()="Next"]'} }
      page_object(:close) { {xpath: '//*[text()="Close"]'} }
      page_object(:learn_more) { {xpath: '//*[text()="Learn More"]'} }
    end
  end
end
