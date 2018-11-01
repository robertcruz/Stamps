Then /^expect search bar is available on the contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_filter
  contacts_left_navigation.search_bar.safe_wait_until_present(timeout: 15)
  expect(contacts_left_navigation.search_bar.present?).to be (true)
end

Then /^click on search bar of contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_filter
  contacts_left_navigation.search_bar.safe_wait_until_present(timeout: 15)
  contacts_left_navigation.search_bar.click
end

Then /^expect selected filter on the contacts left navigation panel is available$/ do
  contacts_left_navigation = SdcContacts.contacts_filter
  contacts_left_navigation.selected_filter.safe_wait_until_present(timeout: 15)
  expect(contacts_left_navigation.selected.present?).to be (true)
end

Then /^expect count on selected filter is (.*)$/ do |count|
  sel = SdcContacts.contacts_filter.selected
  actual_count = sel.selected_count.text_value
  SdcLogger.info "actual : #{actual_count}"
  expect(actual_count.to_i).to eql(count.to_i)
end

Then /^click on selected filter of contacts left navigation panel$/ do
  sel = SdcContacts.contacts_filter.selected
  sel.selected.flash
  sel.selected.click
  SdcContacts.loading_contacts.safe_wait_until_present(timeout: 15)
  SdcContacts.grid.body.safe_wait_until_present(timeout: 15)
end

Then /^expect contacts grid message for selected contact is (.*)$/ do |message|
  grid = SdcContacts.grid.column
  expect(grid.count.to_i).to eql(0)
  expect(grid.grid_message.text_value).to eql(message)
end

Then /^expect all contacts filter is available on the contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_filter
  contacts_left_navigation.all_contacts_filter.safe_wait_until_present(timeout: 15)
  expect(contacts_left_navigation.all_contacts.present?).to be (true)
end

Then /^click on all contacts filter of contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_filter
  #all_con.all_contacts.flash
  contacts_left_navigation.all_contacts_filter.click
  SdcContacts.loading_contacts.safe_wait_until_present(timeout: 15)
  SdcContacts.grid.body.safe_wait_until_present(timeout: 15)
end

Then /^expect groups filter is available on the contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_filter
  contacts_left_navigation.groups_filter.safe_wait_until_present(timeout: 15)
  expect(contacts_left_navigation.groups.present?).to be (true)
end

Then /^expect cost codes filter is available on the contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_filter
  contacts_left_navigation.cost_codes_filter.safe_wait_until_present(timeout: 15)
  expect(contacts_left_navigation.cost_codes.present?).to be (true)
end

