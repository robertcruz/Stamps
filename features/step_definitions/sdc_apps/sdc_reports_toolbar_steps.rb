Then /^click date link on reports toolbar$/ do
  SdcReports.toolbar.date.link.click
  SdcReports.toolbar.date.link.hover
  step 'hover on date tooltip on reports toolbar'
  step 'expect date menu on reports toolbar has correct values'
end

Then /^hover on date tooltip on reports toolbar$/ do
  SdcReports.toolbar.date.tooltip.safe_wait_until_present(timeout: 5)
  SdcReports.toolbar.date.tooltip.hover if SdcReports.toolbar.date.tooltip.present?
end

Then /^expect date menu on reports toolbar has correct values$/ do
  step 'expect all on reports toolbar date is present'
  step 'expect custom date range on reports toolbar date is present'
  step 'expect month to date on reports toolbar date is present'
  step 'expect year to date on reports toolbar date is present'
  step 'expect previous month on reports toolbar date is present'
  step 'expect previous quarter on reports toolbar date is present'
  step 'expect previous year on reports toolbar date is present'
  step 'expect past 7 days on reports toolbar date is present'
  step 'expect past 30 days on reports toolbar date is present'
  step 'expect past 90 days on reports toolbar date is present'
end

Then /^expect all on reports toolbar date is present$/ do
  expect(SdcReports.toolbar.date.all).to be_present
end

Then /^expect custom date range on reports toolbar date is present$/ do
  expect(SdcReports.toolbar.date.custom_date_range).to be_present
end
Then /^expect month to date on reports toolbar date is present$/ do
  expect(SdcReports.toolbar.date.month_to_date).to be_present
end
Then /^expect year to date on reports toolbar date is present$/ do
  expect(SdcReports.toolbar.date.year_to_date).to be_present
end
Then /^expect previous month on reports toolbar date is present$/ do
  expect(SdcReports.toolbar.date.previous_month).to be_present
end
Then /^expect previous quarter on reports toolbar date is present$/ do
  expect(SdcReports.toolbar.date.previous_quarter).to be_present
end
Then /^expect previous year on reports toolbar date is present$/ do
  expect(SdcReports.toolbar.date.previous_year).to be_present
end
Then /^expect past 7 days on reports toolbar date is present$/ do
  expect(SdcReports.toolbar.date.past_7_days).to be_present
end
Then /^expect past 30 days on reports toolbar date is present$/ do
  expect(SdcReports.toolbar.date.past_30_days).to be_present
end
Then /^expect past 90 days on reports toolbar date is present$/ do
  expect(SdcReports.toolbar.date.past_90_days).to be_present
end

Then /^expect date on reports toolbar contains (.+)$/ do |str|
  expect(SdcReports.toolbar.date.link.text_value).to include(str)
end

Then /^click (.*) on reports toolbar date$/ do |str|
  date = SdcReports.toolbar.date
  obj = case str
          when 'All'
            date.all
          when 'Custom Date Range'
            date.custom_date_range
          when 'Month to Date'
            date.month_to_date
          when 'Year to Date'
            date.year_to_date
          when 'Previous Month'
            date.previous_month
          when 'Previous Quarter'
            date.previous_quarter
          when 'Previous Year'
            date.previous_year
          when 'Past 7 days'
            date.past_7_days
          when 'Past 30 days'
            date.past_30_days
          when 'Past 90 days'
            date.past_90_days
          else
            #ingore
        end
  # step 'hover on date tooltip on reports toolbar'
  obj.click
  step 'wait while loading reports grid'
  step "expect date on reports toolbar contains #{str}"
end

Then /^click view link on reports toolbar$/ do
  SdcReports.toolbar.view.link.click
  SdcReports.toolbar.view.link.hover
  step 'hover on view tooltip on reports toolbar'
  step 'expect view menu on reports toolbar has correct values'
end

