module SdcHistory

  class << self
    def loading
      klass = Class.new(SdcPage) do
        page_object(:loading) { { xpath: '//div[text()="Loading..."]' } }
      end
      klass.new.loading
    end

    def toolbar
      SdcHistoryToolbar.new
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

    def multiple_details
      MultipleDetails
    end
  end
end