module Stamps
  module Orders
    ##
    # Orders Loading Orders... modal
    module LoadingOrders
      def loading_orders
        cache[:loading_orders].nil? || !cache[:loading_orders].present? ? cache[:loading_orders] = StampsField.new(browser.div(text: 'Loading orders...')) : cache[:loading_orders]
      end
    end

    ##
    # Orders floating modals
    module StampsOrdersModals
      def orders_print_modal
        cache[:orders_print_modal] = Printing::OrdersPrintModal.new(param) if cache[:orders_print_modal].nil?
        cache[:orders_print_modal]
      end

      def orders_settings_modal
        cache[:orders_settings] = OrdersSettings::OrdersSettingsModal.new(param) if cache[:orders_settings].nil?
        cache[:orders_settings]
      end

      def split_order_modal
        cache[:split_order] = SplitOrder::Modal.new(param) if cache[:split_order].nil?
        cache[:split_order]
      end

      def customs_form
        cache[:customs_form] = Stamps::Common::Customs::CustomsInformation.new(param) if cache[:customs_form].nil?
        cache[:customs_form]
      end

      def insurance_terms_conditions
        ::SingleOrder::InsuranceTermsConditions.new(param) #todo-Rob-usps-terms move set_and_agree_to_terms out of page object onto step def.
      end
    end

    module TermsAndConditions
      class TermsAndConditionsModal < Stamps::Browser::Base
        def present?
          i_agree_button.present?
        end

        def wait_until_present(*args)
          i_agree_button.wait_until_present(*args)
        end

        def i_agree_button
          cache[:i_agree] = StampsInput.new(browser.iframe(css: "iframe[id^=component-]").input(class: 'acceptBtn stamps')) if cache[:i_agree].nil? || !cache[:i_agree].present?
          cache[:i_agree]
        end

        def i_agree
          15.times do
            i_agree_button.click
            break unless present?
          end
        end

        def form_body
          cache[:form_body] = StampsField.new(browser.iframe(css: "iframe[id^=component-]").form.div(css: "[class=form-body]").ps[0]) if cache[:form_body].nil? || !cache[:form_body].present?
          cache[:form_body]
        end

        def close
          cache[:close] = StampsField.new(browser.img(css: "[class*=x-tool-close]")) if cache[:close].nil? || !cache[:close].present?
          cache[:close]
        end
      end

      def terms_conditions
        cache[:terms_conditions] = TermsAndConditionsModal.new(param) if cache[:terms_conditions].nil? || !cache[:terms_conditions].present?
        cache[:terms_conditions]
      end
    end
  end
end
