
Then /^expand date printed on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.header.click unless date_printed.today.present?
  expect(date_printed.today.text).to eql 'Today'
end

# Today
Then /^select today on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.today.select
  step 'wait while loading history grid'
  begin
    SdcPage.browser.wait_until(timeout: 5) { date_printed.today.selected? }
  rescue
    # ignore
  end
  expect(date_printed.today.selected?).to be true
end

Then /^expect today is selected on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.today.selected?).to be true
end

Then /^expect today count on history filter panel is greater than (\d+)$/ do |num|
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.today_count.text.to_i).to be > num.to_i
end

# Past 7 Days
Then /^select past 7 days on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.past_7_days.select
  step 'wait while loading history grid'
  begin
    SdcPage.browser.wait_until(timeout: 5) { date_printed.past_30_days.selected? }
  rescue
    # ignore
  end
  expect(date_printed.past_7_days.selected?).to be true
end

Then /^expect past 7 days is selected on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_7_days.selected?).to be true
end

Then /^expect past 7 days count on history filter panel is greater than (\d+)$/ do |num|
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_7_days_count.text.to_i).to be > num.to_i
end

# Past 30 Days
Then /^select past 30 days on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.past_30_days.select
  step 'wait while loading history grid'
  begin
    SdcPage.browser.wait_until(timeout: 5) { date_printed.past_30_days.selected? }
  rescue
    # ignore
  end
  expect(date_printed.past_30_days.selected?).to be true
end

Then /^expect past 30 days is selected on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_30_days.selected?).to be true
end

Then /^expect past 30 days count on history filter panel is greater than (\d+)$/ do |num|
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_30_days_count.text.to_i).to be > num.to_i
end

# Past 3 Months
Then /^select past 3 months on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.past_3_months.select
  step 'wait while loading history grid'
  begin
    SdcPage.browser.wait_until(timeout: 5) { date_printed.past_30_days.selected? }
  rescue
    # ignore
  end
  expect(date_printed.past_3_months.selected?).to be true
end

Then /^expect past 3 months is selected on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_3_months.selected?).to be true
end

Then /^expect past 3 months count on history filter panel is greater than (\d+)$/ do |num|
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_3_months_count.text.to_i).to be > num.to_i
end

# Past 6 Months
Then /^select past 6 months on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.past_6_months.select
  step 'wait while loading history grid'
  begin
    SdcPage.browser.wait_until(timeout: 5) { date_printed.past_30_days.selected? }
  rescue
    # ignore
  end
  expect(date_printed.past_6_months.selected?).to be true
end

Then /^expect past 6 months is selected on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_6_months.selected?).to be true
end

Then /^expect past 6 months count on history filter panel is greater than (\d+)$/ do |num|
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_6_months_count.text.to_i).to be > num.to_i
end

# Past 12 Months
Then /^select past 12 months on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.past_12_months.select
  step 'wait while loading history grid'
  begin
    SdcPage.browser.wait_until(timeout: 5) { date_printed.past_30_days.selected? }
  rescue
    # ignore
  end
  expect(date_printed.past_12_months.selected?).to be true
end

Then /^expect past 12 months is selected on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_12_months.selected?).to be true
end

Then /^expect past 12 months count on history filter panel is greater than (\d+)$/ do |num|
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_12_months_count.text.to_i).to be > num.to_i
end

# Past 2 Years
Then /^select past 2 years on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.past_2_years.select
  step 'wait while loading history grid'
  begin
    SdcPage.browser.wait_until(timeout: 5) { date_printed.past_30_days.selected? }
  rescue
    # ignore
  end
  expect(date_printed.past_2_years.selected?).to be true
end

Then /^expect past 2 years is selected on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_2_years.selected?).to be true
end

Then /^expect past 2 years count on history filter panel is greater than (\d+)$/ do |num|
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_2_years_count.text.to_i).to be > num.to_i
end

# All
Then /^select all on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.all.select
  step 'wait while loading history grid'
  begin
    SdcPage.browser.wait_until(timeout: 5) { date_printed.past_30_days.selected? }
  rescue
    # ignore
  end
  expect(date_printed.all.selected?).to be true
end

Then /^expect all is selected on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.all.selected?).to be true
end

Then /^expect all count on history filter panel is greater than (\d+)$/ do |num|
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.all_count.text.to_i).to be > num.to_i
end

#Eligible For
Then /^expand eligible for on history filter panel$/ do
  SdcHistory.filter_panel.eligible_for.after_eligible_for_tool.click
  expect(SdcHistory.filter_panel.eligible_for.refund).to be_present
end

Then /^select refund on history filter panel eligible for$/ do
  refund = SdcHistory.filter_panel.eligible_for.refund
  refund.select
  step 'wait while loading history grid'
  begin
    SdcPage.browser.wait_until(timeout: 5) { refund.selected? }
  rescue
    # ignore
  end
  expect(date_printed.past_7_days.selected?).to be true
end

Then /^expect refund is selected on history filter panel eligible for$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_7_days.selected?).to be true
end
