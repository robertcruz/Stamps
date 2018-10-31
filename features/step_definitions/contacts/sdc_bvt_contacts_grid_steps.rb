Then /^check row header in contacts grid$/ do
  contacts_grid_body = SdcContacts.grid.body
  contacts_grid_body.safe_wait_until_present(timeout: 10)
  header_checkbox = SdcContacts::Grid::column.header_element(:checkbox)
  header_checkbox.safe_wait_until_present(timeout: 10)
  header_checkbox.check unless header_checkbox.checked?
  expect(header_checkbox.checked?).to be(true)
end

Then /^uncheck row header in contacts grid$/ do
  contacts_grid_body = SdcContacts.grid.body
  contacts_grid_body.safe_wait_until_present(timeout: 10)
  header_checkbox = SdcContacts::Grid::column.header_element(:checkbox)
  header_checkbox.safe_wait_until_present(timeout: 10)
  header_checkbox.uncheck if header_checkbox.checked?
  expect(header_checkbox.checked?).to be(false)
end

Then /^in contacts grid check row (\d+)$/ do |row|
  contacts_grid_body = SdcContacts.grid.body
  contacts_grid_body.safe_wait_until_present(timeout: 60)
  checkbox = SdcContacts::Grid.grid_column(:checkbox).checkbox_row(row)
  checkbox.safe_wait_until_present(timeout: 30)
  checkbox.check  unless checkbox.checked?
  expect(checkbox.checked?).to be(true)
  contacts_detail = SdcContacts.details
  contacts_detail.contacts_detail_panel.safe_wait_until_present(timeout: 30)
end

Then /^in contacts grid uncheck row (\d+)$/ do |row|
  contacts_grid_body = SdcContacts.grid.body
  contacts_grid_body.safe_wait_until_present(timeout: 60)
  checkbox = SdcContacts::Grid.grid_column(:checkbox).checkbox_row(row)
  checkbox.safe_wait_until_present(timeout: 30)
  checkbox.uncheck if checkbox.checked?
  expect(checkbox.checked?).to be(false)
  #contacts_detail = SdcContacts.contacts_detail
  #expect(contacts_detail.contacts_detail_panel.present?).to be(false)
end
Then /^expect number of contacts displayed in the grid is (.*)$/ do |count|
  grid = SdcContacts.grid.column
  expect(grid.count.to_i).to eql(count.to_i)
end

Then /^expect number of visible contacts grid column is (?:correct|(.*))$/ do |count|
  columns = SdcContacts.grid.columns
  count ||= 19
  actual_count = 0
  columns.each do |column|
    actual_count += 1 if column.text.size > 3
  end
  expect(actual_count).to eql count
end

Then /^expect name in contacts grid is (?:correct|(.*))$/ do |str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  str ||= TestData.hash[:full_name]
  step 'expect number of visible contacts grid column is correct'
  column = SdcContacts.grid.grid_column(:name)
  actual_value = column.text_at_row(1)
  expect(actual_value.strip).to eql str.strip
end

Then /^expect company in contacts grid is (?:correct|(.*))$/ do |str|
  SdcContacts.grid.body.safe_wait_until_present(timeout: 60)
  str ||= TestData.hash[:company]
  step 'expect number of visible contacts grid column is correct'
  column = SdcContacts.grid.grid_column(:company)
  actual_value = column.text_at_row(1)
  expect(actual_value.strip).to eql str.strip
end



















