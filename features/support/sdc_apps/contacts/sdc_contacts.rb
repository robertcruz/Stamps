module SdcContacts
  class << self
    def details
      ContactDetails::Panel.new
    end

    def multi_details
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

    def pagination
      ContactsPagination::Pagination.new
    end

  end
end
