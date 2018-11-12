module SdcWebsite

  class SdcCustomsForm < SdcPage
    page_object(:title) { { xpath: '//*[text()="Customs Information"]' } }
    page_object(:add_item) { { xpath: '//*[contains(@class, "x-toolbar-white")]//*[contains(@id, "btnWrap")]' } }

    page_object(:agree_chooser) { { xpath: '//*[contains(@class, "x-docked-bottom")]//*[contains(@class, "x-form-type-checkbox")]//input' } }
    page_object(:agree_verify) { { xpath: '//*[contains(@class, "x-docked-bottom")]//div[contains(@class, "x-form-type-checkbox")]' } }
    chooser(:agree, :agree_chooser, :agree_verify, 'class', 'checked')

    page_object(:close) { { xpath: '//div[starts-with(@id, "customswindow")]//div[contains(@class, "x-panel-default-docked-bottom")]//span[text()="Close"]' } }
    page_object(:x_btn) { { xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]' } }
    page_object(:total) { { xpath: '//*[contains(@class, "x-window")]//*[contains(text(), "Total:")]/..' } }
    page_object(:usps_warning) { { xpath: '//*[text()="You must agree to the USPS Privacy Act Statement"]' } }

    page_object(:usps_privacy_act) { { xpath: '//*[text()="USPS Privacy Act Statement"]/../../..' } }
    page_object(:restriction_prohibitions) { { xpath: '//*[text()="USPS Privacy Act Statement"]/../../..' } }

    page_objects(:associated_items) { { xpath: '//*[contains(@id, "associatedcustomsitems")]/*[contains(@id, "singlecustomsitem")]' } }

    # optional
    page_object(:itn, tag: :text_field) { { xpath: '//*[@name="AES"]' } }
    page_object(:more_info, tag: :text_field) { { xpath: '//*[@name="CustomsComments"]' } }

    # optional
    page_object(:license, tag: :text_field) { { xpath: '//*[@name="CustomsLicenseNumber"]' } }
    page_object(:certificate, tag: :text_field) { { xpath: '//*[@name="CustomsCertificateNumber"]' } }
    page_object(:invoice, tag: :text_field) { { xpath: '//*[@name="CustomsInvoiceNumber"]' } }

    def package_contents
      PackageContents.new
    end

    def non_delivery
      NonDelivery.new
    end

    def internal_transaction
      InternalTransaction.new
    end

    def item
      CustomsFormItem.new
    end
  end

  class CustomsFormItem < SdcPage
    def item_description(num)
      page_object("item_description#{num}", tag: :text_field) { { xpath: "(//*[contains(@id, 'singlecustomsitem')]//*[@name='Description'])[#{num}]" } }
    end

    def hs_tariff(num)
      page_object("hs_tariff#{num}", tag: :text_field) { { xpath: "(//*[contains(@id, 'singlecustomsitem')]//*[@name='TariffNo'])[#{num}]" } }
    end

    def delete(num)
      page_object("delete#{num}") { { xpath: "(//*[contains(@id, 'singlecustomsitem')]//a[contains(@class, 'x-btn-transparent-small')])[#{num}]" } }
    end

    def qty(num)
      page_object("qty_tf#{num}", tag: :text_field) { { xpath: "(//div[contains(@id, 'singlecustomsitem')]//*[@name='Quantity'])[#{num}]" } }
      page_object("qty_inc#{num}") {{xpath: "(//div[contains(@id, 'singlecustomsitem')]//*[@name='Quantity']/../following-sibling::*/div[contains(@class, 'up')])[#{num}]"}}
      page_object("qty_dec#{num}") { { xpath: "(//div[contains(@id, 'singlecustomsitem')]//*[@name='Quantity']/../following-sibling::*/div[contains(@class, 'down')])[#{num}]" } }
      sdc_number("qty#{num}", "qty_tf#{num}", "qty_inc#{num}", "qty_dec#{num}")
    end

    def unit_price(num)
      page_object("unit_price_tf#{num}", tag: :text_field) { { xpath: "(//*[@name='Value'])[#{num}]" } }
      page_object("unit_price_dec#{num}") { { xpath: "(//*[@name='Value']/../following-sibling::*/div[contains(@class, 'down')])[#{num}]" } }
      page_object("unit_price_inc#{num}") { { xpath: "(//*[@name='Value']/../following-sibling::*/div[contains(@class, 'up')])[#{num}]" } }
      sdc_number("unit_price#{num}", "unit_price_tf#{num}", "unit_price_inc#{num}", "unit_price_dec#{num}")
    end

    def made_in
      MadeIn.new
    end
  end

  class MadeIn < SdcPage
    def text_field(num)
      page_object("text_field#{num}", tag: :text_field) { { xpath: "(//*[@name='OriginCountryCode'])[#{num}]" } }
    end

    def drop_down(num)
      page_object("drop_down#{num}") { { xpath: "(//*[contains(@id, 'singlecustomsitem')]//*[contains(@class, 'x-form-arrow-trigger')])[#{num}]" } }
    end

    def selection(num, str)
      page_object("selection#{num}", timeout: 5) { { xpath: "(//li[text()='#{str}'])[#{num + 1}]" } }
    end
  end

  class PackageContents < SdcPage
    page_object(:text_field) { { xpath: '//*[@name="CustomsContents"]' } }
    page_object(:drop_down) { { xpath: '//*[contains(@id, "packagecontentsdroplist")]' } }

    def selection_element(name: :selection, value: 'Merchandise')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end
  end

  class NonDelivery < SdcPage
    page_object(:text_field) { { xpath: '//*[@name="NonDelivery"]' } }
    page_object(:drop_down) { { xpath: '//*[contains(@id, "nondeliveryoptionsdroplist")]' } }

    def selection_element(name: :selection, value: 'Return to sender')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end
  end

  class InternalTransaction < SdcPage
    page_object(:text_field) { { xpath: '//*[@name="IsITNRequired"]' } }
    page_object(:drop_down) { { xpath: '//*[contains(@id, "internaltransactiondroplist")]' } }

    def selection_element(name: :selection, value: 'Not required')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end
  end

  class SdcRestrictions < SdcPage
    page_object(:title) { {xpath: '//div[text()="View Restrictions"]'} }
    page_object(:ok) { {xpath: '//*[text()="OK"]/../..'} }
    page_object(:x_btn) { {xpath: '//div[text()="View Restrictions"]/../..//*[contains(@class, "close")]'} }
  end
end