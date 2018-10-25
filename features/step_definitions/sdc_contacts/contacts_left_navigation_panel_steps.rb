Then /^expect search bar is available on the contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_left_navigation_panel
  contacts_left_navigation.search_bar.safe_wait_until_present(timeout: 15)
  expect(contacts_left_navigation.search_bar.present?).to be (true)
end

Then /^click on search bar of contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_left_navigation_panel
  contacts_left_navigation.search_bar.safe_wait_until_present(timeout: 15)
 contacts_left_navigation.search_bar.click
end

Then /^expect selected filter on the contacts left navigation panel is available$/ do
  contacts_left_navigation = SdcContacts.contacts_left_navigation_panel
  contacts_left_navigation.selected.safe_wait_until_present(timeout: 15)
  expect(contacts_left_navigation.selected.present?).to be (true)
end

Then /^expect count on selected filter is (.*)$/ do |count|
  sel = SdcContacts.contacts_left_navigation_selected_contacts
  actual_count = sel.selected_count.text_value
  p 'actual :' + actual_count
  expect(actual_count == count).to be (true)
end

Then /^click on selected filter of contacts left navigation panel$/ do
  sel = SdcContacts.contacts_left_navigation_selected_contacts
  sel.selected.flash
  sel.selected.click
  SdcContacts.loading_contacts.safe_wait_until_present(timeout: 15)
  SdcContacts.contacts_body.safe_wait_until_present(timeout: 15)
end

Then /^expect empty state message of selected contacts is displayed on the contacts grid$/ do
  grid = SdcContacts.contacts_col
  expect(grid.count == 0).to be(true)
  expect(grid.grid_message).to eql('There are no contacts selected.')
end

Then /^expect contacts grid message for selected contact is (.+)$/ do |str|
  grid = SdcContacts.contacts_col
  expect(grid.count).to equal 0
  expect(grid.grid_message).to eql(str)
end

Then /^expect all contacts filter is available on the contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_left_navigation_panel
  contacts_left_navigation.all_contacts.safe_wait_until_present(timeout: 15)
  expect(contacts_left_navigation.all_contacts.present?).to be (true)
end

Then /^click on all contacts filter of contacts left navigation panel$/ do
  all_con = SdcContacts.contacts_left_navigation_all_contacts
  all_con.all_contacts.flash
  all_con.all_contacts.click
  SdcContacts.loading_contacts.safe_wait_until_present(timeout: 15)
  SdcContacts.contacts_body.safe_wait_until_present(timeout: 15)
end

Then /^expect groups filter is available on the contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_left_navigation_panel
  contacts_left_navigation.groups.safe_wait_until_present(timeout: 15)
  expect(contacts_left_navigation.groups.present?).to be (true)
end

Then /^expect cost codes filter is available on the contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_left_navigation_panel
  contacts_left_navigation.cost_codes.safe_wait_until_present(timeout: 15)
  expect(contacts_left_navigation.cost_codes.present?).to be (true)
end

Then /^search for contact (.*) from the contacts left navigation filter$/ do |str|
  contacts_detail = SdcContacts.contacts_detail
  contacts_detail.contacts_detail_panel.safe_wait_until_present(timeout: 15)
  if str == 'newly added'
    value ||= TestData.hash[:full_name]
    step "set search text on contacts left navigation search bar to #{value}"
  else
    step "set search text on contacts left navigation search bar to #{str}"
  end
  step "click search button on contacts left navigation search bar"
  SdcContacts.loading_contacts.safe_wait_until_present(timeout: 15)
  SdcContacts.contacts_body.safe_wait_until_present(timeout: 15)
  SdcContacts.contacts_left_navigation_panel.search_results.safe_wait_until_present(timeout:30)
end

Then /^delete all available contacts with the value (.*)$/ do |str|
  step "on left navigation menu search contact #{str}"
  search_results = SdcContacts.contacts_left_navigation_search_results
  actual_count = search_results.search_results_count.text_value
  if actual_count.to_i != 0
    i = 1
    while i <= actual_count.to_i
      step "in contacts grid check row #{i}"
      i = i + 1
    end
    step "click contacts toolbar delete button"
    step "delete contacts message box click on yes button"
    #SdcLogger.info 'actual :' + actual_count
    new_count = search_results.search_results_count.text_value
    #SdcLogger.info 'new_count :' + new_count
    expect(new_count == '0').to be (true)
  end
end

