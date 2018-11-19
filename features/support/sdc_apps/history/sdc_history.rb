module SdcHistory

  class << self
    def loading
      klass = Class.new(SdcPage) do
        page_object(:loading) { { xpath: '//div[text()="Loading..."]' } }
      end
      klass.new.loading
    end

    def toolbar
      Toolbar
    end

    def filter_panel
      FilterPanel
    end

    def grid
      Grid
    end

    def details
      Details
    end

    def modals
      Modals
    end

    def pagination
      HistoryPagination::Pagination.new
    end
  end
end