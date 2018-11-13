Then /^check row header in contacts grid$/ do
  contacts_grid_body = SdcContacts.grid.body
  contacts_grid_body.safe_wait_until_present(timeout: 10)
  header_checkbox = SdcContacts.grid.column.contacts_header_element(:checkbox)
  header_checkbox.safe_wait_until_present(timeout: 10)
  header_checkbox.check unless header_checkbox.checked?
  expect(header_checkbox.checked?).to be(true)
end

Then /^uncheck row header in contacts grid$/ do
  contacts_grid_body = SdcContacts.grid.body
  contacts_grid_body.safe_wait_until_present(timeout: 10)
  header_checkbox = SdcContacts.grid.column.contacts_header_element(:checkbox)
  header_checkbox.safe_wait_until_present(timeout: 10)
  header_checkbox.uncheck if header_checkbox.checked?
  expect(header_checkbox.checked?).to be(false)
end

Then /^in contacts grid check row (\d+)$/ do |row|
  contacts_grid_body = SdcContacts.grid.body
  contacts_grid_body.safe_wait_until_present(timeout: 60)
  checkbox = SdcContacts.grid.grid_column(:checkbox).checkbox_row(row)
  checkbox.safe_wait_until_present(timeout: 30)
  checkbox.check  unless checkbox.checked?
  expect(checkbox.checked?).to be(true)
  contacts_detail = SdcContacts.details
  contacts_detail.contacts_detail_panel.safe_wait_until_present(timeout: 30)
end

Then /^in contacts grid uncheck row (\d+)$/ do |row|
  contacts_grid_body = SdcContacts.grid.body
  contacts_grid_body.safe_wait_until_present(timeout: 60)
  checkbox = SdcContacts.grid.grid_column(:checkbox).checkbox_row(row)
  checkbox.safe_wait_until_present(timeout: 30)
  checkbox.uncheck if checkbox.checked?
  expect(checkbox.checked?).to be(false)
end

Then /^expect number of contacts displayed in the grid is (.*)$/ do |count|
  grid = SdcContacts.grid.column
  expect(grid.count.to_i).to eql(count.to_i)
end

Then /^expect number of visible contacts grid column is (?:correct|(.*))$/ do |count|
  count ||= 20
  actual_count = 0
  SdcContacts.grid.columns.each do |column|
    element = SdcElement.new(column)
    element.scroll_into_view
    actual_count += 1 if element.text_value.size >= 1
  end
  expect(actual_count).to eql count
end

Then /^expect contacts grid name column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:full_name]
  column = SdcContacts.grid.grid_column(:name)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid prefix column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:prefix]
  column = SdcContacts.grid.grid_column(:prefix)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid first name column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:first_name]
  column = SdcContacts.grid.grid_column(:first_name)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid last name column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:last_name]
  column = SdcContacts.grid.grid_column(:last_name)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid middle name column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:middle_name]
  column = SdcContacts.grid.grid_column(:middle)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid suffix column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:suffix]
  column = SdcContacts.grid.grid_column(:suffix)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end


Then /^expect contacts grid company column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:company]
  column = SdcContacts.grid.grid_column(:company)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid title column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:title]
  column = SdcContacts.grid.grid_column(:title)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end
Then /^expect contacts grid department column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:department]
  column = SdcContacts.grid.grid_column(:department)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid country column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:country]
  if str.eql? 'United States'
    country_abbrv = 'US'
  else
    countries = data_for(:countries, {})
    country_abbrv = countries.key(str)
  end
  new_value = "#{country_abbrv} - #{str}"
  column = SdcContacts.grid.grid_column(:country)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql new_value
end

Then /^expect contacts grid street address column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:street_address]
  column = SdcContacts.grid.grid_column(:street_address)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid city column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:city]
  column = SdcContacts.grid.grid_column(:city)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid state column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:state]
  us_states = data_for(:us_states, {})
  new_value = us_states.key(str)
  column = SdcContacts.grid.grid_column(:state_prv)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql new_value
end

Then /^expect contacts grid province column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:province]
  column = SdcContacts.grid.grid_column(:state_prv)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid postal code column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:postal_code]
  column = SdcContacts.grid.grid_column(:postal_code)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid email column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:email]
  column = SdcContacts.grid.grid_column(:email)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid phone column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:phone]
  column = SdcContacts.grid.grid_column(:phone)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid phone ext column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:phone_ext]
  column = SdcContacts.grid.grid_column(:phone_ext)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid reference no column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:reference_number]
  if str.eql?('blank')
    str=''
  end
  column = SdcContacts.grid.grid_column(:reference_no)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect contacts grid cost code column at row (\d+) is (?:correct|(.*))$/ do |row, str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  step 'expect number of visible contacts grid column is correct'
  str ||= TestData.hash[:cost_code]
  column = SdcContacts.grid.grid_column(:cost_code)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end
