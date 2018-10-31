
Then /^add a valid contact with domestic address$/ do

  full_name = TestHelper.rand_full_name
  company = TestHelper.rand_comp_name
  country = 'United States'
  street_address = '2441 61st St'
  city = 'Port Arthur'
  state = 'TX'
  postal_code = '77640-6942'
  email = TestHelper.rand_email
  full_phone = TestHelper.rand_phone_format
  phone_ext =  TestHelper.rand_phone
  #groups =  TestHelper.rand_group_name
  reference_number = TestHelper.rand_reference_number
  #cost_code =  param['cost_code']

  step "set contact details name to #{full_name}"
  step "set contact details company to #{company}"
  step "set contact details country to #{country}"
  step "set contact details street address to #{street_address}"
  step "set contact details city to #{city}"
  step "set contact details state to #{state}"
  step "set contact details postal code to #{postal_code}"
  step "set contact details email to #{email}"
  step "set contact details phone to #{full_phone}"
  #step "set contact details groups to #{groups}"
  step "set contact details reference number to #{reference_number}"
  #step "set contact details groups to #{}cost_code}"

  TestData.hash[:full_name] = full_name
  TestData.hash[:company] = company
  TestData.hash[:country] = country
  TestData.hash[:street_address] = street_address
  TestData.hash[:city] = city
  TestData.hash[:state] = state
  TestData.hash[:postal_code] = postal_code
  TestData.hash[:email] = email
  TestData.hash[:full_phone] = full_phone
  TestData.hash[:phone] = phone
  TestData.hash[:phone_ext] = phone_ext
  TestData.hash[:groups] = groups
  TestData.hash[:cost_code] = cost_code
  TestData.hash[:reference_number] = reference_number

end

Then /^set contact details to$/ do |table|
  param = table.hashes.first
  full_name = param['full_name']
  company = param['company']
  country = param['country']
  street_address = param['street_address']
  city = param['city']
  state = param['state']
  postal_code = param['postal_code']
  email = param['email']
  full_phone = param['phone']
  phone_ext = param['phone_ext']
  groups =  param['groups']
  reference_number = param['reference_number']
  cost_code = param['cost_code']

  if full_name.empty? || full_name.downcase.include?('random')
    full_name = TestHelper.rand_full_name
  end

  if company.empty? || company.downcase.include?('random')
    company = TestHelper.rand_comp_name
  end

  if country.empty? || country.size.zero?
    country = 'United States'
  end

  if street_address && street_address.downcase.include?('random')
    street_address = TestHelper.rand_alpha_numeric(min: 2, max: 7)
  end

#  step "set contact details address to invalid domestic"

  if full_phone.empty? || full_phone.downcase.include?('random')
    full_phone = TestHelper.rand_phone
  end

  if email.empty? || email.downcase.include?('random')
    email = TestHelper.rand_email
  end

  step "set contact details name to #{full_name}"
  step "set contact details company to #{company}"
  step "set contact details country to #{country}"
  step "set contact details street address to #{street_address}"
  step "set contact details city to #{city}"
  if state.empty?
  else
    step "set contact details state to #{state}"
  end

  step "set contact details postal code to #{postal_code}"
  step "set contact details email to #{email}"

  if full_phone.to_s.include? ('-')
    temp = full_phone.to_s.split('-')
    phone = temp[0]
    phone_ext = temp[1]
    step "set contact details phone to #{phone}"
    step "set contact details phone extension to #{phone_ext}"
  else
    step "set contact details phone to #{full_phone}"
  end

  if groups.empty?
    # Do not set value of groups
  elsif groups.downcase.include?('random')
    step 'click on groups expand button of contacts left navigation'
    left_nav_group = SdcContacts.contacts_filter.groups
    row_count = left_nav_group.total_groups.count
    if row_count > 2
      groups = left_nav_group.group('name',rand(1..row_count - 1)).text_value
      step 'click on groups collapse button of contacts left navigation'
      step "set contact details groups to #{groups}"
    elsif row_count.eql 2
      groups = left_nav_group.group('name',1).text_value
      step 'click on groups collapse button of contacts left navigation'
      step "set contact details groups to #{groups}"
    else
      SdcLogger.info 'No Groups for this account to add'
    end
  else
    step "set contact details groups to #{groups}"
  end

  if reference_number.empty?
    # Do not set value of reference number
  elsif reference_number.downcase.include?('random')
    reference_number = TestHelper.rand_reference_number
    step "set contact details reference number to #{reference_number}"
  else
    step "set contact details reference number to #{reference_number}"
  end

  if cost_code.empty?
    # Do not do anything
  elsif
  step 'click on cost codes expand button of contacts left navigation'
    left_nav_costcode = SdcContacts.contacts_filter.cost_codes
    row_count = left_nav_costcode.total_costcodes.count
    cost_code = left_nav_costcode.cost_code_name(rand(1..row_count - 1)).text_value
    step 'click on cost codes collapse button of contacts left navigation'
    step "set contact details cost code to #{cost_code}"
  else
    step "set contact details cost code to #{cost_code}"
  end

  TestData.hash[:full_name] = full_name
  TestData.hash[:company] = company
  TestData.hash[:country] = country
  TestData.hash[:street_address] = street_address
  TestData.hash[:city] = city
  TestData.hash[:state] = state
  TestData.hash[:postal_code] = postal_code
  TestData.hash[:email] = email
  TestData.hash[:full_phone] = full_phone
  TestData.hash[:phone] = full_phone
  TestData.hash[:phone_ext] = phone_ext
  TestData.hash[:groups] = groups
  TestData.hash[:cost_code] = cost_code
  TestData.hash[:reference_number] = reference_number

