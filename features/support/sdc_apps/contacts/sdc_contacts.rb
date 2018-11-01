module SdcContacts

  class << self

    def loading_contacts
      klass = Class.new(SdcPage) do
        page_object(:loading) { { xpath: '//*[contains(text(), "Loading contacts...")]' } }
      end
      klass.new.loading
    end

    def verifying_account
      klass = Class.new(SdcPage) do
        page_object(:verifying_account) { { xpath: '//*[contains(text(), "Verifying")]' } }
      end
      klass.new.verifying_account
    end

    def details
      ContactDetails::Panel.new
    end

    def multi_details
      MultiContactDetails::Panel.new
    end

    def toolbar
      Toolbar::Toolbar.new
    end

    def contacts_filter
      ContactsFilterPanel::Filter.new
    end

    def grid
      Grid
    end

    def modals
      Modals
    end

    def pagination
      ContactsPagination::Pagination.new
    end

  end

end
