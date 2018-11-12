module SdcOrders
  class SdcBulkUpdate < SdcPage
    page_object(:title) { { xpath: '(//div[contains(@class, "multiorder-detailsform")]//label[contains(@class, "panel-header-text")])[1]' } }
    # page_object(:update_orders) { { xpath: '(//div[contains(@class, "update-control-row")]//*[contains(@id, "btnWrap")])[1]' } }
    page_object(:update_orders) { { xpath: '//*[text()="Update Orders"]' } }
    page_object(:save_preset) { { xpath: '(//div[contains(@class, "update-control-row")]//*[contains(@id, "btnWrap")])[2]' } }


    def ship_from
      SdcBulkShipFrom.new
    end

    def weight
      SdcBulkWeight.new
    end

    def dom_service
      SdcBulkDomService.new
    end

    def intl_service
      SdcBulkIntlService.new
    end

    def insurance
      SdcBulkInsurance.new
    end

    def isure_amt
      SdcBulkInsureAmt.new
    end

    def tracking
      SdcBulkTracking.new
    end

    def dimensions
      SdcBulkDimensions.new
    end
  end

  class SdcBulkShipFrom < SdcPage
    page_object(:ship_from_chooser) { { xpath: '//div[contains(@class, "shipfrom-row")]//span[contains(@class, "checkbox")]' } }
    page_object(:ship_from_verify) { { xpath: '//div[contains(@class, "shipfrom-row")]//div[contains(@class, "checkbox")]' } }
    chooser(:checkbox, :ship_from_chooser, :ship_from_verify, 'class', 'checked')

    page_object(:drop_down) { { xpath: '(//div[starts-with(@id, "shipfromdroplist")]/div[contains(@id, "trigger-picker")])[2]' } }
    page_object(:text_field) { { xpath: '(//input[starts-with(@id, "shipfromdroplist")])[2]' } }

    def selection_element(name: :selection, value: str)
      return page_object(name) { { xpath: '(//li[contains(@class, "x-boundlist-item")])[2]' } } if value == "default"
      page_object(name) { { xpath: "//li[contains(text(), '#{value}')]" } }
    end
  end

  class SdcBulkWeight < SdcPage
    page_object(:weight_chooser) { { xpath: '(//div[contains(@class, "weight-row")]//span[contains(@id, "checkbox")])[1]' } }
    page_object(:weight_verify) { { xpath: '(//div[contains(@class, "weight-row")]//div[contains(@class, "checkbox")])[1]' } }
    chooser(:checkbox, :weight_chooser, :weight_verify, 'class', 'checked')

    text_field(:lbs_tf, tag: :text_field) { { xpath: '(//div[contains(@class, "pounds-numberfield")]//input)[2]' } }
    page_object(:lbs_inc) { { xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-up")])[2]' } }
    page_object(:lbs_dec) { { xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-down")])[2]' } }
    sdc_number(:lbs, :lbs_tf, :lbs_inc, :lbs_dec)

    text_field(:oz_tf, tag: :text_field) { { xpath: '(//div[contains(@class, "ounces-numberfield")]//input)[2]' } }
    page_object(:oz_inc) { { xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-up")])[2]' } }
    page_object(:oz_dec) { { xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-down")])[2]' } }
    sdc_number(:oz, :oz_tf, :oz_inc, :oz_dec)
  end

  class SdcBulkDomService < SdcPage
    page_object(:domservice_chooser) { { xpath: '//div[contains(@class, "domestic-service-row")]//span[contains(@class, "checkbox")]' } }
    page_object(:domservice_verify) { { xpath: '//div[contains(@class, "domestic-service-row")]//div[contains(@class, "checkbox")]' } }
    chooser(:checkbox, :domservice_chooser, :domservice_verify, 'class', 'checked')

    page_object(:drop_down, required: true, timeout: 40) { { xpath: '(//div[contains(@id, "servicedroplist")]//div[contains(@id, "trigger-picker")])[2]' } }
    page_object(:text_field, required: true, timeout: 40) { { xpath: '(//input[contains(@id, "servicedroplist")])[2]' } }

    def selection_elements(name: :selection, value: 'Manage Service Options...')
      id = data_for(:orders_services, {})[value]
      xpath = "//li[@id='#{id}']"
      page_objects(name) { { xpath: xpath } }
    end
  end

  class SdcBulkIntlService < SdcPage
    page_object(:intlservice_chooser) { { xpath: '//div[contains(@class, "intl-service-row")]//span[contains(@class, "checkbox")]' } }
    page_object(:intlservice_verify) { { xpath: '//div[contains(@class, "intl-service-row")]//div[contains(@class, "checkbox")]' } }
    chooser(:checkbox, :intlservice_chooser, :intlservice_verify, 'class', 'checked')

    page_object(:drop_down, required: true, timeout: 40) { { xpath: '(//div[contains(@id, "servicedroplist")]//div[contains(@id, "trigger-picker")])[3]' } }
    page_object(:text_field, required: true, timeout: 40) { { xpath: '(//input[contains(@id, "servicedroplist")])[3]' } }

    def selection_elements(name: :selection, value: 'Manage Service Options...')
      id = data_for(:orders_services, {})[value]
      xpath = "//li[@id='#{id}']"
      page_objects(name) { { xpath: xpath } }
    end
  end

  class SdcBulkInsurance < SdcPage
    page_object(:insurance_chooser) { { xpath: '//div[contains(@class, "insurance-row")]//span[contains(@class, "checkbox")]' } }
    page_object(:insurance_verify) { { xpath: '//div[contains(@class, "insurance-row")]//div[contains(@class, "checkbox")]' } }
    chooser(:checkbox, :insurance_chooser, :insurance_verify, 'class', 'checked')

    page_object(:drop_down) { { xpath: '//div[contains(@class, "insurance-row")]//div[contains(@id, "trigger-picker")' } }
    page_object(:text_field) { { xpath: '//*[@placeholder="Select an Insurance Service"]' } }

    def selection_element(name: :selection, value: str)
      page_object(name) { { xpath: "//li//td[text()='#{value}']" } }
    end
  end

  class SdcBulkInsureAmt < SdcPage
    page_object(:insureamt_chooser) { { xpath: '//div[contains(@class, "insurance-amt-row")]//span[contains(@class, "checkbox")]' } }
    page_object(:insureamt_verify) { { xpath: '//div[contains(@class, "insurance-amt-row")]//div[contains(@class, "checkbox")]' } }
    chooser(:checkbox, :insureamt_chooser, :insureamt_verify, 'class', 'checked')

    text_field(:text_f, tag: :text_field) { { xpath: '(//input[contains(@id, "insurancefield")])[2]' } }
    page_object(:increment) { { xpath: '(//div[contains(@id, "insurancefield")]//div[contains(@class, "x-form-spinner-up")])[2]' } }
    page_object(:decrement) { { xpath: '(//div[contains(@id, "insurancefield")]//div[contains(@class, "x-form-spinner-down")])[2]' } }
    sdc_number(:amount, :text_f, :increment, :decrement)
  end

  class SdcBulkTracking < SdcPage
    page_object(:tracking_chooser) { { xpath: '//div[contains(@class, "tracking-row")]//span[contains(@class, "checkbox")]' } }
    page_object(:tracking_verify) { { xpath: '//div[contains(@class, "tracking-row")]//div[contains(@class, "checkbox")]' } }
    chooser(:checkbox, :tracking_chooser, :tracking_verify, 'class', 'checked')

    page_object(:drop_down) { { xpath: '(//div[contains(@id, "trackingdroplist")]//div[contains(@id, "trigger-picker")])[2]' } }
    page_object(:text_field) { { xpath: '(//input[contains(@id, "trackingdroplist")])[2]' } }

    def selection(name: :selection, value: str)
      page_object(name) { { xpath: "//li//td[text()='#{value}']" } }
    end
  end

  class SdcBulkDimensions < SdcPage
    page_object(:dimension_chooser) { { xpath: '//div[contains(@class, "dimension-row")]//span[contains(@class, "checkbox")]' } }
    page_object(:dimension_verify) { { xpath: '//div[contains(@class, "dimension-row")]//div[contains(@class, "checkbox")]' } }
    chooser(:checkbox, :dimension_chooser, :dimension_verify, 'class', 'checked')

    text_field(:len_tf, tag: :text_field) { { xpath: '(//*[contains(@class, "lengthnumberfield")])[2]' } }
    page_object(:len_inc) { { xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[2]' } }
    page_object(:len_dec) { { xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[2]' } }
    sdc_number(:length, :len_tf, :len_inc, :len_dec)

    text_field(:wid_tf, tag: :text_field) { { xpath: '(//*[contains(@class, "widthnumberfield")])[2]' } }
    page_object(:wid_inc) { { xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[2]' } }
    page_object(:wid_dec) { { xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[2]' } }
    sdc_number(:width, :wid_tf, :wid_inc, :wid_dec)

    text_field(:oz_tf, tag: :text_field) { { xpath: '(//*[contains(@class, "heightnumberfield")])[2]' } }
    page_object(:oz_inc) { { xpath: '(//*[contains(@class, "heightnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[2]' } }
    page_object(:oz_dec) { { xpath: '(//*[contains(@class, "heightnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[2]' } }
    sdc_number(:height, :oz_tf, :oz_inc, :oz_dec)
  end
end