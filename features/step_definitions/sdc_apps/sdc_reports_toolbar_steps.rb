Then /^click date link on history toolbar$/ do
  SdcReports.toolbar.date.link.click
  step 'expect date menu on history toolbar has correct values'
end

Then /^expect date menu on history toolbar has correct values$/ do
  step 'expect all on history toolbar date is present'
  step 'expect custom date range on history toolbar date is present'
  step 'expect month to date on history toolbar date is present'
  step 'expect year to date on history toolbar date is present'
  step 'expect previous month on history toolbar date is present'
  step 'expect previous quarter on history toolbar date is present'
  step 'expect previous year on history toolbar date is present'
  step 'expect past 7 days on history toolbar date is present'
  step 'expect past 30 days on history toolbar date is present'
  step 'expect past 90 days on history toolbar date is present'
end

Then /^expect all on history toolbar date is present$/ do
  expect(SdcReports.toolbar.date.all).to be_present
end

Then /^expect custom date range on history toolbar date is present$/ do
  expect(SdcReports.toolbar.date.custom_date_range).to be_present
end
Then /^expect month to date on history toolbar date is present$/ do
  expect(SdcReports.toolbar.date.month_to_date).to be_present
end
Then /^expect year to date on history toolbar date is present$/ do
  expect(SdcReports.toolbar.date.year_to_date).to be_present
end
Then /^expect previous month on history toolbar date is present$/ do
  expect(SdcReports.toolbar.date.previous_month).to be_present
end
Then /^expect previous quarter on history toolbar date is present$/ do
  expect(SdcReports.toolbar.date.previous_quarter).to be_present
end
Then /^expect previous year on history toolbar date is present$/ do
  expect(SdcReports.toolbar.date.previous_year).to be_present
end
Then /^expect past 7 days on history toolbar date is present$/ do
  expect(SdcReports.toolbar.date.past_7_days).to be_present
end
Then /^expect past 30 days on history toolbar date is present$/ do
  expect(SdcReports.toolbar.date.past_30_days).to be_present
end
Then /^expect past 90 days on history toolbar date is present$/ do
  expect(SdcReports.toolbar.date.past_90_days).to be_present
end

Then /^expect date on history toolbar contains (.+)$/ do |str|
  expect(SdcReports.toolbar.date.text_value).to include?(str)
end

Then /^click (.*) on history toolbar date$/ do |str|
  date = SdcReports.toolbar.date
  obj = case str
          when 'all'
            date.all
          when 'custom date range'
            date.custom_date_range
          when 'month to date'
            date.month_to_date
          when 'year to date'
            date.year_to_date
          when 'previous month'
            date.previous_month
          when 'previous quarter'
            date.previous_quarter
          when 'previous year'
            date.previous_year
          when 'past 7 days'
            date.past_7_days
          when 'past 30 days'
            date.past_30_days
          when 'past 90 days'
            date.past_90_days
          else
            #ingore
        end
  obj.click
  step "expect date on history toolbar contains #{str}"
end

Then /^click view link on history toolbar$/ do
  SdcReports.toolbar.view.link.click
  step 'expect view menu on history toolbar has correct values'
end

Then /^expect view menu on history toolbar has correct values$/ do
  step 'expect area on history toolbar view is present'
  step 'expect bar on history toolbar view is present'
  step 'expect column on history toolbar view is present'
  step 'expect 100% area on history toolbar view is present'
  step 'expect 100% bar on history toolbar view is present'
  step 'expect 100% column on history toolbar view is present'
  step 'expect line on history toolbar view is present'
  step 'expect pie on history toolbar view is present'
  step 'expect trend on history toolbar view is present'
  step 'expect summary on history toolbar view is present'
  step 'expect transactions on history toolbar view is present'
end

Then /^expect area on history toolbar view is present$/ do
  expect(SdcReports.toolbar.view.area).to be_present
end
Then /^expect bar on history toolbar view is present$/ do
  expect(SdcReports.toolbar.view.bar).to be_present
end
Then /^expect column on history toolbar view is present$/ do
  expect(SdcReports.toolbar.view.column).to be_present
end
Then /^expect 100% area on history toolbar view is present$/ do
  expect(SdcReports.toolbar.view.area_100).to be_present
end
Then /^expect 100% bar on history toolbar view is present$/ do
  expect(SdcReports.toolbar.view.bar_100).to be_present
end
Then /^expect 100% column on history toolbar view is present$/ do
  expect(SdcReports.toolbar.view.column_100).to be_present
end
Then /^expect line on history toolbar view is present$/ do
  expect(SdcReports.toolbar.view.line).to be_present
end
Then /^expect pie on history toolbar view is present$/ do
  expect(SdcReports.toolbar.view.pie).to be_present
end
Then /^expect trend on history toolbar view is present$/ do
  expect(SdcReports.toolbar.view.trend).to be_present
end
Then /^expect summary on history toolbar view is present$/ do
  expect(SdcReports.toolbar.view.summary).to be_present
end
Then /^expect transactions on history toolbar view is present$/ do
  expect(SdcReports.toolbar.view.transactions).to be_present
end

Then /^click (.*) on history toolbar view/ do |str|
  view = SdcReports.toolbar.view
  obj = case str
          when 'area'
            view.area
          when 'bar'
            view.bar
          when 'column'
            view.column
          when '100% area'
            view.area_100
          when '100% bar'
            view.bar_100
          when '100% column'
            view.column_100
          when 'line'
            view.line
          when 'pie'
            view.pie
          when 'trend'
            view.trend
          when 'summary'
            view.summary
          when 'transactions'
            view.transactions
          else
            #ingore
        end
  obj.click
end

Then /^click interval link on history toolbar$/ do
  SdcReports.toolbar.interval.link.click
  step 'expect interval menu on history toolbar has correct values'
end

Then /^expect interval menu on history toolbar has correct values$/ do
  step 'expect days on history toolbar interval is present'
  step 'expect weeks on history toolbar interval is present'
  step 'expect months on history toolbar interval is present'
  step 'expect quarters on history toolbar interval is present'
  step 'expect years on history toolbar interval is present'
end

Then /^expect days on history toolbar interval is present$/ do
  expect(SdcReports.toolbar.interval.days).to be_present
end

Then /^expect weeks on history toolbar interval is present$/ do
  expect(SdcReports.toolbar.interval.weeks).to be_present
end

Then /^expect months on history toolbar interval is present$/ do
  expect(SdcReports.toolbar.interval.months).to be_present
end

Then /^expect quarters on history toolbar interval is present$/ do
  expect(SdcReports.toolbar.interval.quarters).to be_present
end

Then /^expect years on history toolbar interval is present$/ do
  expect(SdcReports.toolbar.interval.years).to be_present
end

Then /^click (.*) on history toolbar interval/ do |str|
  interval = SdcReports.toolbar.view
  obj = case str
          when 'days'
            interval.days
          when 'weeks'
            interval.weeks
          when 'months'
            interval.months
          when 'quarters'
            interval.quarters
          when 'years'
            interval.years
          else
            #ingore
        end
  obj.click
end