end

Then /^set contact details name to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.name.safe_wait_until_present(timeout: 15)
  contacts_detail.name.set(str)
  contacts_detail.company.click
end

Then /^click on contact details panel name expand button$/ do
  contacts_detail = SdcContacts.details
  contacts_detail.name_expand.safe_wait_until_present(timeout: 15)
  #contacts_detail.name_expand.flash
  contacts_detail.name_expand.click
end

Then /^click on contact details panel name collapse button$/ do
  contacts_detail = SdcContacts.details
  contacts_detail.name_collapse.safe_wait_until_present(timeout: 15)
  #contacts_detail.name_collapse.flash
  contacts_detail.name_collapse.click
end

Then /^set contact details name prefix to (.*)$/ do |str|
  name_pre = SdcContacts.details.name_prefix
  name_pre.prefix_selection(value: str)
  name_pre.prefix_drop_down.click unless name_pre.selection.present?
  name_pre.prefix_text_field.set(str)
  name_pre.selection.safe_click
  expect(name_pre.prefix_text_field.text_value).to include(str)
  contacts_detail = SdcContacts.details
  contacts_detail.name.click
end

Then /^set contact details firstname to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.first_name.safe_wait_until_present(timeout: 15)
  contacts_detail.first_name.set(str)
  contacts_detail.middle_name.click
end

Then /^set contact details middlename to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.middle_name.safe_wait_until_present(timeout: 15)
  contacts_detail.middle_name.set(str)
  contacts_detail.last_name.click
end

Then /^set contact details lastname to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.last_name.safe_wait_until_present(timeout: 15)
  contacts_detail.last_name.set(str)
  contacts_detail.name_suffix.click
end

Then /^set contact details suffix to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.name_suffix.safe_wait_until_present(timeout: 15)
  contacts_detail.name_suffix.set(str)
  contacts_detail.company.click
end

Then /^set contact details company to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.company.wait_until_present(timeout: 15)
  contacts_detail.company.set(str)
  contacts_detail.street_address.click
end

Then /^click on contact details panel company expand [Bb]utton$/ do
  contacts_detail = SdcContacts.details
  contacts_detail.company_expand.safe_wait_until_present(timeout: 15)
  contacts_detail.company_expand.click
end

Then /^click on contact details panel company collapse [Bb]utton$/ do
  contacts_detail = SdcContacts.details
  contacts_detail.company_collapse.safe_wait_until_present(timeout: 15)
  contacts_detail.company_collapse.click
end

Then /^set contact details title to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.title.safe_wait_until_present(timeout: 15)
  contacts_detail.title.set(str)
  contacts_detail.department.click
end

Then /^set contact details department to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.department.safe_wait_until_present(timeout: 15)
  contacts_detail.department.set(str)
  contacts_detail.title.click
end

Then /^set contact details country to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  country = contacts_detail.country
  country.selection_country(value: str)
  country.drop_down.click unless country.selection.present?
  country.text_field.set(str)
  country.selection.safe_click
  expect(country.text_field.text_value).to include(str)
  contacts_detail.street_address.click
