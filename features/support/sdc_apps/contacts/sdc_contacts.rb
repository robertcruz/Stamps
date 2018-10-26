module SdcContacts
  class << self
    def contact_details
      ContactDetails::Panel.new
    end

    def multi_contact_details
      MultiContactDetails::Panel.new
    end

    def toolbar
      Toolbar::GridToolbar.new
    end

    def filter_panel
      FilterPanel
    end

    def grid
      Grid
    end

    def modals
      Modals
    end
  end
end
