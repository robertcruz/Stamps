module SdcHistory
  module Modals
    class << self
      def prints
        Prints.new
      end

      def expenses
        Expenses.new
      end

      def balances
        Balances.new
      end

      def collapse
        xpath = '//div[@id="filter-panel-view-innerCt"]//span[contains(@class,"sdc-icon-collapse")]'
        klass = Class.new(SdcPage) do
          page_object(:collapse) { { xpath: xpath } }
        end
        klass.new.collapse
      end

      def collapsed_view
        CollapsedView.new
      end
    end

    class Prints < SdcPage
      page_object(:link) { { xpath: '//*[text()="Prints"]' } }

      def by_service
        ByService.new
      end

      def by_cost_code
        ByCostCode.new
      end
    end

    class Expenses < SdcPage
      page_object(:link) { { xpath: '//div[text()="Expenses"][contains(@class,"sdc-badgebutton-text")]' } }
    end

    class Balances < SdcPage
      page_object(:link) { { xpath: '//*[text()="Balances"]' } }
    end

    class ByService < SdcPage
      page_object(:link) { { xpath: '//*[text()="By Service"]' } }
    end

    class ByCostCode < SdcPage
      page_object(:link) { { xpath: '//*[text()="By Cost Code"]' } }
    end

    class CollapsedView < SdcPage
      page_object(:expand) { { xpath: '//img[contains(@class,"x-tool-expand-right")]' } }
      page_object(:title) { { xpath: '//*[text()="Reports"][contains(@id, "title")]' } }
    end
  end
end