end

Then /^set contact details street address to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.street_address.wait_until_present(timeout: 15)
  contacts_detail.street_address.send_keys(str)
  contacts_detail.postal_code.click
end

Then /^set contact details city to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.city.wait_until_present(timeout: 15)
  contacts_detail.city.set(str)
  contacts_detail.postal_code.click
end

Then /^set contact details state to (.*)$/ do |str|
  state = SdcContacts.details.state
  state.selection_state(value: str)
  state.drop_down.click unless state.selection.present?
  state.text_field.set(str)
  state.selection.safe_click
  expect(state.text_field.text_value).to include(str)
  contacts_detail = SdcContacts.details
  contacts_detail.postal_code.click
end

Then /^set contact details province to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.province.wait_until_present(timeout: 15)
  contacts_detail.province.set(str)
  contacts_detail.postal_code.click
end

Then /^set contact details postal code to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.postal_code.wait_until_present(timeout: 15)
  contacts_detail.postal_code.set(str)
  contacts_detail.email.click
end

Then /^set contact details email to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.email.wait_until_present(timeout: 15)
  contacts_detail.email.set(str)
  contacts_detail.phone.click
  #SdcContacts.contacts_detail.email.set(str)
  #SdcContacts.contacts_detail.title.click
end

Then /^set contact details phone to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.phone.wait_until_present(timeout: 15)
  contacts_detail.phone.set(str)
  contacts_detail.phone_ext.click
end

Then /^set contact details phone extension to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.phone_ext.wait_until_present(timeout: 15)
  contacts_detail.phone_ext.set(str)
  contacts_detail.reference_number.click
end

Then /^set contact details groups to (.*)$/ do |str|
  group = SdcContacts.details.group
  group.selection_group(value: str)
  group.drop_down.click unless group.selection.present?
  group.text_field.set(str)
  group.selection.safe_click
  contacts_detail = SdcContacts.details
  contacts_detail.reference_number.click
  #expect(group.text_list.text_value).to include(str)
end

Then /^set contact details reference number to (.*)$/ do |str|
  contacts_detail = SdcContacts.details
  contacts_detail.reference_number.wait_until_present(timeout: 15)
  contacts_detail.reference_number.set(str)
  contacts_detail.phone_ext.click
end

Then /^set contact details cost code to (.*)$/ do |str|
  cost_code = SdcContacts.details.cost_code
  cost_code.selection_costcode(value: str)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.text_field.set(str)
  cost_code.selection.safe_click
  expect(cost_code.text_field.text_value).to include(str)
  contacts_detail = SdcContacts.details
  contacts_detail.reference_number.click
end

Then /^expect email error is displayed$/ do
  contacts_detail = SdcContacts.details
  contacts_detail.email_error.safe_wait_until_present(timeout:10)
  expect(contacts_detail.email_error.present?).to be(true)
  SdcLogger.info "Error message: #{contacts_detail.email_error_message.text_value}"
end

Then /^expect email error is not displayed$/ do
  contacts_detail = SdcContacts.details
  expect(contacts_detail.email_error.present?).to be(false)
end

Then /^click on contact details menu dropdown$/ do
  toolbar_menu = SdcContacts.details.toolbar_menu
  toolbar_menu.menu_button.safe_wait_until_present(timeout: 20)
  toolbar_menu.menu_button.click
end

Then /^click on multiple contact details menu dropdown$/ do
  toolbar_menu = SdcContacts.multi_details
  toolbar_menu.menu_button.safe_wait_until_present(timeout: 20)
  toolbar_menu.menu_button.click
end

Then /^select contact details menu (.*)$/ do |menu_item|
  toolbar_menu = SdcContacts.details.toolbar_menu
  case menu_item
  when 'Print Postage'
    toolbar_menu.print_postage.wait_until_present(timeout: 10)
    toolbar_menu.print_postage.click
  when 'Delete'
    toolbar_menu.delete.wait_until_present(timeout: 10)
    toolbar_menu.delete.click
  when 'Collapse Panel'
    toolbar_menu.collapse_panel.wait_until_present(timeout: 10)
    toolbar_menu.collapse_panel.click
  else
    failure_message
  end
end

Then /^expand collapsed contact details panel$/ do
  contact_detail = SdcContacts.details
  contact_detail.expand_button.wait_until_present(timeout: 10)
  contact_detail.expand_button.flash
  contact_detail.expand_button.click
