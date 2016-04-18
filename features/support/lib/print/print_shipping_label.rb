# encoding: utf-8
module Print
  module Postage

    class ShippingLabelFormView < Print::Postage::PrintPostage

      def preview_image
        image = StampsLabel.new @browser.div :css => "div[style*='Label_selection_and_view.gif']"
      end

      def hide_postage_value
        checkbox_field = @browser.input :css => "input[id=hidePostageCheckbox]"
        verify_fields = @browser.inputs :css => "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[5]

        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def print_receipt
        checkbox_field = @browser.input :css => "input[id=printreceiptcheckbox]"
        verify_fields = @browser.inputs :css => "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[6]

        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def print_reference_number
        checkbox_field = @browser.input :css => "input[id=printreferencecheckbox]"
        verify_fields = @browser.inputs :css => "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[7]

        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def reference_number
        StampsTextbox.new @browser.text_field :name => "referenceNumber"
      end

      def cost_code
        Print::Postage::CostCode.new @browser
      end

      def starting_label
        Print::Postage::ShippingLabelFormView::StartingLabel.new @browser
      end

      class StartingLabel < Print::Postage::PrintObject
        def label_divs
          @browser.divs :css => "div[class*='unprintedLabel']"
        end

        def left_label_div
          label_divs[0]
        end

        def right_label_div
          label_divs[1]
        end

        def left
          10.times{
            begin
              browser_helper.safe_click left_label_div, "left_label"
              return true if label_selected? left_label_div
            rescue
              #ignore
            end
          }
          false
        end

        def right
          10.times{
            begin
              browser_helper.safe_click right_label_div, "right_label"
              return true if label_selected? right_label_div
            rescue
              #ignore
            end
          }
          false
        end

        def left_selected?
          label_selected? left_label_div
        end

        def right_selected?
          label_selected? right_label_div
        end

        def label_selected? div
          8.times{
            selected = browser_helper.attribute_value(div, 'class').include? 'selectedLabel'
            log.info "Label selected?  #{(selected)? 'Yes':'No'}"
            break if selected
          }
          browser_helper.attribute_value(div, 'class').include? 'selectedLabel'
        end

        def default_selected?
          label_selected? left_label_div
        end
      end


    end

    class ShippingLabel < Print::Postage::PrintPostage

      def email_tracking
        Print::Postage::Email.new @browser
      end

      def weight
        Print::Postage::Weight.new @browser
      end

      def service
        Print::Postage::Service.new @browser
      end

      def insure_for
        Print::Postage::InsureFor.new @browser
      end

      def extra_services
        button = StampsButton.new @browser.span :id => "sdc-mainpanel-extraservicesbtn-btnIconEl"
        service_modal = Print::Postage::ExtraServices.new @browser
        5.times do
          button.safe_click
          sleep 1
          return service_modal if service_modal.present?
        end
        stop_test "Unable to open Extra Services Modal, check your code." unless service_modal.present?
      end
      def contacts
        Print::Postage::Contacts.new @browser
      end

      def ship_date
        Print::Postage::ShipDate.new @browser
      end

      def form_view
        Print::Postage::ShippingLabelFormView.new @browser
      end

    end
  end
end