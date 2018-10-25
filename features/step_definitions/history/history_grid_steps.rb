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

end

Then /^expect history grid column Shipment Status is Printed for saved tracking number$/ do

end

Then /^expect history grid weight is correct for row (\d+)$/ do |row|
  str = "0 lbs. #{TestData.hash[:weight]} oz."
  step "expect history grid column Weight is #{str} for row #{row}"
end

