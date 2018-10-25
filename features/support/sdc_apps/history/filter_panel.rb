module SdcHistory

  class HistoryDatePrinted < SdcPage
    page_object(:header) { { xpath: '//div[text()="Date Printed"]' } }
    page_object(:after_date_printed_tool) { { xpath: '//div[text()="Date Printed"]/../../div[starts-with(@id,"tool")]/img' } }

    page_object(:today) { { xpath: '' } }
    page_object(:today_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//div[text()="Today"]' } }
    page_object(:today_verify) { { xpath: '//*[contains(@class,"badgebutton")]//div[text()="Today"]/../../../..' } }
    chooser(:today, :today_chooser, :today_verify, :class, :selected)

    page_object(:today_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Today"]/../following-sibling::td//*[@class="sdc-badge"]' } }

    page_object(:past_7_days_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 7 Days"]' } }
    page_object(:past_7_days_verify) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 7 Days"]/../../../..' } }
    chooser(:past_7_days, :past_7_days_chooser, :past_7_days_verify, :class, :selected)
    page_object(:past_7_days_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 7 Days"]/../following-sibling::td//*[@class="sdc-badge"]' } }


    page_object(:past_30_days_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 30 Days"]' } }
    page_object(:past_30_days_verify) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 30 Days"]/../../../..' } }
    chooser(:past_30_days, :past_30_days_chooser, :past_30_days_verify, :class, :selected)
    page_object(:past_30_days_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 30 Days"]/../following-sibling::td//*[@class="sdc-badge"]' } }

    page_object(:past_3_months_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 3 Months"]' } }
    page_object(:past_3_months_verify) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 3 Months"]/../../../..' } }
    chooser(:past_3_months, :past_3_months_chooser, :past_3_months_verify, :class, :selected)
    page_object(:past_3_months_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 3 Months"]/../following-sibling::td//*[@class="sdc-badge"]' } }

    page_object(:past_6_months_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 6 Months"]' } }
    page_object(:past_6_months_verify) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 6 Months"]/../../../..' } }
    chooser(:past_6_months, :past_6_months_chooser, :past_6_months_verify, :class, :selected)
    page_object(:past_6_months_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 6 Months"]/../following-sibling::td//*[@class="sdc-badge"]' } }

    page_object(:past_12_months_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 12 Months"]' } }
    page_object(:past_12_months_verify) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 12 Months"]/../../../..' } }
    chooser(:past_12_months, :past_12_months_chooser, :past_12_months_verify, :class, :selected)
    page_object(:past_12_months_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 12 Months"]/../following-sibling::td//*[@class="sdc-badge"]' } }

    page_object(:past_2_years_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 2 Years"]' } }
    page_object(:past_2_years_verify) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 2 Years"]/../../../..' } }
    chooser(:past_2_years, :past_2_years_chooser, :past_2_years_verify, :class, :selected)
    page_object(:past_2_years_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Past 2 Years"]/../following-sibling::td//*[@class="sdc-badge"]' } }

    page_object(:all_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="All"]' } }
    page_object(:all_verify) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="All"]/../../../..' } }
    chooser(:all, :all_chooser, :all_verify, :class, :selected)

    page_object(:custom_date_chooser) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Custom Date Range"]' } }
    page_object(:custom_date_verify) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Custom Date Range"]/../../../..' } }
    chooser(:custom_date_range, :custom_date_chooser, :custom_date_verify, :class, :selected)
  end

  class HistoryEligibleFor < SdcPage
    page_object(:header) { { xpath: '//div[text()="Eligible For"]' } }
    page_object(:after_eligible_for_tool) { { xpath: '//div[text()="Eligible For"]/../../div[starts-with(@id,"tool")]/img' } }
    page_object(:refund) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Refund"]' } }
    page_object(:refund_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Refund"]/../following-sibling::td//*[@class="sdc-badge"]' } }
    page_object(:scan_form) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="SCAN Form"]' } }
    page_object(:scan_form_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="SCAN Form"]/../following-sibling::td//*[@class="sdc-badge"]' } }
    page_object(:usps_pickup) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="USPS Pickup"]' } }
    page_object(:usps_pickup_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="USPS Pickup"]/../following-sibling::td//*[@class="sdc-badge"]' } }
    page_object(:insurance_claim) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Insurance Claim"]' } }
    page_object(:insurance_claim_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Insurance Claim"]/../following-sibling::td//*[@class="sdc-badge"]' } }
  end

  class HistoryStatus < SdcPage
    page_object(:header) { { xpath: '//div[text()="Status"]' } }
    page_object(:after_status_tool) { { xpath: '//div[text()="Status"]/../../div[starts-with(@id,"tool")]/img' } }
    page_object(:printed) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Printed"]' } }
    page_object(:printed_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Printed"]/../following-sibling::td//*[@class="sdc-badge"]' } }
    page_object(:in_transit) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="In Transit"]' } }
    page_object(:in_transit_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="In Transit"]/../following-sibling::td//*[@class="sdc-badge"]' } }
    page_object(:delivered) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Delivered"]' } }
    page_object(:delivered_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Delivered"]/../following-sibling::td//*[@class="sdc-badge"]' } }
    page_object(:pending_recipient_action) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Pending Recipient Action"]' } }
    page_object(:pending_recipient_action_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Pending Recipient Action"]/../following-sibling::td//*[@class="sdc-badge"]' } }
    page_object(:undeliverable) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Undeliverable"]' } }
    page_object(:undeliverable_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Undeliverable"]/../following-sibling::td//*[@class="sdc-badge"]' } }
    page_object(:refund_pending) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Refund Pending"]' } }
    page_object(:refund_pending_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Refund Pending"]/../following-sibling::td//*[@class="sdc-badge"]' } }
    page_object(:refunded) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Refunded"]' } }
    page_object(:refunded_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Refunded"]/../following-sibling::td//*[@class="sdc-badge"]' } }
    page_object(:other) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Other"]' } }
    page_object(:other_count) { { xpath: '//*[contains(@class,"badgebutton")]//*[text()="Other"]/../following-sibling::td//*[@class="sdc-badge"]' } }
  end

  class HistoryUser < SdcPage
    page_object(:header) { { xpath: '//div[text()="User"]' } }
    page_object(:after_header_tool) { { xpath: '//div[text()="User"]/../../div[starts-with(@id,"tool")]/img' } }
    page_object(:username) { { xpath: '//div[text()="User"]/../../../../../div[contains(@id,"-body")]//div[@class="table-cell-inner sdc-badgebutton-text"]' } }
    page_object(:username_count) { { xpath: '//div[text()="User"]/../../../../../div[contains(@id,"-body")]//div[@class="sdc-badge"]' } }
  end

  class CollapsedView < SdcPage
    page_object(:expand) { { xpath: '//img[contains(@class,"x-tool-expand-right")]' } }
    page_object(:username) { { xpath: '//div[@id="filter-panel-view-placeholder-innerCt"]//div[contains(@class,"x-title-item")]' } }
  end

  module FilterPanel
    class << self
      def date_printed
        HistoryDatePrinted.new
      end

      def eligible_for
        HistoryEligibleFor.new
      end

      def status
        HistoryStatus.new
      end

      def user
        HistoryUser.new
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
  end

end