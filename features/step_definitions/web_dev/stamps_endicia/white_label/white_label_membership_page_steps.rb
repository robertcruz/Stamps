Then /^WL: blur_out on membership page$/ do
  WhiteLabel.membership_page.header.blur_out
end

Then /^WL: set membership page first name to (?:random value|(.*))$/ do |str|
  first_name = WhiteLabel.membership_page.first_name
  first_name.wait_until_present(timeout: 10)
  first_name.set(TestData.hash[:first_name] = str.nil? ? TestHelper.rand_alpha_str.capitalize  : str)
end

Then /^WL: set membership page last name to (?:random value|(.*))$/ do |str|
  last_name = WhiteLabel.membership_page.last_name
  last_name.set(TestData.hash[:last_name] = str.nil? ? TestHelper.rand_alpha_str.capitalize  : str)
end

Then /^WL: set membership page company to (?:random value|(.*))$/ do |str|
  WhiteLabel.membership_page.company.set(TestData.hash[:company] = str.nil? ? TestHelper.rand_alpha_str  : str) if WhiteLabel.membership_page.company.present?
end

Then /^WL: set membership page address to (.*)$/ do |str|
  WhiteLabel.membership_page.address.set(TestData.hash[:address] = str)
end

Then /^WL: set membership page city to (.*)$/ do |str|
  WhiteLabel.membership_page.city.set(TestData.hash[:city] = str)
end

Then /^WL: select membership page state (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.state.click
  membership_page.dropdown_selection(str)
  membership_page.dropdown_element.safe_wait_until_present(timeout: 2)
  membership_page.dropdown_element.click
  step "WL: blur_out on membership page"
  TestData.hash[:state] = membership_page.state.attribute_value('title').strip
  expect(TestData.hash[:state].strip).to eql str

end

Then /^WL: set membership page zip to (.*)$/ do |str|
  WhiteLabel.membership_page.zip.set(TestData.hash[:city] = str)
end

Then /^WL: set membership page phone to (.*)$/ do |str|
  WhiteLabel.membership_page.phone.set(TestData.hash[:phone] = str)
end


Then /^WL: set membership page cardholder's name to (?:random value|(.*))$/ do |str|
   cc_holder_name = WhiteLabel.membership_page.cc_holder_name.clear
   TestData.hash[:card_holder_name] = str.nil? ? TestHelper.rand_full_name  : str
   cc_holder_name.set(TestData.hash[:card_holder_name] = str)
end

Then /^WL: set membership page credit card number to (?:default value|(.*))$/ do |str|
  TestData.hash[:cc_number] = str.nil? ? "4111111111111111"  : str
  WhiteLabel.membership_page.cc_number.set(TestData.hash[:cc_number] = str)
end

Then /^WL: select membership page credit card month (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.cc_month.click
  membership_page.dropdown_selection(str)
  membership_page.dropdown_element.safe_wait_until_present(timeout: 2)
  membership_page.dropdown_element.click
  step "WL: blur_out on membership page"
  TestData.hash[:cc_month] =  membership_page.cc_month.attribute_value('title').strip
  expect(TestData.hash[:cc_month].strip).to eql str
end


Then /^WL: select membership page credit card year (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.cc_year.click
  membership_page.dropdown_selection(str)
  membership_page.dropdown_element.safe_wait_until_present(timeout: 2)
  membership_page.dropdown_element.click
  step "WL: blur_out on membership page"
  TestData.hash[:cc_month] = membership_page.cc_year.attribute_value('title').strip
  expect(TestData.hash[:cc_month].strip).to eql str
end

Then /^WL: set membership page credit card year to this year plus (\d+)$/ do |year|
  step "WL: select membership page credit card year #{Date.today.year + year.to_i}"
end

Then /^WL: check membership page Terms & Conditions$/ do
  WhiteLabel.membership_page.terms_conditions.click!
end

Then /^WL: expect membership page Terms & Conditions is checked$/ do
  expect(WhiteLabel.membership_page.terms_conditions.checked?).to be(true)
end


Then /^WL: set membership page personal info to(?: a |)(?: random info |)(?:to|in|between|) (.*)$/ do |address|
  stamps_logo = WhiteLabel.common_page.stamps_logo
  stamps_logo.wait_until_present(timeout: 10)

  TestData.hash[:personal_info] = TestHelper.address_helper_zone(address) #combine this

  TestData.hash[:first_name] = TestData.hash[:personal_info]['first_name'] #combine this in address_helper_zone
  TestData.hash[:last_name] = TestData.hash[:personal_info]['last_name']
  TestData.hash[:street_address] = TestData.hash[:personal_info]['street_address']
  TestData.hash[:city] = TestData.hash[:personal_info]['city']
  TestData.hash[:state] = TestData.hash[:personal_info]['state']
  TestData.hash[:zip] = TestData.hash[:personal_info]['zip']
  TestData.hash[:company] = TestData.hash[:personal_info]['company']
  TestData.hash[:ship_to_domestic] = TestHelper.format_address(TestData.hash[:personal_info])
  TestData.hash[:phone_number_format] =  TestData.hash[:personal_info]['phone_number_format']

  step "WL: set membership page first name to #{TestData.hash[:first_name]}"
  step "WL: set membership page last name to #{TestData.hash[:last_name]}"
  step "WL: set membership page company to #{ TestData.hash[:company]}"
  step "WL: set membership page address to #{TestData.hash[:street_address]}"
  step 'WL: blur_out on membership page'
  step "WL: set membership page city to #{TestData.hash[:city]}"
  step "WL: select membership page state #{TestData.hash[:state]}"
  step 'WL: blur_out on membership page'
  step "WL: set membership page zip to #{TestData.hash[:zip]}"
  step "WL: set membership page phone to #{TestData.hash[:phone_number_format]}"

end