end

Then /^expect values of contact added in contacts detail panel are correct$/ do
  full_name	=	TestData.hash[:full_name]
  company	=	TestData.hash[:company]
  country	=	TestData.hash[:country]
  street_address	=	TestData.hash[:street_address]
  city	=	TestData.hash[:city]
  state	=	TestData.hash[:state]
  postal_code	=	TestData.hash[:postal_code]
  email	=	TestData.hash[:email]
  phone	=	TestData.hash[:phone]
  phone_ext	=	TestData.hash[:phone_ext]
  groups	=	TestData.hash[:groups]
  reference_number	=	TestData.hash[:reference_number]
  cost_code	=	TestData.hash[:cost_code]

  step "expect value of Name in contact details panel is #{full_name}"
  step "expect value of Company in contact details panel is #{company}"
  step "expect value of Country in contact details panel is #{country}"
  step "expect value of Street Address in contact details panel is #{street_address}"
  step "expect value of City in contact details panel is #{city}"
  step "expect value of State/Prv in contact details panel is #{state}"
  step "expect value of Postal Code in contact details panel is #{postal_code}"
  step "expect value of Email in contact details panel is #{email}"
  step "expect value of Phone in contact details panel is #{phone}"
  step "expect value of Phone Extension in contact details panel is #{phone_ext}"
  step "expect value of Groups in contact details panel is #{groups}"
  step "expect value of Reference Number in contact details panel is #{reference_number}"
  step "expect value of Cost Code in contact details panel is #{cost_code}"
end

#Validation of Values on the Details Panel
Then /^expect value of (.*) in contact details panel is (.*)$/ do |label,value|
  contacts_detail = SdcContacts.details
  contacts_detail.reference_number.safe_wait_until_present(timeout: 15)

  if value.eql? 'blank'
    new_value = ""
  else
    new_value = value
  end

  case label

  when 'Name'
    actual_value = contacts_detail.name.text_value

  when 'Prefix'
    name_pre = SdcContacts.details.name_prefix
    actual_value =  name_pre.prefix_text_field.text_value

  when 'First Name'
    actual_value = contacts_detail.first_name.text_value

  when 'Middle Name'
    actual_value = contacts_detail.middle_name.text_value

  when 'Last Name'
    actual_value = contacts_detail.last_name.text_value

  when 'Suffix'
    actual_value = contacts_detail.name_suffix.text_value

  when 'Company'
    actual_value = contacts_detail.company.text_value

  when 'Title'
    actual_value = contacts_detail.title.text_value

  when 'Department'
    actual_value = contacts_detail.department.text_value

  when 'Country'
    country = SdcContacts.details.country
    actual_value = country.text_field.text_value

  when 'Street Address'
    actual_value = contacts_detail.street_address.text_value

  when 'City'
    actual_value = contacts_detail.city.text_value

  when 'State/Prv' ,'State','Province'
    state = SdcContacts.details.state
    if state.text_field.present?
      actual_value = state.text_field.text_value
    else
      actual_value = contacts_detail.state_prv.text_value
    end

  when 'Postal Code'
    actual_value = contacts_detail.postal_code.text_value

  when 'Email'
    actual_value = contacts_detail.email.text_value

  when 'Phone'
    actual_value = contacts_detail.phone.text_value

  when 'Phone Extension'
    actual_value = contacts_detail.phone_ext.text_value

  when 'Groups'
    groups = SdcContacts.details.group
    actual_value = groups.text_list.text_value

  when 'Reference Number'
    actual_value = contacts_detail.reference_number.text_value

  when 'Cost Code'
    cost_code = SdcContacts.details.cost_code
    actual_value = cost_code.text_field.text_value
    if new_value.eql? ''
      new_value = 'None'
    end
  end
  SdcLogger.info "Label:  #{label}"
  SdcLogger.info "given value :#{value}"
  SdcLogger.info "Modified given value #{new_value}"
  SdcLogger.info "Value in details panel :#{actual_value.to_s}"

  expect(actual_value.strip).to eql new_value.strip
end


