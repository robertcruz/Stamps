Then /^check row (\d+) on history grid$/ do |row|
  grid = SdcHistory.grid
  checkbox = grid.grid_column(:checkbox)
  row = checkbox.checkbox_row(row)
  row.check
  expect(row.checked?).to be_truthy
end

Then /^uncheck row (\d+) on history grid$/ do |row|
  grid = SdcHistory.grid
  checkbox = grid.grid_column(:checkbox)
  row = checkbox.checkbox_row(row)
  row.uncheck
  expect(row.checked?).to be false
end

Then /^expect row (\d+) on history grid is checked$/ do |row|
  expect(SdcHistory.grid.grid_column(:checkbox).checkbox_row(row).checked?).to be_truthy
end

Then /^check row for saved tracking number on history grid$/ do
  TestData.hash[:tracking_number] = '9405511899561459253313'
  expect(TestData.hash[:tracking_number]).to be_truthy
  expect(TestData.hash[:tracking_number].size).to be > 15
  tracking = SdcHistory.grid_column(:tracking_number)
  row_number = tracking.row_num(TestData.hash[:tracking_number])

  checkbox = grid.grid_column(:checkbox)
  row = checkbox.checkbox_row(row_number)
  row.check
end

Then /^expect history grid column (.+) is (.+) for row (\d+)$/ do |column, value, row|
  column_symbol = column.gsub(' ', '_').downcase.to_sym
  column = SdcHistory.grid.grid_column(column_symbol)
  expect(column.text_at_row(row)).to eql(value)
end


Then /^expect history grid column (.+) is (.+) for saved tracking number$/ do |column, value|
  grid_column = SdcHistory.grid.grid_column(:tracking_number)
  row_num = grid_column.row_num(TestData.hash[:tracking_number])
  step "expect history grid column #{column} is #{value} for row #{row_num}"
end

# correct for row #
Then /^expect history grid weight is correct for row (\d+)$/ do |row|
  str = "#{TestData.hash[:lbs]} lbs. #{TestData.hash[:oz]} oz."
  step "expect history grid column Weight is #{str} for row #{row}"
end

Then /^expect history tracking # is correct for row (\d+)$/ do |row|
  step "expect history grid column Tracking # is #{TestData.hash[:tracking]} for row #{row}"
end

Then /^expect history Service is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:service]} for row #{row}"
end

Then /^expect history grid Total Cost is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:total_ship_cost]} for row #{row}"
end

Then /^expect history grid Insured For is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:insure_for_cost]} for row #{row}"
end

Then /^expect history grid Cost Code is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:cost_code]} for row #{row}"
end

Then /^expect history grid Ship Date is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:ship_date]} for row #{row}"
end



Then /^expect prints within date range Past (.*) Days for column (.*) are retrieved in the grid$/ do |date_range,column_name|
  SdcHistory.grid.body.safe_wait_until_present(timeout: 60)
  #str ||= TestData.hash[:date_printed]
  column = SdcHistory.grid.grid_column(:date_printed)

  #Get the search counts
  search_results = SdcHistory.filter_panel.search_results
  search_count = search_results.count.text_value.to_i

  i =1
  while i < search_count
    actual_date = column.text_at_row(i)

    # --------- convert actual date in format for comparison ---------
    #SdcLogger.info "actual_date is : #{actual_date}"
    actual_date_desired_format=Date.strptime(actual_date,'%m/%d/%Y')
    #SdcLogger.info "actual_date_desired_format : #{actual_date_desired_format}"
    actual_convert_new_date_format = actual_date_desired_format.to_date
    #SdcLogger.info "Convert date in format YYYY-MM-DD : #{actual_convert_new_date_format}"

    #Get System date information for comparison
    system_date_var = Date.today
    #SdcLogger.info "system_date_var in format YYYY-MM-DD: #{system_date_var}"
    expected_date_range = date_range.to_i
    #p expected_date_range
    date_var_past_7_days = system_date_var-expected_date_range
    #SdcLogger.info "date_var_past_#{date_range}_days in format YYYY-MM-DD: #{date_var_past_7_days}"

    expect(actual_convert_new_date_format.between?(date_var_past_7_days,system_date_var)).to be(true)
    i=i+1
  end

  end

