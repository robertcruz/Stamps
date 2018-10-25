
Then /^expect cost code page is displayed$/ do
  add_cost_code = SdcContacts.contacts_cost_codes
  add_cost_code.cost_codes_page.safe_wait_until_present(timeout: 20)
  expect(add_cost_code.cost_codes_page.present?).to be(true)
end

Then /^on cost code page set value of new cost code textbox to (.*)$/ do |costcode_name|

  #check for costcodes count and remove one if count =10 and then add
  add_cost_code = SdcContacts.contacts_cost_codes
  row_count = add_cost_code.cost_code_table_rows.count
  if row_count == 11
    step "remove costcode from the costcode table"
  end
  add_cost_code.add_cost_code.safe_wait_until_present(timeout: 20)
  if costcode_name == "random"
    cost_code = TestHelper.rand_cost_code
    add_cost_code.add_cost_code.set(cost_code)
    TestData.hash[:costcode_val] = cost_code
  elsif costcode_name == "existing value"
    str = add_cost_code.cost_code_table_value.text_value
    add_cost_code.add_cost_code.set(str)
  else
    add_cost_code.add_cost_code.set(costcode_name)
    TestData.hash[:costcode_val] = costcode_name
  end

end

Then /^remove costcode from the costcode table$/ do
  add_cost_code = SdcContacts.contacts_cost_codes
  add_cost_code.cost_codes_checkbox.click
  add_cost_code.remove_cost_code_button.click
  add_cost_code.remove_cost_code_button.click
end

Then /^on cost codes page click on add button$/ do
  add_cost_code = SdcContacts.contacts_cost_codes
  add_cost_code.add_cost_code_button.click
end

Then /^expect error message box is displayed$/ do
  add_cost_code = SdcContacts.contacts_cost_codes
  expect(add_cost_code.error_cost_code.present?).to be(true)
end

Then /^expect error message box is not displayed$/ do
  add_cost_code = SdcContacts.contacts_cost_codes
  expect(add_cost_code.error_cost_code.present?).to be(false)
end

Then /^on cost codes page click on done button$/ do
  add_cost_code = SdcContacts.contacts_cost_codes
  add_cost_code.done_cost_code_button.click
  add_cost_code.cost_codes_accounts_page.safe_wait_until_present(timeout: 15)
end

Then /^expect change cost code popup$/ do
  cost_code = SdcContacts.contacts_popup_cost_code
  cost_code.drop_down.safe_wait_until_present(timeout: 10)
  expect(cost_code.drop_down.present?).to be(true)
end

Then /^set cost code value in the change costcode pop up box [Tt]o (.*)/ do |costcode_name|

  if costcode_name == "new costcode added"
    str ||= TestData.hash[:costcode_val]
    elsif costcode_name == "existing value"
      left_nav_costcode = SdcContacts.contacts_left_nav_cost_code
      row_count = left_nav_costcode.total_costcodes.count
      str = left_nav_costcode.cost_code_name(row_count - 1)
      TestData.hash[:costcode_val] = str
    else
    str = costcode_name
  end
  cost_code = SdcContacts.contacts_popup_cost_code
  #cost_code.text_field.safe_wait_until_present(timeout: 10)
  cost_code.selection_costcode(value: str)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.text_field.set(str)
  expect(cost_code.text_field.text_value).to include(str)
  cost_code.selection.safe_click
  #p str
end

Then /^click on cost code save button$/ do
  cost_code = SdcContacts.contacts_popup_cost_code
  cost_code.save_button.safe_wait_until_present(timeout: 10)
  cost_code.save_button.click
end

Then /^click contacts toolbar cost codes dropdown$/ do
  toolbar = SdcContacts.contacts_toolbar_cost_codes
  toolbar.cost_codes.safe_wait_until_present(timeout: 15)
  step "mouse hover on cost codes"
  toolbar.cost_codes.click
end

Then /^on cost codes dropdown menu select (.*)$/ do |str|
  toolbar = SdcContacts.contacts_toolbar_cost_codes
  case str
  when 'Change Cost Code'
    toolbar.cost_codes_change_costcode.click
    toolbar.cost_codes_change_costcode.flash
  when 'Add/Edit Cost Codes'
    toolbar.cost_codes_add_edit_costcode.click
  end
