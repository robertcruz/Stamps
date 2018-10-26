module SdcReports
  module Modals
    class << self
      def refund
        Filters.new
      end

      class Filters < SdcPage
        page_object(:title) { {xpath: '//div[text()="Filters"]'} }
      end
    end
  end
end