Then /^set street address on contact page details to maximum lines (\d+)$/ do |lines|
  contacts_detail = SdcContacts.details
  contacts_detail.street_address.wait_until_present(timeout: 15)
  street1 = TestHelper.rand_street1_address
  street2 = TestHelper.rand_street2_address
  street3 = TestHelper.rand_street3_address
  if lines.eql? '3'
    contacts_detail.street_address.send_keys(street1 + "\n" + street2 + "\n" + street3)
    address = contacts_detail.street_address.text_value
    address = address.split("\n")
    total_address = address[0] + " " + address[1] + " " + address[2]
  else
    contacts_detail.street_address.send_keys(street1 + "\n" + street2 + "\n" + street3 + "\n" + street2)
    address = contacts_detail.street_address.text_value
    address = address.split("\n")
    total_address = address[0] + " " + address[1] + " " + address[2] + " " + address[3]
  end
  TestData.hash[:street_address] = total_address
  SdcLogger.info "Given street address #{total_address}"
  contacts_detail.postal_code.click
end

Then /^expect street address error message is displayed$/ do
  contacts_detail = SdcContacts.details
  expect(contacts_detail.error_street_address.present?).to be(true)
end

Then /^expect street address error message is not displayed$/ do
  contacts_detail = SdcContacts.details
  expect(contacts_detail.error_street_address.present?).to be(false)
end

Then /^set address to (.*)$/ do |address|
  case address
  when 'domestic'
    country = 'United States'
    street_address = TestHelper.rand_street1_address
    city = TestHelper.rand_city_name
    us_states = data_for(:us_states, {})
    states = us_states.values
    state = states[rand(us_states.size)]
    SdcLogger.info "state value from random states value #{state}"
    postal_code = TestHelper.rand_postal_code
  when 'international'
    countries = data_for(:countries, {})
    country_values = countries.values
    country = country_values[rand(country_values.size)]
    street_address = TestHelper.rand_street1_address
    city = TestHelper.rand_city_name
    us_states = data_for(:us_states, {})
    states = us_states.values
    state = states[rand(us_states.size)]
    SdcLogger.info "state value from random states value #{state}"
    postal_code = TestHelper.rand_postal_code
  when 'apo'
    country = 'United States'
    apo_states = {"AA (Armed Forces)" => "AA", "AE (Armed Forces)" => "AE"}
    apo_states = apo_states.keys
    state = apo_states[rand(apo_states.size)]
    SdcLogger.info "state value from random states value #{state}"
    street_address = TestHelper.rand_street1_address
    city = TestHelper.rand_city_name
    postal_code = TestHelper.rand_postal_code
  end
  if address.eql? 'international'
    step "set contact details country to #{country}"
  end
  step "set contact details street address to #{street_address}"
  step "set contact details city to #{city}"

  if country.eql? 'United States'
    step "set contact details state to #{state}"
  else
    step "set contact details province to #{state}"
  end
  step "set contact details postal code to #{postal_code}"

  TestData.hash[:country] = country
  TestData.hash[:street_address] = street_address
  TestData.hash[:city] = city
  TestData.hash[:state] = state
  TestData.hash[:postal_code] = postal_code
end

Then /^expect clear all link is displayed on contact detail panel$/ do
  contacts_detail = SdcContacts.details
  expect(contacts_detail.clear_all_link.present?).to be (true)
end

Then /^click on clear all link of contact detail panel$/ do
  contacts_detail = SdcContacts.details
  contacts_detail.clear_all_link.safe_wait_until_present(timeout: 15)
  contacts_detail.clear_all_link.click
end

Then /^search contact details country with value (.*)$/ do |str|
  country = SdcContacts.details.country
  country.selection_country(value: str)
  country.drop_down.click unless country.selection.present?
  country.text_field.set(str)
  search_list_count = country.search_countries(str,'count')
  i = 1
  country_list = Array.new
  while i <= search_list_count.count
    country_list[i] = country.search_countries_list(str,i).text_value
    i = i + 1
  end
  TestData.hash[:country_list] = Array.new
  TestData.hash[:country_list] = country_list
  SdcLogger.info "#{search_list_count.count} countries are avaliable in search of #{str}"
end

Then /^expect search country list contains value (.*)$/ do |country_name|
  country = SdcContacts.details.country
  search_list_count = TestData.hash[:country_list].size
  i = 1
  while i < search_list_count
    expect(country.search_countries(TestData.hash[:country_list][i],'name').present?).to be (true)
    SdcLogger.info "#{TestData.hash[:country_list][i]} is present in search list of #{country_name}"
    i = i + 1
  end


end