end
Then /^mouse hover on cost codes$/ do
  toolbar = SdcContacts.contacts_toolbar_cost_codes
  toolbar.cost_codes.safe_wait_until_present(timeout: 15)
  toolbar.cost_codes.hover
end

Then /^set (.*) value in details menu cost code dropdown/ do |costcode_name|
  if costcode_name == "new costcode added"
    str ||= TestData.hash[:costcode_val]
  else
    str = costcode_name
  end

  cost_code = SdcContacts.contacts_cost_code
  cost_code.selection_costcode(value: str)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.text_field.set(str)
  cost_code.selection.safe_click
  expect(cost_code.text_field.text_value).to include(str)
end

Then /^click on cost codes expand button of contacts left navigation$/ do
  left_cost_code = SdcContacts.contacts_left_nav_cost_code
  left_cost_code.cost_codes_expand_button.safe_wait_until_present(timeout: 30)
  left_cost_code.cost_codes_expand_button.click
  expect(left_cost_code.cost_codes_collapse_button.present?).to be(true)
end

Then /^click on cost codes collapse button of contacts left navigation$/ do
  left_cost_code = SdcContacts.contacts_left_nav_cost_code
  left_cost_code.cost_codes_collapse_button.safe_wait_until_present(timeout: 15)
  left_cost_code.cost_codes_collapse_button.click
  expect(left_cost_code.cost_codes_expand_button.present?).to be(true)
end

Then /^fetch total against each cost code available$/ do
  left_nav_costcode = SdcContacts.contacts_left_nav_cost_code
  row_count = left_nav_costcode.total_costcodes.count
  SdcLogger.info "Total no of cost codes : #{row_count.to_s}"
  i = 1
  until i > row_count.to_i
    cost_code_label = left_nav_costcode.cost_code_name(i)
    SdcLogger.info "Costcode name : #{cost_code_label}"
    count = left_nav_costcode.cost_code_count(i)
    SdcLogger.info "count of #{cost_code_label} is : #{count}"
    i = i + 1
  end
end


Then /^on left navigation expect (.*) is avilable under costcode filter$/ do |costcode_name|

  if costcode_name == "new costcode added"
    value ||= TestData.hash[:costcode_val]
  else
    value = costcode_name
  end

  left_nav_costcode = SdcContacts.contacts_left_nav_cost_code
  row_count = left_nav_costcode.total_costcodes.count
  SdcLogger.info "Count :#{row_count}"
  if row_count.to_i != 0
    i = 1
    while i <= row_count.to_i
      if left_nav_costcode.cost_code_name(i) == value
        SdcLogger.info "Cost code Name : #{left_nav_costcode.cost_code_name(i)}"
        result = left_nav_costcode.cost_code_name(i)
        expect(result).to eql(value)
      end
      i = i + 1
    end
  end
end

Then /^on left navigation expect count of (.*) is (.*)$/ do |costcode_name,count|

  if costcode_name == "new costcode added"
    value ||= TestData.hash[:costcode_val]
  else
    value = costcode_name
  end

  left_nav_costcode = SdcContacts.contacts_left_nav_cost_code
  row_count = left_nav_costcode.total_costcodes.count
  SdcLogger.info "Count :#{row_count}"
  if row_count.to_i != 0
    i = 1
    while i <= row_count.to_i
      if left_nav_costcode.cost_code_name(i) == value
        SdcLogger.info "Cost code Name : #{left_nav_costcode.cost_code_name(i)}"
        actual_count = left_nav_costcode.cost_code_count(i)
        expect(actual_count).to eql(count)
      end
      i = i + 1
    end
  end
end

Then /^mousehover on cost codes section of left navigation$/ do
  left_nav = SdcContacts.contacts_left_nav_cost_code
  left_nav.cost_codes.hover
  expect( left_nav.left_nav_add_edit_costcodes.present?).to be(true)
end

Then /^click on cost codes settings button of contacts left navigation$/ do
  left_nav = SdcContacts.contacts_left_nav_cost_code
  left_nav.left_nav_add_edit_costcodes.flash
  left_nav.left_nav_add_edit_costcodes.click
end


