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



Then /^expect prints within date range (.*) for column (.*) are retrieved in the grid$/ do |date_range,column_name|

  case date_range
  when 'Past 7 Days'
    new_date=Date.today-7
  when 'Past 30 Days'
    new_date=Date.today-30
  when 'Past 6 Months'
    new_date=Date.today<<6
  when 'Past 12 Months'
    new_date=Date.today<<12
  when 'Past 2 Years'
    new_date=Date.today<<24
  end

  SdcHistory.grid.body.safe_wait_until_present(timeout: 60)
  column = SdcHistory.grid.grid_column(:date_printed)
  pagination = SdcHistory.pagination

  # if count =0
  # No search results
  # else

 loop do
   #Get the search counts
   search_results = SdcHistory.filter_panel.search_results
   search_count = search_results.count.text_value.to_i
   p search_count
   i =1
  while i < search_count
    column.element(i).flash
    grid_date = column.text_at_row(i)
    formated_date=Date.strptime(grid_date,'%m/%d/%Y')
    expect(formated_date.between?(new_date,Date.today)).to be(true)
    i=i+1
  end

   if pagination.page_arrow_disabled('next').eql? ('false')
     step 'click on the pagination next button of history page'
   else
     break
   end

 end
end

  Then /^click on the pagination next button of history page$/ do
    next_button = SdcHistory.pagination
    next_button.page_next.flash
    next_button.page_next.click
  end

