 module SdcContacts
 
 class ClearContacts < SdcPage
    page_object(:title, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text()="Clear Contacts"]'}}
	page_object(:close_icon, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text()="Clear Contacts"]/following::span[contains(@class,"-close-")]' } }
	page_object(:window_text, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text()="Clear Contacts"]/following::div[@class="x-autocontainer-innerCt"]' } }
	page_object(:yes_button, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text()="Clear Contacts"]/following::span[text()="Yes"]' } }
    page_object(:no_button, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text()="Clear Contacts"]/following::span[text()="No"]' } }
  end
  
    class << self

      def clear_contacts_popup
        ClearContacts.new
      end

    end
end