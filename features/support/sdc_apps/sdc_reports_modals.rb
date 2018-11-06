module SdcReports
  module Modals
    class << self
      def filters
        Filters.new
      end

      def feedback
        Feedback.new
      end

      class Filters < SdcPage
        page_object(:title) { {xpath: '//div[text()="Filters"]'} }
        page_object(:x_btn) { {xpath: '//img[contains(@class, "close")]'} }
      end

      class Feedback < SdcPage
        page_object(:title) { {xpath: '//div[text()="Feedback"]'} }
        page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      end
    end
  end
end

