module SdcContacts
  module MultiContactDetails
    class Panel < SdcPage
      page_object(:menu_button, required: true, timeout: 10) { { xpath: '//div[contains(@id,"multicontactdetails")]/a[contains(@class,"x-btn-after-title")]'} }
      page_object(:delete, required: true, timeout: 10) { { xpath: '//span[contains(@id, "menuitem-")][text()="Delete"]'} }
      page_object(:collapse_panel, required: true, timeout: 10) { { xpath: '//span[contains(@id, "menuitem-")][text()="Collapse Panel"]'} }
    end
  end
end