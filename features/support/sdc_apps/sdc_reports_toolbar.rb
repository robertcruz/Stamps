module SdcReports
  class Date < SdcPage
    page_object(:link) { { xpath: '' } }
    page_object(:tooltip) { { xpath: '' } }
    page_object(:all) { { xpath: '//*[text()="All"]' } }
    page_object(:custom_date_range) { { xpath: '//*[text()="Custom Date Range"]' } }
    page_object(:month_to_date) { { xpath: '//*[text()="Month to Date"]' } }
    page_object(:year_do_date) { { xpath: '//*[text()="Year to Date"]' } }
    page_object(:previous_month) { { xpath: '//*[text()="Previous Month"]' } }
    page_object(:previous_quater) { { xpath: '//*[text()="Previous Quarter"]' } }
    page_object(:previous_year) { { xpath: '//*[text()="Previous Year"]' } }
    page_object(:past_7_days) { { xpath: '//*[text()="Past 7 days"]' } }
    page_object(:past_30_days) { { xpath: '//*[text()="Past 30 days"]' } }
    page_object(:past_90_days) { { xpath: '//*[text()="Past 90 days"]' } }

    def from
      #datepickers
    end

    def to
      #datepickers
    end
  end

  class View < SdcPage
    page_object(:link) { { xpath: '//span[text()="View"]' } }
    page_object(:tooltip) { { xpath: '//b[contains(text(), "View")]' } }
    page_object(:area) { { xpath: '//*[text()="Area"]' } }
    page_object(:bar) { { xpath: '//*[text()="Bar"]' } }
    page_object(:column) { { xpath: '//*[text()="Column"]' } }
    page_object(:area_100) { { xpath: '//*[text()="100% Area"]' } }
    page_object(:bar_100) { { xpath: '//*[text()="100% Bar"]' } }
    page_object(:column_100) { { xpath: '//*[text()="100% Column"]' } }
    page_object(:line) { { xpath: '//*[text()="Line"]' } }
    page_object(:pie) { { xpath: '//*[text()="Pie"]' } }
    page_object(:trend) { { xpath: '//*[text()="Trend"]' } }
    page_object(:summary) { { xpath: '//*[text()="Summary"]' } }
    page_object(:transactions) { { xpath: '//*[text()="Transactions"]' } }
  end

  class Interval < SdcPage
    page_object(:link) { { xpath: '//span[text()="Interval")' } }
    page_object(:tooltip) { { xpath: '//b[contains(text(), "Interval")]' } }
    page_object(:days) { { xpath: '//*[text()="Days"]' } }
    page_object(:weeks) { { xpath: '//*[text()="Weeks"]' } }
    page_object(:months) { { xpath: '//*[text()="Months"]' } }
    page_object(:quarters) { { xpath: '//*[text()="Quarters"]' } }
    page_object(:years) { { xpath: '//*[text()="Years"]' } }
  end

  class Data < SdcPage
    page_object(:link) { { xpath: '//span[text()="Data"]' } }
    page_object(:tooltip) { { xpath: '//b[contains(text(), "Data")]' } }
    page_object(:cost) { { xpath: '//*[text()="Cost ($)"]' } }
    page_object(:count) { { xpath: '//*[text()="Count (#)"]' } }
  end

  class Filters < SdcPage
    page_object(:link) { { xpath: '//span[text()="Filters"]' } }
    page_object(:tooltip) { { xpath: '//b[contains(text(), "Filters")]' } }
  end

  class Reset < SdcPage
    page_object(:icon) { { xpath: '//*[contains(@class, "reset")]' } }
    page_object(:tooltip) { { xpath: '//*[text()="Reset"]' } }
  end

  class Print < SdcPage
    page_object(:icon) { { xpath: '//*[contains(@class, "print")]' } }
    page_object(:tooltip) { { xpath: '//*[text()="Print"]' } }
  end

  class Export < SdcPage
    page_object(:icon) { { xpath: '//*[contains(@class, "export")]' } }
    page_object(:tooltip) { { xpath: '//*[text()="Export"]' } }
  end

  class Feedback < SdcPage
    page_object(:icon) { { xpath: '//*[contains(@class, "feedback")]' } }
    page_object(:tooltip) { { xpath: '//*[text()="Feedback"]' } }
  end

  class Settings < SdcPage
    page_object(:icon) { { xpath: '//*[contains(@class, "settings")]' } }
    page_object(:tooltip) { { xpath: '//*[text()="Settings"]' } }
    page_object(:classic_view) { { xpath: '//*[text()="Classic View"]' } }
  end

  module Toolbar
    class << self
      def date
        Date.new
      end

      def view
        View.new
      end

      def interval
        Interval.new
      end

      def data
        Data.new
      end

      def settings
        Settings.new
      end

      def filters
        Filters.new
      end

      def reset
        Reset.new
      end

      def print
        Print.new
      end

      def export
        Export.new
      end

      def feedback
        Feedback.new
      end
    end
  end

end