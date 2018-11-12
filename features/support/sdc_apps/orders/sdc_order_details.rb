module SdcOrders
  class SdcDetailsShipFrom < SdcPage
    page_object(:drop_down) { { xpath: '(//div[starts-with(@id, "shipfromdroplist")]/div[contains(@id, "trigger-picker")])[1]' } }
    page_object(:text_field) { { xpath: '(//input[starts-with(@id, "shipfromdroplist")])[1]' } }

    def selection_element(str)
      xpath = if str.casecmp('default').zero?
                '(//li[contains(@class, "x-boundlist-item")])[1]'
              else
                "//li[contains(text(), '#{str}')]"
              end

      page_object(:selection) { { xpath: xpath } }
    end
  end

  class SdcShipToCountryDom < SdcPage
    page_object(:drop_down) { { xpath: '//div[@class="x-container x-fit-item x-container-default x-box-layout-ct"]//div[starts-with(@id, "combo-")][contains(@id, "-trigger-picker")]' } }
    page_object(:text_field, tag: :text_field) { { xpath: '//div[@class="x-container x-fit-item x-container-default x-box-layout-ct"]//input[@name="ShipCountryCode"]' } }

    def selection(str)
      SdcElement.new(page_objects(:selections) { { xpath: "//li[text()='#{str}']" } }.last)
    end
  end

  class SdcShipToCountryIntl < SdcPage
    page_object(:drop_down) { { xpath: '(//*[@name="ShipCountryCode"]/../..//div[contains(@id, "trigger-picker")])[2]' } }
    page_object(:text_field) { { xpath: '(//*[@name="ShipCountryCode"])[2]' } }

    def selection(str)
      SdcElement.new(page_objects(:selections) { { xpath: "//li[text()='#{str}']" } }.last)
    end
  end

  class SdcDetailsService < SdcPage
    page_object(:cost, required: true, timeout: 40) { { xpath: '(//div[contains(@id, "singleOrderDetailsForm")]//div[6]//label[contains(@class, "details-form-label")])[2]' } }
    page_object(:drop_down, required: true, timeout: 40) { { xpath: '(//div[contains(@id, "servicedroplist")]//div[contains(@id, "trigger-picker")])[1]' } }
    page_object(:text_field, required: true, timeout: 40) { { xpath: '(//input[contains(@id, "servicedroplist")])[1]' } }

    def selection(name: :selection_element, str: 'Manage Service Options...')
      page_object(name) { { xpath: "//li[@id='#{data_for(:orders_services, {})[str]}']" } }
    end
  end

  class SdcDetailsInsurance < SdcPage
    page_object(:cost) { { xpath: '(//div[contains(@id, "singleOrderDetailsForm")]//div[7]//label[contains(@class, "component")])[2]' } }

    page_object(:chooser_elem) { { xpath: '//div[contains(@id, "singleOrderDetailsForm")]//div[7]//input[contains(@class, "checkbox")]' } }
    page_object(:verify_elem) { { xpath: '//div[contains(@id, "singleOrderDetailsForm")]//div[7]//div[contains(@class, "checkbox")]' } }
    chooser(:checkbox, :chooser_elem, :verify_elem, 'class', 'checked')

    text_field(:text_f, tag: :text_field) { { xpath: '(//input[contains(@id, "insurancefield")])[1]' } }
    page_object(:increment) { { xpath: '(//div[contains(@id, "insurancefield")]//div[contains(@class, "x-form-spinner-up")])[1]' } }
    page_object(:decrement) { { xpath: '(//div[contains(@id, "insurancefield")]//div[contains(@class, "x-form-spinner-down")])[1]' } }
    sdc_number(:amount, :text_f, :increment, :decrement)
  end

  class SdcDetailsTracking < SdcPage
    page_object(:cost) { { xpath: '//*[contains(@class, "selected_tracking_cost")]' } }
    page_object(:drop_down) { { xpath: '(//div[contains(@id, "trackingdroplist")]//div[contains(@id, "trigger-picker")])[1]' } }
    page_object(:text_field) { { xpath: '(//input[contains(@id, "trackingdroplist")])[1]' } }

    def selection_element(name: :selection, value: 'None')
      page_object(name) { { xpath: "//li//td[text()='#{value}']" } }
    end
  end

  class SdcDetailsFooter < SdcPage
    label(:total_ship_cost) { { xpath: '//label[contains(@class, "total_cost")]' } }
    button(:print) { { xpath: '(//div[contains(@class, "footer")]//span[text()="Print"])[1]' } }
  end

  class SdcOrderDetailsDomestic < SdcPage
    page_object(:phone, tag: :text_field) { { xpath: '(//input[@name="ShipPhone"])[1]' } }
    page_object(:email, tag: :text_field) { { xpath: '(//input[@name="BuyerEmail"])[1]' } }
    page_object(:address, tag: :textarea) { { xpath: '//textarea[@name="freeFormAddress"]' } }

    def country
      SdcShipToCountryDom.new
    end
  end

  class SdcOrderDetailsInternational < SdcPage
    page_object(:name, tag: :text_field) { { xpath: '//input[@name="ShipName"]' } }
    page_object(:company, tag: :text_field) { { xpath: '//input[@name="ShipCompany"]' } }
    page_object(:address1, tag: :text_field) { { xpath: '//input[@name="ShipStreet1"]' } }
    page_object(:address2, tag: :text_field) { { xpath: '//input[@name="ShipStreet2"]' } }
    page_object(:city, tag: :text_field) { { xpath: '//input[@name="ShipCity"]' } }
    page_object(:province, tag: :text_field) { { xpath: '//input[@name="ShipState"]' } }
    page_object(:postal_code, tag: :text_field) { { xpath: '//input[@name="ShipPostalCode"]' } }
    page_object(:phone, tag: :text_field) { { xpath: '(//input[@name="ShipPhone"])[2]' } }
    page_object(:email, tag: :text_field) { { xpath: '(//input[@name="BuyerEmail"])[2]' } }
    page_object(:show_less) { { xpath: '//div[contains(@id, "international")]//span[text()="Less"]' } }

    def country
      SdcShipToCountryIntl.new
    end
  end

  class SdcDetailsShipTo < SdcPage
    page_object(:show_details) { { xpath: '//div[starts-with(@id, "shiptoview-addressCollapsed")]//a' } }
    page_object(:show_less) { { xpath: '//div[contains(@id, "domestic")]//span[text()="Less"]' } }

    def domestic
      SdcOrderDetailsDomestic.new
    end

    def international
      SdcOrderDetailsInternational.new
    end
  end

  class SdcDetailsWeight < SdcPage
    text_field(:lbs_tf, tag: :text_field) { { xpath: '(//div[contains(@class, "pounds-numberfield")]//input)[1]' } }
    page_object(:lbs_inc) { { xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-up")])[1]' } }
    page_object(:lbs_dec) { { xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-down")])[1]' } }
    sdc_number(:lbs, :lbs_tf, :lbs_inc, :lbs_dec)

    text_field(:oz_tf, tag: :text_field) { { xpath: '(//div[contains(@class, "ounces-numberfield")]//input)[1]' } }
    page_object(:oz_inc) { { xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-up")])[1]' } }
    page_object(:oz_dec) { { xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-down")])[1]' } }
    sdc_number(:oz, :oz_tf, :oz_inc, :oz_dec)
  end

  class SdcDetailsDimensions < SdcPage
    text_field(:len_tf, tag: :text_field) { { xpath: '(//*[contains(@class, "lengthnumberfield")])[1]' } }
    page_object(:len_inc) { { xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]' } }
    page_object(:len_dec) { { xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]' } }
    sdc_number(:length, :len_tf, :len_inc, :len_dec)

    text_field(:wid_tf, tag: :text_field) { { xpath: '(//*[contains(@class, "widthnumberfield")])[1]' } }
    page_object(:wid_inc) { { xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]' } }
    page_object(:wid_dec) { { xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]' } }
    sdc_number(:width, :wid_tf, :wid_inc, :wid_dec)

    text_field(:oz_tf, tag: :text_field) { { xpath: '(//*[contains(@class, "heightnumberfield")])[1]' } }
    page_object(:oz_inc) { { xpath: '(//*[contains(@class, "heightnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]' } }
    page_object(:oz_dec) { { xpath: '(//*[contains(@class, "heightnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]' } }
    sdc_number(:height, :oz_tf, :oz_inc, :oz_dec)
  end

  class SdcDetailsItem < SdcPage
    def item_qty(num)
      page_object("qty_tf#{num}", tag: :text_field) { { xpath: "(//div[contains(@id, 'singleorderitem')]//*[@name='Quantity'])[#{num}]" } }
      page_object("qty_inc#{num}") {{ xpath: "(//div[contains(@id, 'singleorderitem')]//*[@name='Quantity']/../following-sibling::*/div[contains(@class, 'up')])[#{num}]" }}
      page_object("qty_dec#{num}") { { xpath: "(//div[contains(@id, 'singleorderitem')]//*[@name='Quantity']/../following-sibling::*/div[contains(@class, 'down')])[#{num}]" } }
      sdc_number("item_qty#{num}", "qty_tf#{num}", "qty_inc#{num}", "qty_dec#{num}")
    end

    def id(num)
      page_object("id#{num}", tag: :text_field) { { xpath: "(//*[@name='SKU'])[#{num}]" } }
    end

    def description(num)
      page_object("description#{num}", tag: :text_field) { { xpath: "(//*[@name='Description'])[#{num}]" } }
    end

    def delete_btn(num)
      page_object("delete_btn#{num}") { { xpath: "(//span[contains(@class, 'remove')])[#{num}]" } }
    end
  end

  class Contents < SdcPage
    page_object(:customs_form) { { xpath: '//*[text()="Customs Form..."]' } }
    page_object(:restrictions) { { xpath: '//*[text()="Restrictions..."]' } }
  end

  class SdcOrderDetails < SdcPage
    page_object(:title, required: true, timeout: 20) { { xpath: '//div[contains(@class, "singleorder-detailsform")]//label[contains(@class, "panel-header-text")]' } }
    page_object(:service_label, required: true, timeout: 20) { { xpath: '(//*[contains(text(), "Service:")])[2]' } }
    page_object(:weight_label, required: true, timeout: 20) { { xpath: '//*[contains(text(), "Weight:")]' } }
    page_object(:ship_to_label, required: true, timeout: 20) { { xpath: '//div[starts-with(@id, "singleOrderDetailsForm")]//label[text()="Ship To:"]' } }
    page_object(:order_id, required: true, timeout: 20) { { xpath: '(//*[contains(@class, "singleorder-detailsform")]//div[contains(@class, "sdc-toolbar")]//b)[1]' } }
    page_object(:reference_no, tag: :text_field) { { xpath: '//*[contains(@class, "reference-field-container")]//input' } }
    page_object(:reference_no_label) { { xpath: '//label[text()="Reference #:"]' } }
    page_object(:add_item) { { xpath: '//*[text()="Add Item"]' } }
    page_objects(:items_ordered, index: 0) { { xpath: '//div[text()="Items Ordered"]' } }

    def ship_to
      SdcDetailsShipTo.new
    end

    def ship_from
      SdcDetailsShipFrom.new
    end

    def weight
      SdcDetailsWeight.new
    end

    def service
      SdcDetailsService.new
    end

    def insure_for
      SdcDetailsInsurance.new
    end

    def tracking
      SdcDetailsTracking.new
    end

    def footer
      SdcDetailsFooter.new
    end

    def dimensions
      SdcDetailsDimensions.new
    end

    def associated_item
      SdcDetailsItem.new
    end

    def contents
      Contents.new
    end
  end
end
