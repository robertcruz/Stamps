
Then /^expect account settings cost code page is displayed$/ do
  cost_code = SdcAccountSettingsPage.filter_panel
  cost_code.cost_codes.safe_wait_until_present(timeout: 20)
  expect(cost_code.cost_codes.attribute_value('class')).to include 'active'
end

Then /^check the existing cost coodes count in the grid$/ do
  #check for costcodes count and remove one if count =10 and then add
  cost_code_grid = SdcAccountSettingsPage.cost_code_grid
  row_count = cost_code_grid.cost_code_rows.count
  if row_count.to_i.eql? 10
    step 'remove costcode from the costcode table'
  end
end
Then /^check the existing cost coodes count in the grid for adding (.*)$/ do |cost_codes|
  #check for costcodes count and remove one if count =10 and then add
  cost_code_grid = SdcAccountSettingsPage.cost_code_grid
  row_count = cost_code_grid.cost_code_rows.count
  add_count = cost_codes.split(',')
  count = add_count.size

  if row_count + count >= 10
    i = 1
    while i == count
      step 'remove costcode from the costcode table'
      i = i+1
    end
  end

end
Then /^set new cost textbox to (.*) on add cost code modal$/ do |costcode_name|
  cost_code_grid = SdcAccountSettingsPage.cost_code_grid
  add_cost_code = SDCWWebsite::SdcModals.add_cost_code
  add_cost_code.textbox.safe_wait_until_present(timeout: 20)
  row_count = cost_code_grid.cost_code_rows.count
  if costcode_name.eql?'random'
    cost_code = TestHelper.rand_cost_code
    add_cost_code.textbox.set(cost_code)
    TestData.hash[:costcode_val] = cost_code
  elsif costcode_name.eql?'existing value'
    if row_count >=  1
      str = cost_code_grid.cost_code_table(1).text_value
    else
      str = ' '
    end
    add_cost_code.textbox.set(str)
  elsif costcode_name.eql?'blank'
    add_cost_code.textbox.set(' ')
  elsif costcode_name.include?(',')
    cost_code = TestHelper.rand_cost_code + ',' + TestHelper.rand_cost_code
    add_cost_code.textbox.set(cost_code)
    TestData.hash[:costcode_val] = cost_code
  else
    add_cost_code.textbox.set(costcode_name)
    TestData.hash[:costcode_val] = costcode_name
  end

end

Then /^remove costcode from the costcode table$/ do
  cost_code = SdcAccountSettingsPage.cost_code_grid
  cost_code.remove_checkbox.click
  cost_code.delete_button.click
  step 'expect delete cost code modal is displayed'
  step 'click delete button on delete cost code modal'
end

Then /^click add button on account settings cost codes page$/ do
  add_cost_code = SdcAccountSettingsPage.cost_code_grid
  add_cost_code.add_icon.safe_wait_until_present(timeout: 20)
  add_cost_code.add_icon.click
end

Then /^expect add cost code modal is displayed$/ do
  add_cost_code = SDCWWebsite::SdcModals.add_cost_code
  add_cost_code.title.safe_wait_until_present(timeout: 20)
  expect(add_cost_code.title.present?).to be(true)
end

Then /^expect delete cost code modal is displayed$/ do
  delete_cost_code = SDCWWebsite::SdcModals.delete_cost_code
  delete_cost_code.title.safe_wait_until_present(timeout: 20)
  expect(delete_cost_code.title.present?).to be(true)
end

Then /^expect error message on cost codes page is (.*)$/ do |error_message|
  add_cost_code = SdcAccountSettingsPage.cost_code_grid
  expect(add_cost_code.error_box.present?).to be(true)
  expect(add_cost_code.error_message.text_value).to eql(error_message)
end

Then /^expect error message box is not displayed$/ do
  add_cost_code = SdcAccountSettingsPage.cost_code_grid
  expect(add_cost_code.error_message.present?).to be(false)
end
Then /^expect newly added cost codes included in the cost code grid$/ do
  add_cost_code = SdcAccountSettingsPage.cost_code_grid
  row_count = add_cost_code.cost_code_rows.count
  i =1
  included = false
  while i<= row_count
    if add_cost_code.cost_code_table(i).text_value.eql? TestData.hash[:costcode_val]
      included = true
      SdcLogger.info "Newly added cost code #{TestData.hash[:costcode_val]} included in the table"
      break
    end
    i = i+1
  end
  if included .eql? false
    SdcLogger.info "Newly added cost code #{TestData.hash[:costcode_val]} not included in the table"
  end
end

Then /^expect change cost code modal is displayed$/ do
  cost_code = SdcContacts.modals.change_cost_code
  cost_code.drop_down.safe_wait_until_present(timeout: 10)
  expect(cost_code.drop_down.present?).to be(true)
end

Then /^click add button on add cost code modal$/ do
  cost_code = SDCWWebsite::SdcModals.add_cost_code
  cost_code.add_button.safe_wait_until_present(timeout: 10)
  cost_code.add_button.click
end

Then /^click delete button on delete cost code modal$/ do
  cost_code = SDCWWebsite::SdcModals.delete_cost_code
  cost_code.delete_button.safe_wait_until_present(timeout: 10)
  cost_code.delete_button.click
end


Then /^click contacts toolbar cost codes dropdown$/ do
  toolbar = SdcContacts.toolbar
  toolbar.cost_codes.safe_wait_until_present(timeout: 15)
  step 'mouse hover on cost codes'
  toolbar.cost_codes.click
end

