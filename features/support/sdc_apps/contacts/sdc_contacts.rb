module SdcContacts

  def loading_contacts
    klass = Class.new(SdcPage) do
      page_object(:loading) { { xpath: '//*[contains(text(), "Loading contacts...")]' } }
    end
    klass.new.loading
  end
  module_function :loading_contacts

  def verifying_account
    klass = Class.new(SdcPage) do
      page_object(:verifying_account) { {xpath: '//*[contains(text(), "Verifying")]'} }
    end
    klass.new.verifying_account
  end
  module_function :verifying_account

  #-----Contacts Tool Bar---------


  #--------Details Panel---------

end
