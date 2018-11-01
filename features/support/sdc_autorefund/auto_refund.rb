module SdcAutoRefund

  class << self
    def loading
      klass = Class.new(SdcPage) do
        page_object(:loading) { { xpath: '//div[text()="Loading..."]' } }
      end
      klass.new.loading
    end

    def title
      klass = Class.new(SdcPage) do
        page_object(:title) { { xpath: '//*[text()="RefundAssist Report"]' } }
      end
      klass.new.title
    end

    def terms_conditions
      klass = Class.new(SdcPage) do
        page_object(:terms_conditions) { { xpath: '//a[text()="Stamps.com terms and conditions"]' } }
      end
      klass.new.terms_conditions
    end

    def update_label_status
      klass = Class.new(SdcPage) do
        page_object(:update_label_status) { { xpath: '//*[text()="Update Label Status"]' } }
      end
      klass.new.update_label_status
    end

    def updating
      klass = Class.new(SdcPage) do
        page_object(:updating) { { xpath: '//*[text()="Updating..."]' } }
      end
      klass.new.updating
    end

    def success_msg
      klass = Class.new(SdcPage) do
        page_object(:success_msg) { { xpath: '//*[text()="Thank you! Your label status has been updated."]' } }
      end
      klass.new.success_msg
    end

    def fail_msg
      klass = Class.new(SdcPage) do
        page_object(:fail_msg) { { xpath: '//*[text()="Update failed. Please wait a few minutes and try again."]' } }
      end
      klass.new.fail_msg
    end

    def not_shipped_all
      klass = Class.new(SdcPage) do
        page_objects(:not_shipped_all, tag: :radio) { { xpath: '//include[contains(@id, "is-not-opt-out")]' } }
      end
      klass.new.not_shipped_all
    end

    def shipped_all
      klass = Class.new(SdcPage) do
        page_objects(:shipped_all, tag: :radio) { { xpath: '//include[contains(@id, "is-opt-out")]' } }
      end
      klass.new.shipped_all
    end

    def not_shipped(num)
      klass = Class.new(SdcPage) do
        page_object(:not_shipped, tag: :radio) { { xpath: "(//*[contains(@id, 'is-not-opt-out')])[#{num}]" } }
      end
      klass.new.not_shipped
    end

    def not_shipped_label(num)
      klass = Class.new(SdcPage) do
        page_object(:not_shipped_label) { { xpath: "(//*[contains(@id, 'is-not-opt-out')]/following-sibling::*)[#{num}]" } }
      end
      klass.new.not_shipped_label
    end

    def shipped(num)
      klass = Class.new(SdcPage) do
        page_object(:shipped, tag: :radio) { { xpath: "(//*[contains(@id, 'is-opt-out')])[#{num}]" } }
      end
      klass.new.shipped
    end

    def shipped_label(num)
      klass = Class.new(SdcPage) do
        page_object(:shipped_label) { { xpath: "(//*[contains(@id, 'is-opt-out')]/following-sibling::*)[#{num}]" } }
      end
      klass.new.shipped_label
    end


    # def shipped(num)
    #   klass = Class.new(SdcPage) do
    #     page_object(:shipped) { { xpath: "(//*[contains(@id, 'is-opt-out')])[#{num}]" } }
    #   end
    #   klass.new.shipped
    # end
    #
    # def shipped(num)
    #   Shipped.new(num)
    # end
  end

  class Shipped < SdcPage
    def initialize(num)
      @val = num
    end

    page_object(:shipped_obj) { { xpath: "(//*[contains(@id, 'is-opt-out')])[#{@val}]" } }
  end

  # class SdcAutoRefund < SdcPage
    # page_object(:loading) { { xpath: '//div[text()="Loading..."]' } }
    # page_object(:title) { { xpath: '//*[text()="RefundAssist Report"]' } }
    # page_object(:terms_conditions) { { xpath: '//a[text()="Stamps.com terms and conditions"]' } }
    # page_object(:update_label_status) { { xpath: '//*[text()="Update Label Status"]' } }
    # page_object(:updating) { { xpath: '//*[text()="Updating..."]' } }
    # page_object(:success_msg) { { xpath: '//*[text()="Thank you! Your label status has been updated."]' } }
    # page_object(:fail_msg) { { xpath: '//*[text()="Update failed. Please wait a few minutes and try again."]' } }
    # page_objects(:not_shipped_all) {{ xpath: '//*[contains(@id, "is-not-opt-out")]' }}
    # page_objects(:shipped_all) {{ xpath: '//*[contains(@id, "is-opt-out")]' }}
    #
    # def not_shipped(num)
    #   page_object(:not_shipped) {{ xpath: "(//*[contains(@id, 'is-not-opt-out')])[#{num}]" }}
    # end

  #   def shipped(num)
  #     page_object(:shipped) {{ xpath: "(//*[contains(@id, 'is-opt-out')])[#{num}]" }}
  #   end
  # end

end