Then /^hover on view tooltip on reports toolbar$/ do
  SdcReports.toolbar.view.tooltip.safe_wait_until_present(timeout: 5)
  SdcReports.toolbar.view.tooltip.hover if SdcReports.toolbar.view.tooltip.present?
end

Then /^expect view menu on reports toolbar has correct values$/ do
  step 'expect area on reports toolbar view is present'
  step 'expect bar on reports toolbar view is present'
  step 'expect column on reports toolbar view is present'
  step 'expect 100% area on reports toolbar view is present'
  step 'expect 100% bar on reports toolbar view is present'
  step 'expect 100% column on reports toolbar view is present'
  step 'expect line on reports toolbar view is present'
  step 'expect pie on reports toolbar view is present'
  step 'expect trend on reports toolbar view is present'
  step 'expect summary on reports toolbar view is present'
  step 'expect transactions on reports toolbar view is present'
end

Then /^expect area on reports toolbar view is present$/ do
  expect(SdcReports.toolbar.view.area).to be_present
end
Then /^expect bar on reports toolbar view is present$/ do
  expect(SdcReports.toolbar.view.bar).to be_present
end
Then /^expect column on reports toolbar view is present$/ do
  expect(SdcReports.toolbar.view.column).to be_present
end
Then /^expect 100% area on reports toolbar view is present$/ do
  expect(SdcReports.toolbar.view.area_100).to be_present
end
Then /^expect 100% bar on reports toolbar view is present$/ do
  expect(SdcReports.toolbar.view.bar_100).to be_present
end
Then /^expect 100% column on reports toolbar view is present$/ do
  expect(SdcReports.toolbar.view.column_100).to be_present
end
Then /^expect line on reports toolbar view is present$/ do
  expect(SdcReports.toolbar.view.line).to be_present
end
Then /^expect pie on reports toolbar view is present$/ do
  expect(SdcReports.toolbar.view.pie).to be_present
end
Then /^expect trend on reports toolbar view is present$/ do
  expect(SdcReports.toolbar.view.trend).to be_present
end
Then /^expect summary on reports toolbar view is present$/ do
  expect(SdcReports.toolbar.view.summary).to be_present
end
Then /^expect transactions on reports toolbar view is present$/ do
  expect(SdcReports.toolbar.view.transactions).to be_present
end

Then /^click (.*) on reports toolbar view$/ do |str|
  view = SdcReports.toolbar.view
  obj = case str
          when 'Area'
            view.area
          when 'Bar'
            view.bar
          when 'Column'
            view.column
          when '100% Area'
            view.area_100
          when '100% Bar'
            view.bar_100
          when '100% Column'
            view.column_100
          when 'Line'
            view.line
          when 'Pie'
            view.pie
          when 'Trend'
            view.trend
          when 'Summary'
            view.summary
          when 'Transactions'
            view.transactions
          else
            #ingore
        end
  obj.click
  step 'wait while loading reports grid'
end

# Interval
Then /^click interval link on reports toolbar$/ do
  SdcReports.toolbar.interval.link.click
  step 'hover on interval tooltip on reports toolbar'
  if SdcReports.toolbar.interval.tooltip.present?
    SdcReports.toolbar.interval.link.hover
    step 'hover on interval tooltip on reports toolbar'
  end
  step 'expect interval menu on reports toolbar has correct values'
end

Then /^hover on interval tooltip on reports toolbar$/ do
  SdcReports.toolbar.interval.tooltip.safe_wait_until_present(timeout: 5)
  SdcReports.toolbar.interval.tooltip.hover if SdcReports.toolbar.interval.tooltip.present?
end

Then /^expect interval menu on reports toolbar has correct values$/ do
  step 'expect days on reports toolbar interval is present'
  step 'expect weeks on reports toolbar interval is present'
  step 'expect months on reports toolbar interval is present'
  step 'expect quarters on reports toolbar interval is present'
  step 'expect years on reports toolbar interval is present'