Then /^search contacts from contacts filter panel with name (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.contacts_detail_panel.safe_wait_until_present(timeout: 15)
  if str.eql?'newly added'
    value ||= TestData.hash[:full_name]
    step "set search text on contacts left navigation search bar to #{value}"
  else
    step "set search text on contacts left navigation search bar to #{str}"
  end
  step 'click search button on contacts left navigation search bar'
  SdcContacts.loading_contacts.safe_wait_until_present(timeout: 15)
  SdcContacts.grid.body.safe_wait_until_present(timeout: 15)
  SdcContacts.contacts_filter.search_results_filter.safe_wait_until_present(timeout:30)
end

Then /^delete all available contacts with the value (.*)$/ do |str|
  step "search contacts from contacts filter panel with name #{str}"
  search_results = SdcContacts.contacts_filter.search_results
  actual_count = search_results.search_results_count.text_value
  if actual_count.to_i != 0
    i = 1
    while i <= actual_count.to_i
      step "in contacts grid check row #{i}"
      i = i + 1
    end
    step 'click delete button on contacts toolbar'
    step 'click yes button on delete contacts modal'
    #SdcLogger.info 'actual :' + actual_count
    new_count = search_results.search_results_count.text_value
    #SdcLogger.info 'new_count :' + new_count
    expect(new_count.to_i).to eql (0)
  end
end

Then /^set search text on contacts left navigation search bar to (.*)$/ do |str|
  contacts_left_navigation = SdcContacts.contacts_filter
  contacts_left_navigation.search_bar.safe_wait_until_present(timeout: 15)
  contacts_left_navigation.search_bar.set(str)
end

Then /^click search button on contacts left navigation search bar$/ do
  contacts_left_navigation = SdcContacts.contacts_filter
  contacts_left_navigation.search_icon.safe_wait_until_present(timeout: 15)
  contacts_left_navigation.search_icon.click
end

Then /^expect search results is available on the contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_filter
  contacts_left_navigation.search_results_filter.safe_wait_until_present(timeout: 15)
  expect(contacts_left_navigation.search_results_filter.present?).to be (true)
end

Then /^expect contacts with (.*) containing the value (.*) are retrieved in the grid/ do |column_name,value|
  search_results = SdcContacts.contacts_filter.search_results
  search_count = search_results.search_results_count.text_value
  SdcLogger.info "Search Count : #{search_count}"
  case column_name
  when 'Name'
    column = SdcContacts.grid.grid_column(:name)
    expect(column).present?
    expect(column.header_text).to eql('Name')
  end
  i = 1
  while i <= search_count.to_i
    actual_value = column.text_at_row(i).downcase.to_sym
    SdcLogger.info "value of #{column_name} at row #{i} is #{actual_value}"
    SdcLogger.info "value passed is #{value}"
    expect(actual_value.to_s.include? value.to_s).to be true
    i = i + 1
  end
end

Then /^expect contacts grid message for searched contact is (.*)$/ do |message|
  grid = SdcContacts.grid.column
  expect(grid.count.to_i).to eql(0)
  expect(grid.grid_message.text_value).to eql(message)
end

Then /^expect count of contact search results is (.*)$/ do |count|
  search_results = SdcContacts.contacts_filter.search_results
  actual_count = search_results.search_results_count.text_value
  expect(actual_count.to_i).to eql(count.to_i)
end

Then /^click remove button on search results of contacts filter$/ do
  search_results = SdcContacts.contacts_filter.search_results
  search_results.search_results_remove.safe_wait_until_present(timeout: 15)
  search_results.search_results_remove.click
end

Then /^click on expand button of contacts left navigation$/ do
  left_navigation = SdcContacts.contacts_filter
  left_navigation.expand.safe_wait_until_present(timeout: 15)
  left_navigation.expand.click
  expect(left_navigation.collapse.present?).to be(true)
end

Then /^click on collapse button of contacts left navigation$/ do
  left_navigation = SdcContacts.contacts_filter
  left_navigation.collapse.safe_wait_until_present(timeout: 15)
  left_navigation.collapse.click
  expect(left_navigation.expand.present?).to be(true)
end

Then /^fetch total count of all contacts$/ do
  left_nav_all_contacts = SdcContacts.contacts_filter.all_contacts
  left_nav_all_contacts.all_contacts.safe_wait_until_present(timeout: 15)
  SdcLogger.info "All Contacts count : #{left_nav_all_contacts.all_contacts_count.text_value}"
end

Then /^fetch count of selected contacts$/ do
  left_nav_selected = SdcContacts.contacts_filter.selected
  left_nav_selected.selected.safe_wait_until_present(timeout: 15)
  SdcLogger.info "Selected Contacts count #{left_nav_selected.selected_count.text_value}"
end

Then /^select an existing cost code from left navigation filter panel/ do
  step 'click on cost codes expand button of contacts left navigation'
  left_nav_costcode = SdcContacts.contacts_filter.cost_codes
  row_count = left_nav_costcode.total_costcodes.count
  if row_count > 1
    left_nav_costcode.cost_code_element(row_count - 1).click
  else
    SdcLogger.info 'No cost codes for this account to select'
    left_nav_costcode.cost_code_element(row_count).click
  end
  step 'click on cost codes collapse button of contacts left navigation'
end

Then /^select an existing group from left navigation filter panel/ do
  step 'click on groups expand button of contacts left navigation'
  left_nav_group = SdcContacts.contacts_filter.groups
  row_count = left_nav_group.total_groups.count
  if row_count > 1
    left_nav_group.group_element(row_count - 1).click
  else
    SdcLogger.info 'No cost codes for this account to select'
    left_nav_group.group_element(row_count).click
  end
  step 'click on groups collapse button of contacts left navigation'
end