Then /^set search text on contacts left navigation search bar to (.*)$/ do |str|
  contacts_left_navigation = SdcContacts.contacts_left_navigation_panel
  contacts_left_navigation.search_bar.safe_wait_until_present(timeout: 15)
  contacts_left_navigation.search_bar.set(str)
end

Then /^click search button on contacts left navigation search bar$/ do
  contacts_left_navigation = SdcContacts.contacts_left_navigation_panel
  contacts_left_navigation.search_icon.safe_wait_until_present(timeout: 15)
  contacts_left_navigation.search_icon.click
end

Then /^expect search results is available on the contacts left navigation panel$/ do
  contacts_left_navigation = SdcContacts.contacts_left_navigation_panel
  contacts_left_navigation.search_results.safe_wait_until_present(timeout: 15)
  expect(contacts_left_navigation.search_results.present?).to be (true)
end

Then /^expect contacts with (.*) containing the value (.*) are retrieved in the grid/ do |column_name,value|
  search_results = SdcContacts.contacts_left_navigation_search_results
  search_count = search_results.search_results_count.text_value
  SdcLogger.info "Search Count : #{search_count}"
  case column_name
  when 'Name'
    column = SdcContacts.contacts_grid_column(:name)
    expect(column).present?
    expect(column.contacts_header_text).to eql('Name')
  end
  i = 1
  while i <= search_count.to_i
    actual_value = column.contacts_text_at_row(i).downcase.to_sym
    SdcLogger.info "value of #{column_name} at row #{i} is #{actual_value}"
    SdcLogger.info "value passed is #{value}"
    expect(actual_value.to_s.include? value.to_s).to be true
    i = i + 1
  end
end

Then /^expect empty search message for searched contact is displayed on the contacts grid$/ do
  grid = SdcContacts.contacts_col
  expect(grid.count == 0).to be(true)
  expect(grid.grid_message).to eql('No contacts found.')
end

Then /^expect count of contact search results is (.*)$/ do |count|
  search_results = SdcContacts.contacts_left_navigation_search_results
  actual_count = search_results.search_results_count.text_value
  expect(actual_count == count).to be (true)
end

Then /^click on remove button of search results on contacts left navigation panel$/ do
  search_results = SdcContacts.contacts_left_navigation_search_results
  search_results.search_results_remove.safe_wait_until_present(timeout: 15)
  search_results.search_results_remove.click
end

Then /^click on expand button of contacts left navigation$/ do
  left_navigation = SdcContacts.contacts_left_navigation_panel
  left_navigation.expand.safe_wait_until_present(timeout: 15)
  left_navigation.expand.click
  expect(left_navigation.collapse.present?).to be(true)
end

Then /^click on collapse button of contacts left navigation$/ do
  left_navigation = SdcContacts.contacts_left_navigation_panel
  left_navigation.collapse.safe_wait_until_present(timeout: 15)
  left_navigation.collapse.click
  expect(left_navigation.expand.present?).to be(true)
end

Then /^fetch total count of all contacts$/ do
  left_nav_all_contacts = SdcContacts.contacts_left_navigation_all_contacts
  left_nav_all_contacts.all_contacts.safe_wait_until_present(timeout: 15)
  SdcLogger.info "All Contacts count : #{left_nav_all_contacts.all_contacts_count.text_value}"
end

Then /^fetch count of selected contacts$/ do
  left_nav_selected = SdcContacts.contacts_left_navigation_selected_contacts
  left_nav_selected.selected.safe_wait_until_present(timeout: 15)
  SdcLogger.info "Selected Contacts count #{left_nav_selected.selected_count.text_value}"
end

Then /^select an existing cost code from left navigation filter panel/ do
  step "click on cost codes expand button of contacts left navigation"
  left_nav_costcode = SdcContacts.contacts_left_nav_cost_code
  row_count = left_nav_costcode.total_costcodes.count
  if row_count > 1
    left_nav_costcode.cost_code_element(row_count - 1).click
  else
    SdcLogger.info "No cost codes for this account to select"
    left_nav_costcode.cost_code_element(row_count).click
  end
  step "click on cost codes collapse button of contacts left navigation"
end

Then /^select an existing group from left navigation filter panel/ do
  step "click on groups expand button of contacts left navigation"
  left_nav_group = SdcContacts.contacts_left_nav_group
  row_count = left_nav_group.total_groups.count
  if row_count > 1
    left_nav_group.group_element(row_count - 1).click
  else
    SdcLogger.info "No cost codes for this account to select"
    left_nav_group.group_element(row_count).click
  end
  step "click on groups collapse button of contacts left navigation"
end