end

Then /^expect days on reports toolbar interval is present$/ do
  expect(SdcReports.toolbar.interval.days).to be_present
end

Then /^expect weeks on reports toolbar interval is present$/ do
  expect(SdcReports.toolbar.interval.weeks).to be_present
end

Then /^expect months on reports toolbar interval is present$/ do
  expect(SdcReports.toolbar.interval.months).to be_present
end

Then /^expect quarters on reports toolbar interval is present$/ do
  expect(SdcReports.toolbar.interval.quarters).to be_present
end

Then /^expect years on reports toolbar interval is present$/ do
  expect(SdcReports.toolbar.interval.years).to be_present
end

Then /^click (.*) on reports toolbar interval$/ do |str|
  interval = SdcReports.toolbar.interval
  obj = case str
          when 'Days'
            interval.days
          when 'Weeks'
            interval.weeks
          when 'Months'
            interval.months
          when 'Quarters'
            interval.quarters
          when 'Years'
            interval.years
          else
            #ingore
        end
  obj.click
  step 'wait while loading reports grid'
end

# Data
Then /^click data link on reports toolbar$/ do
  SdcReports.toolbar.data.link.hover
  SdcReports.toolbar.data.link.click
  step 'hover on data tooltip on reports toolbar'
  if SdcReports.toolbar.data.tooltip.present?
    SdcReports.toolbar.data.link.hover
    step 'hover on data tooltip on reports toolbar'
  end
  step 'expect data menu on reports toolbar has correct values'
end

Then /^hover on data tooltip on reports toolbar$/ do
  SdcReports.toolbar.data.tooltip.safe_wait_until_present(timeout: 5)
  SdcReports.toolbar.data.tooltip.hover if SdcReports.toolbar.data.tooltip.present?
end

Then /^expect data menu on reports toolbar has correct values$/ do
  step 'expect cost on reports toolbar data is present'
  step 'expect count on reports toolbar data is present'
end

Then /^expect cost on reports toolbar data is present$/ do
  expect(SdcReports.toolbar.data.cost).to be_present
end

Then /^expect count on reports toolbar data is present$/ do
  expect(SdcReports.toolbar.data.count).to be_present
end

Then /^click (.*) on reports toolbar data/ do |str|
  data = SdcReports.toolbar.data
  obj = case str
          when 'Cost'
            data.cost
          when 'Count'
            data.count
          else
            #ingore
        end
  obj.click
  step 'wait while loading reports grid'
end

# Filters
Then /^click filters link on reports toolbar$/ do
  SdcReports.toolbar.filters.link.click
  step 'expect filters modal on reports is present'
end

#reset
Then /^expect reset on reports toolbar is present$/ do
  expect(SdcReports.toolbar.reset.icon).to be_present
end

Then /^click reset on reports toolbar$/ do
  SdcReports.toolbar.reset.icon.click
end

#print
Then /^expect print on reports toolbar is present$/ do
  expect(SdcReports.toolbar.print.icon).to be_present
end

Then /^click print on reports toolbar$/ do
  SdcReports.toolbar.print.click
end

#exports
Then /^expect export on reports toolbar is present$/ do
  expect(SdcReports.toolbar.export.icon).to be_present
end

Then /^click export on reports toolbar$/ do
  SdcReports.toolbar.export.click
end

#feedback
Then /^expect feedback on reports toolbar is present$/ do
  expect(SdcReports.toolbar.feedback.icon).to be_present
end

Then /^click feedback on reports toolbar$/ do
  SdcReports.toolbar.feedback.icon.click
  step 'expect feedback modal on reports is present'
end

#settings
Then /^expect settings on reports toolbar is present$/ do
  expect(SdcReports.toolbar.settings.icon).to be_present
end

Then /^click settings on reports toolbar$/ do
  SdcReports.toolbar.settings.click
end
