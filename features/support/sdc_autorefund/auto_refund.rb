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
        page_object(:success_msg) { { xpath: '//p[@class="message success"]' } }
      end
      klass.new.success_msg
    end

    def fail_msg
      klass = Class.new(SdcPage) do
        page_object(:fail_msg) { { xpath: '//*[text()="Update failed. Please wait a few minutes and try again."]' } }
      end
      klass.new.fail_msg
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

    def rows
      klass = Class.new(SdcPage) do
        page_objects(:rows) { { xpath: '//td[@class="col-status"]' } }
      end
      klass.new.rows
    end
  end
end