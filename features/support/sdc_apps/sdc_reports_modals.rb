module SdcReports
  module Modals
    class << self
      def filters
        Filters.new
      end

      def feedback
        Feedback.new
      end

      def welcome
        Welcome.new
      end

      class Filters < SdcPage
        page_object(:title) { {xpath: '//div[text()="Filters"]'} }
        page_object(:x_btn) { {xpath: '//img[contains(@class, "close")]'} }
      end

      class Feedback < SdcPage
        page_object(:title) { {xpath: '//div[text()="Feedback"]'} }
        page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      end

      class Welcome < SdcPage
        page_object(:title) { {xpath: '//*[text()="Welcome!"]'} }
        page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
        page_object(:next) { {xpath: '//*[text()="Next"]'} }
        page_object(:close) { {xpath: '//*[text()="Close"]'} }
        page_object(:learn_more) { {xpath: '//*[text()="Learn More"]'} }
      end
    end
  end
end