Then /^on cost codes dropdown menu select (.*)$/ do |str|
  toolbar = SdcContacts.toolbar.cost_codes_dropdown
  case str
  when 'Change Cost Code'
    toolbar.cost_codes_change_costcode.click
    toolbar.cost_codes_change_costcode.flash
  when 'Add/Edit Cost Codes'
    toolbar.cost_codes_add_edit_costcode.click
  end
end
Then /^mouse hover on cost codes$/ do
  toolbar = SdcContacts.toolbar
  toolbar.cost_codes.safe_wait_until_present(timeout: 15)
  toolbar.cost_codes.hover
end

Then /^set (.*) value in details menu cost code dropdown/ do |costcode_name|
  str = if costcode_name.eql?'new costcode added'
          TestData.hash[:costcode_val]
        else
          costcode_name
        end

  cost_code = SdcContacts.details.cost_code
  cost_code.selection_costcode(value: str)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.text_field.set(str)
  cost_code.selection.safe_click
  expect(cost_code.text_field.text_value).to include(str)
end

Then /^click on cost codes expand button of contacts left navigation$/ do
  left_cost_code = SdcContacts.contacts_filter.cost_codes
  left_cost_code.cost_codes_expand_button.safe_wait_until_present(timeout: 30)
  left_cost_code.cost_codes_expand_button.click
  expect(left_cost_code.cost_codes_collapse_button.present?).to be(true)
end

Then /^click on cost codes collapse button of contacts left navigation$/ do
  left_cost_code = SdcContacts.contacts_filter.cost_codes
  left_cost_code.cost_codes_collapse_button.safe_wait_until_present(timeout: 15)
  left_cost_code.cost_codes_collapse_button.click
  expect(left_cost_code.cost_codes_expand_button.present?).to be(true)
end

Then /^fetch total against each cost code available$/ do
  left_nav_costcode = SdcContacts.contacts_filter.cost_codes
  row_count = left_nav_costcode.total_costcodes.count
  SdcLogger.info "Total no of cost codes : #{row_count.to_s}"
  i = 1
  while i <= row_count.to_i
    cost_code_label = left_nav_costcode.cost_code_name(i).text_value
    SdcLogger.info "Costcode name : #{cost_code_label}"
    count = left_nav_costcode.cost_code_count(i).text_value
    SdcLogger.info "count of #{cost_code_label} is : #{count}"
    i = i + 1
  end
end


Then /^on left navigation expect (.*) is avilable under costcode filter$/ do |costcode_name|

  value = if costcode_name.eql?'new costcode added'
            TestData.hash[:costcode_val]
          else
            costcode_name
          end

  left_nav_costcode = SdcContacts.contacts_filter.cost_codes
  row_count = left_nav_costcode.total_costcodes.count
  SdcLogger.info "Count :#{row_count}"
  if row_count.to_i != 0
    i = 1
    while i <= row_count.to_i
      if (left_nav_costcode.cost_code_name(i).text_value).eql? value
        SdcLogger.info "Cost code Name : #{left_nav_costcode.cost_code_name(i).text_value}"
        result = left_nav_costcode.cost_code_name(i).text_value
        expect(result).to eql(value)
      end
      i = i + 1
    end
  end
end


Then /^on left navigation expect count of (.*) is (.*)$/ do |costcode_name,count|
  left_nav_costcode = SdcContacts.contacts_filter.cost_codes
  row_count = left_nav_costcode.total_costcodes.count
  if costcode_name .eql?'new costcode added'
    value ||= TestData.hash[:costcode_val]
  else
    value =costcode_name
  end
  if row_count.to_i != 0
    i=1
    while i<= row_count.to_i
      if left_nav_costcode.cost_code_name(i).eql? value
        actual_count=left_nav_costcode.cost_code_count(i)
      end
      i=i+1
    end
  end

  if count.eql? 'incremented by 1'
    old_count=TestData.hash[:cost_code_count]
    expect(actual_count.to_i).to eql (old_count.to_i+1)
  else
    expect(actual_count.to_i).to eql(count.to_i)

  end

end

Then /^mousehover on cost codes section of left navigation$/ do
  left_nav = SdcContacts.contacts_filter.cost_codes
  left_nav.cost_codes.hover
  expect( left_nav.left_nav_add_edit_costcodes.present?).to be(true)
end

Then /^click on cost codes settings button of contacts left navigation$/ do
  left_nav = SdcContacts.contacts_filter.cost_codes
  left_nav.left_nav_add_edit_costcodes.flash
  left_nav.left_nav_add_edit_costcodes.click
end


Then /^set cost code value in the change costcode pop up box to (.*)/ do |costcode_name|

  if costcode_name.eql? 'new costcode added'
    str ||= TestData.hash[:costcode_val]
    TestData.hash[:cost_code_count]= 0
  elsif costcode_name.eql?'existing value'
    left_nav_costcode = SdcContacts.contacts_left_nav_cost_code
    row_count = left_nav_costcode.total_costcodes.count
    str = left_nav_costcode.cost_code_name(row_count-1)
    count =left_nav_costcode.cost_code_count(row_count-1)
    TestData.hash[:costcode_val] = str
    TestData.hash[:cost_code_count]= count
  else
    str = costcode_name
  end
  cost_code =  SdcContacts.modals.change_cost_code
  #cost_code.text_field.safe_wait_until_present(timeout: 10)
  cost_code.selection_costcode(value: str)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.text_field.set(str)
  expect(cost_code.text_field.text_value).to include(str)
  cost_code.selection.safe_click
  #p str
end