module SdcContacts

  class DeleteContactMessageBox < SdcPage
   # message box @id = messagebox-1128
   # write code for message box header
   # write code for message box content
   # page_object(:warning_symbol){{ xpath: '//*[@class="x-box-target"]'}}
   # @id = messagebox-1128-body
   # ""
    page_object(:title) { {xpath: '//*[contains(text(), "Delete Contact")]'} }
    page_object(:close){ { xpath: '//*[@class="x-tool-img x-tool-close"]'} }
    page_object(:yes_button, tag: :span, required: true, timeout: 45 ) { { xpath: '//span[text()="Yes"]'} }
    page_object(:no_button, tag: :span, required: true, timeout: 45 ) { { xpath: '//span[text()="No"]'} }
  end

  class AddReferenceMessageBox < SdcPage
    page_object(:add_reference_window){{xpath: '//*[@id="contacts-ref"]'} }
    page_object(:title) { {xpath: '//*[text()="Change Reference #"]'} }
    #@class =x-title x-window-header-title x-window-header-title-default x-box-item x-title-default x-title-rotate-none x-title-align-left
    page_object(:close){ { xpath: '//*[@class="x-tool-img x-tool-close"]'} }
    page_object(:reference_num, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="ref-number-inputEl"]' } }
    page_object(:reference_error, required: true, timeout: 10) { { xpath: '//*[@id="ref-number-errorEl"]//ul'}}
    page_object(:save_button, tag: :span, required: true, timeout: 45 ) { { xpath: '//span[text()="Save"]'} }
  end


  class ContactsPopupCostCode < SdcPage

    #text_field(:text_field, tag: :text_field) { { xpath: '//*[contains(@id,"changeCostCode-")]//input[contains(@id, "-inputEl")]' } } ID Changed
    #page_object(:drop_down) { { xpath: '//*[contains(@id,"changeCostCode-")]//*[contains(@id, "trigger-picker")][contains(@class, "arrow")]' } } ID Changed
    # page_object(:save_button, tag: :span, required: true, timeout: 45 ) { { xpath: '//span[text()="Save"]'} }
    page_object(:drop_down) { { xpath: '//div[text()="Change Cost Code"]//following::div[contains(@id, "trigger-picker")][contains(@class, "arrow")]' } }
    text_field(:text_field, tag: :text_field) { { xpath: '//div[text()="Change Cost Code"]//following::input[contains(@id, "-inputEl")]' } }
    page_object(:save_button, tag: :span, required: true, timeout: 45 ) { { xpath: '//div[text()="Change Cost Code"]//following::span[text()="Save"]'} }

    def selection_costcode(name: 'selection', value: 'None')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end

  end



end