Then /^expect name details on contacts grid are updated appropriately for (.*)$/ do |name|
  contacts_grid_body = SdcContacts.grid.body
  contacts_grid_body.safe_wait_until_present(timeout: 60)

  expect(contacts_grid_body.present?).to be true

  col_prefix = SdcContacts.grid.grid_column(:prefix)
  value_prefix = col_prefix.text_at_row(1)

  col_first = SdcContacts.grid.grid_column(:first_name)
  value_first = col_first.text_at_row(1)

  col_middle = SdcContacts.grid.grid_column(:middle)
  value_middle = col_middle.contacts_text_at_row(1)

  col_last = SdcContacts.grid.grid_column(:last_name)
  value_last = col_last.contacts_text_at_row(1)

  words = name.split(" ")
  word_count = words.length
  case word_count
  when 1
    if words[0].eql?('CAPT') || words[0].eql?('BG')
      expect(value_prefix).to eql words[0]
    else
      expect(value_last).to eql words[0]
    end
  when 2
    if words[0].eql?'CAPT'
      expect(value_prefix).to eql words[0]
      expect(value_last).to eql words[1]
    else
      expect(value_first).to eql words[0]
      expect(value_last).to eql words[1]
    end
  when 3
    if words[0].eql?("CAPT") || words[0].eql?("ENS")
      expect(value_prefix).to eql words[0]
      expect(value_first).to eql words[word_count - 2]
      expect(value_last).to eql words[word_count - 1]
      SdcLogger.info "#{value_prefix} - Prefix: #{words[0]}"
      SdcLogger.info "#{value_first} - First: #{words[word_count - 2]}"
      SdcLogger.info "#{value_last} - Last: ' #{words[word_count - 1]}"
    else
      expect(value_first).to eql words[0]
      expect(value_middle).to eql words[word_count - 2]
      expect(value_last).to eql words[word_count - 1]
    end
  else
    if words[0].eql?("CAPT") || words[0].eql?("BGen.")
      expect(value_prefix).to eql words[0]
      SdcLogger.info "#{value_prefix} - Prefix: #{words[0]}"
      i = 1
    else
      i = 0
    end
    firstname = ""
    while i < word_count - 2
      firstname = firstname + words[i] + " "
      i = i + 1
    end
    expect(value_last).to eql words[word_count - 1]
    expect(value_middle).to eql words[word_count - 2]
    expect(value_first).to eql firstname.rstrip
    #p value_last+'- Last :' + words[word_count-1]
    #p value_middle+'- Middle :'+words[word_count-2]
    #p value_first+'- First :' + firstname
  end
end

Then /^expect values of contact added in contacts grid are correct$/ do

  company = TestData.hash[:company]
  country = TestData.hash[:country]
  street_address = TestData.hash[:street_address]
  city = TestData.hash[:city]
  state = TestData.hash[:state]
  postal_code = TestData.hash[:postal_code]
  email = TestData.hash[:email]
  phone = TestData.hash[:phone]
  phone_ext = TestData.hash[:phone_ext]
  reference_number = TestData.hash[:reference_number]
  cost_code = TestData.hash[:cost_code]

  step "expect value of Name in contacts grid is #{full_name}"
  step "expect value of Company in contacts grid is #{company}"
  step "expect value of Country in contacts grid is #{country}"
  step "expect value of Street Address in contacts grid is #{street_address}"
  step "expect value of City in contacts grid is #{city}"
  if country.eql? 'United States'
    step "expect value of State/Prv in contacts grid is #{state}"
  else
    step "expect value of Province in contacts grid is #{state}"
  end
  step "expect value of Postal Code in contacts grid is #{postal_code}"
  step "expect value of Email in contacts grid is #{email}"
  step "expect value of Phone in contacts grid is #{phone}"
  step "expect value of Phone Extension in contacts grid is #{phone_ext}"
  step "expect value of Reference Number in contacts grid is #{reference_number}"
  step "expect value of Cost Code in contacts grid is #{cost_code}"
end

#Validate Details in Contacts Grid
# Then /^expect value of (.*) in contacts grid is (?:correct|(.*))$/ do |col, value|
#   contacts_grid_body = SdcContacts.grid.body
#   contacts_grid_body.safe_wait_until_present(timeout: 60)
#
#   #SdcLogger.info '**Grid**'
#
#   new_value = if value.eql?'blank'
#                 ""
#               elsif value.eql? 'correct?'
#                 temp
#               else
#                 value
#               end
#
#   actual_value = column.text_at_row(1)
#
#   if column.header_text.eql?('Country')
#     val = actual_value.split('-')
#     expect(val[1].strip).to eql new_value.strip
#   elsif column.header_text.eql?('State/Prv') && col.eql?('State/Prv')
#     us_states = data_for(:us_states, {})
#     new_value = us_states.key(value)
#     expect(actual_value.strip).to eql new_value.strip
#   else
#     expect(actual_value.strip).to eql new_value.strip
#   end
#
#   SdcLogger.info "given value : #{value}"
#   SdcLogger.info "modified given value : #{new_value}"
#   SdcLogger.info "value on Grid :#{actual_value}"
#
# end

