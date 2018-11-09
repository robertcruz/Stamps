module SdcReports
  module FilterPanel
    class << self
      def prints
        Prints.new
      end

      def expenses
        klass = Class.new(SdcPage) do
          page_object(:expenses_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//div[text()="Expenses"][contains(@class,"badgebutton")]' } }
          page_object(:expenses_verify) { { xpath: '//table[contains(@class,"badgebutton")]//div[text()="Expenses"]/../../../..' } }
          chooser(:expenses, :expenses_chooser, :expenses_verify, :class, :selected)
        end
        klass.new.expenses
      end

      def balances
        klass = Class.new(SdcPage) do
          page_object(:balances_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//div[text()="Balances"]' } }
          page_object(:balances_verify) { { xpath: '//*[contains(@class,"badgebutton")]//div[text()="Balances"]/../../../..' } }
          chooser(:balances, :balances_chooser, :balances_verify, :class, :selected)
        end
        klass.new.balances
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

      page_object(:by_service_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//div[text()="By Service"]' } }
      page_object(:by_service_verify) { { xpath: '//*[contains(@class,"badgebutton")]//div[text()="By Service"]/../../../..' } }
      chooser(:by_service, :by_service_chooser, :by_service_verify, :class, :selected)

      page_object(:by_cost_code_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//div[text()="By Cost Code"]' } }
      page_object(:by_cost_code_verify) { { xpath: '//*[contains(@class,"badgebutton")]//div[text()="By Cost Code"]/../../../..' } }
      chooser(:by_cost_code, :by_cost_code_chooser, :by_cost_code_verify, :class, :selected)
    end

    # class Expenses < SdcPage
    #   page_object(:link) { { xpath: '//div[text()="Expenses"][contains(@class,"sdc-badgebutton-text")]' } }
    # end
    #
    # class Balances < SdcPage
    #   page_object(:link) { { xpath: '//*[text()="Balances"]' } }
    # end

    class CollapsedView < SdcPage
      page_object(:expand) { { xpath: '//img[contains(@class,"x-tool-expand-right")]' } }
      page_object(:title) { { xpath: '//*[text()="Reports"][contains(@id, "title")]' } }
    end
  end
end