#todo-Navya create a new test that validates column names.
#
#

# case col
# when 'Name'
#   column = SdcContacts.grid.grid_column(:name)
#   expect(column).present?
#   expect(column.header_text).to eql('Name')
#
# when 'Prefix'
#   column = SdcContacts.grid.grid_column(:prefix)
#   expect(column).present?
#   expect(column.header_text).to eql('Prefix')
#
# when 'First Name'
#   column = SdcContacts.grid.grid_column(:first_name)
#   expect(column).present?
#   expect(column.header_text).to eql('First Name')
#
# when 'Middle Name'
#   column = SdcContacts.grid.grid_column(:middle)
#   expect(column).present?
#   expect(column.header_text).to eql('Middle')
#
# when 'Last Name'
#   column = SdcContacts.grid.grid_column(:last_name)
#   expect(column).present?
#   expect(column.header_text).to eql('Last Name')
#
# when 'Suffix'
#   column = SdcContacts.grid.grid_column(:suffix)
#   expect(column).present?
#   expect(column.header_text).to eql('Suffix')
#
# when 'Company'
#   column = SdcContacts.grid.grid_column(:company)
#   expect(column).present?
#   expect(column.header_text).to eql('Company')
#
# when 'Title'
#   column = SdcContacts.grid.grid_column(:title)
#   expect(column).present?
#   expect(column.header_text).to eql('Title')
#
# when 'Department'
#   column = SdcContacts.grid.grid_column(:department)
#   expect(column).present?
#   expect(column.header_text).to eql('Department')
#
# when 'Country'
#   column = SdcContacts.grid.grid_column(:country)
#   expect(column).present?
#   expect(column.header_text).to eql('Country')
#
# when 'Street Address'
#   column = SdcContacts.grid.grid_column(:street_address)
#   expect(column).present?
#   expect(column.header_text).to eql('Street Address')
#
# when 'City'
#   column = SdcContacts.grid.grid_column(:city)
#   expect(column).present?
#   expect(column.header_text).to eql('City')
#
# when 'State/Prv'
#   column = SdcContacts.grid.grid_column(:state_prv)
#   expect(column).present?
#   expect(column.header_text).to eql('State/Prv')
#
# when 'Province'
#   column = SdcContacts.grid.grid_column(:state_prv)
#   expect(column).present?
#   expect(column.header_text).to eql('State/Prv')
#
# when 'Postal Code'
#   column = SdcContacts.grid.grid_column(:postal_code)
#   expect(column).present?
#   expect(column.header_text).to eql('Postal Code')
#
# when 'Email'
#   column = SdcContacts.grid.grid_column(:email)
#   expect(column).present?
#   expect(column.header_text).to eql('Email')
#
# when 'Phone'
#   column = SdcContacts.grid.grid_column(:phone)
#   expect(column).present?
#   expect(column.header_text).to eql('Phone')
#
# when 'Phone Extension'
#   column = SdcContacts.grid.grid_column(:phone_ext)
#   expect(column).present?
#   expect(column.header_text).to eql('Ext.')
#
# when 'Reference Number'
#   column = SdcContacts.grid.grid_column(:reference_no)
#   expect(column).present?
#   expect(column.header_text).to eql('Reference #')
#
# when 'Cost Code'
#   column = SdcContacts.grid.grid_column(:cost_code)
#   expect(column).present?
#   expect(column.header_text).to eql('Cost Code')
#   if value == "correct?"
#     temp ||= TestData.hash[:costcode_val]
#   end
# end