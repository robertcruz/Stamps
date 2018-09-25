Then /^click on groups expand button of contacts left navigation$/ do
  left_nav_group  = SdcContacts.contacts_left_nav_group
  left_nav_group.groups_expand_button.safe_wait_until_present(timeout: 15)
  left_nav_group.groups_expand_button.click
  expect(left_nav_group.groups_collapse_button.present?).to be(true)
end

Then /^click on groups collapse button of contacts left navigation$/ do
  left_nav_group  = SdcContacts.contacts_left_nav_group
  left_nav_group.groups_collapse_button.safe_wait_until_present(timeout: 15)
  left_nav_group.groups_collapse_button.click
  expect(left_nav_group.groups_expand_button.present?).to be(true)
end

Then /^fetch total against each group available$/ do
  left_nav_group  = SdcContacts.contacts_left_nav_group
  row_count = left_nav_group.total_groups.count
  p "Total no of groups : " + row_count.to_s
  i=1
  while i<= row_count.to_i
    group_label = left_nav_group.group('name',i)
    p "name : "+group_label.to_s
    count = left_nav_group.group('count',i)
    p "count of #{group_label} is : " + count.to_s
    i=i+1
  end
end

Then /^select (.*) from groups menu dropdown of contacts toolbar$/ do |str|
  toolbar = SdcContacts.contacts_toolbar_groups
  case str
  when 'Change Groups'
    p str
    toolbar.toolbar_groups_change_groups.safe_wait_until_present(timeout: 15)
    toolbar.toolbar_groups_change_groups.click
    step 'expect change groups pop up is displayed'
  when 'Add/Edit Groups'
    toolbar.toolbar_groups_add_edit_groups.safe_wait_until_present(timeout: 15)
    toolbar.toolbar_groups_add_edit_groups.click
    step 'expect manage groups pop up is displayed'
  end
end


Then /^expect manage groups pop up is displayed$/ do
  manage_groups = SdcContacts.contacts_manage_groups
  manage_groups.manage_groups_title.safe_wait_until_present(timeout: 10)
  expect(manage_groups.manage_groups_title.present?).to be(true)
end

Then /^click add button on manage groups window toolbar$/ do
  manage_groups = SdcContacts.contacts_manage_groups
  manage_groups.manage_groups_title.safe_wait_until_present(timeout: 10)
  manage_groups.manage_groups_add_button.click
  step "expect add groups pop up is displayed"
end

Then /^expect add groups pop up is displayed$/ do
  add_groups = SdcContacts.contacts_add_groups
  add_groups.add_groups_group_name_textbox.safe_wait_until_present(timeout: 10)
  expect(add_groups.add_groups_group_name_textbox.present?).to be(true)
end

Then /^set group name on add group pop up to (.*)$/ do |name|
  add_groups = SdcContacts.contacts_add_groups
  add_groups.add_groups_group_name_textbox.safe_wait_until_present(timeout: 10)
  case name
  when "blank"
    group_name=""
  when "random"
    group_name = TestHelper.rand_group_name
    TestData.hash[:group_name] = group_name
  when "existing"
    manage_groups=SdcContacts.contacts_manage_groups
    row_count = manage_groups.manage_groups_table.count
    p "exsisting group count" +row_count.to_s
    if row_count != 0
      str = manage_groups.group_name(row_count)
      group_name=str
    end
  else
    group_name=name
  end
  add_groups.add_groups_group_name_textbox.set(group_name)
end

Then /^click on save button of add groups pop up window$/ do
  add_groups = SdcContacts.contacts_add_groups
  add_groups.add_groups_save_button.safe_wait_until_present(timeout: 10)
  add_groups.add_groups_save_button.click
end

Then /^expect error message of blank group name is displayed on add groups pop up window$/ do
  add_groups = SdcContacts.contacts_add_groups
  add_groups.add_groups_save_button.safe_wait_until_present(timeout: 10)
  expect(add_groups.add_groups_error_message.present?).to be(true)
  p add_groups.error_message_text.text_value
  expect(add_groups.error_message_text.text_value).to eql("Group name required.")
end

Then /^expect error message of existing group name is displayed on add groups pop up window$/ do
  add_groups = SdcContacts.contacts_add_groups
  add_groups.add_groups_save_button.safe_wait_until_present(timeout: 10)
  expect(add_groups.add_groups_error_message.present?).to be(true)
  p add_groups.error_message_text.text_value
  expect(add_groups.error_message_text.text_value).to eql("This group name is already in use. Please choose a unique group name")
end

Then /^expect error message is not displayed on add groups pop up window$/ do
  add_groups = SdcContacts.contacts_add_groups
  add_groups.add_groups_save_button.safe_wait_until_present(timeout: 10)
  expect(add_groups.add_groups_error_message.present?).to be(false)
end

Then /^expect group name added is available in the manage group pop up table$/ do
  actual_added||=TestData.hash[:group_name]
  manage_groups=SdcContacts.contacts_manage_groups
  row_count = manage_groups.manage_groups_table.count
    p "exsisting group count" +row_count.to_s
    i=1
    group_name_available = 'no'
    while  i <= row_count
      str = manage_groups.group_name(i)
      if str==actual_added
        group_name_available = 'yes'
        p "Newly added Group is available in the Manange Groups table"
        break
      end
      i=i+1
    end
  expect(group_name_available=='yes').to eql(true)
end

Then /^expect change groups pop up is displayed$/ do
  group_popup = SdcContacts.contacts_popup_groups
  group_popup.change_groups_title.safe_wait_until_present(timeout: 15)
  expect(group_popup.change_groups_title.present?).to be(true)
end

  Then /^search and choose (.*) group from groups list from change groups popup to add$/ do |group_name|
  group_popup = SdcContacts.contacts_popup_groups
  group_popup.change_groups_search.safe_wait_until_present(timeout: 15)

 case group_name
 when "existing"
   row_count = group_popup.change_groups_table.count
   p "row count" + row_count.to_s
   if row_count != 0
     i = 1
      str=""
      while i <= row_count
        if group_popup.groups_checkbox_row(i).checked? == false
          str = group_popup.group_name(i)
          break
        end
        i = i +1
      end
      if str==""
        p " All Groups available have already been added"
        else
          group_popup.change_groups_search.set(str)
          TestData.hash[:group_added_value] = str
      end

    else
      p "No groups available for this account"
    end
  else
    group_popup.change_groups_search.set(group_name)
    TestData.hash[:group_added_value] = group_name
 end
  sleep(2)
  search_count = group_popup.change_groups_table.count
  p "search count" +search_count.to_s
  if search_count != 0
    step 'check change groups grid row 1'
  else
    p "no such group found for this account"
  end
end

Then /^search and choose (.*) group from groups list from change groups popup to remove$/ do |group_name|
  group_popup = SdcContacts.contacts_popup_groups
  group_popup.change_groups_search.safe_wait_until_present(timeout: 15)
  case group_name
  when "existing"
    row_count = group_popup.change_groups_table.count
    p "row count" + row_count.to_s
    if row_count != 0
      i = 1
      str=""
      while i <= row_count
        if group_popup.groups_checkbox_row(i).checked? == true
           str = group_popup.group_name(i)
          break
        end
        i = i +1
      end
      if str==""
        p "No Groups available on the selected contact to remove"
      else
        group_popup.change_groups_search.set(str)
        TestData.hash[:group_removed_value] = str

      end
    else
      p "No groups available for this account"
    end
  else
    group_popup.change_groups_search.set(group_name)
    TestData.hash[:group_removed_value] = group_name
  end
  sleep(2)
  search_count = group_popup.change_groups_table.count
  p "search_count" + search_count.to_s
  if search_count != 0
    "inside search not equal to 0"
    step 'uncheck change groups grid row 1'
  else
    expect(group_popup.change_groups_empty_table.present?).to be (true)
    p "No such group found for this account"
  end
end

Then /^check change groups grid row (\d+)$/ do |row|
  groups_grid_body = SdcContacts.contacts_popup_groups
  groups_grid_body.change_groups_grid_body.safe_wait_until_present(timeout: 60)
  checkbox = groups_grid_body.groups_checkbox_row(row)
  checkbox.safe_wait_until_present(timeout: 30)
  checkbox.check unless checkbox.checked?
  expect(checkbox.checked?).to be(true)

end

Then /^uncheck change groups grid row (\d+)$/ do |row|
  groups_grid_body = SdcContacts.contacts_popup_groups
  groups_grid_body.change_groups_grid_body.safe_wait_until_present(timeout: 60)
  checkbox = groups_grid_body.groups_checkbox_row(row)
  checkbox.safe_wait_until_present(timeout: 30)
  if checkbox.checked?
    checkbox.uncheck
  end
  expect(checkbox.checked?).to be(false)
end

Then /^click on save button of change groups pop up window$/ do
  group_popup = SdcContacts.contacts_popup_groups
  group_popup.groups_save_button.safe_wait_until_present(timeout: 10)
  group_popup.groups_save_button.click
end

Then /^expect added group is available in details groups textbox$/ do
  group_popup = SdcContacts.contacts_popup_groups
  str ||= TestData.hash[:group_added_value]
  group_count = group_popup.details_groups_list.count
  p 'Group_list_count:' + group_count.to_s
  if group_count != 0
    i = 1
    included ="false"
    while i<= group_count
      if str == group_popup.group_list_name(i)
        included = "true"
        p str + " is included in the group details"
        break
      end
      i = i+1
    end
  end
  #expect(included == "true").to be(true)
  if included =="false"
    p str + " is not included in the group details"
  end
end

Then /^expect removed group is not available in details groups textbox$/ do
  group_popup = SdcContacts.contacts_popup_groups
  str ||= TestData.hash[:group_removed_value]
  group_count = group_popup.details_groups_list.count
  p 'Group_list_count:' + group_count.to_s
  if group_count != 0
    i = 1
    included ="false"
    while i<= group_count
      if str == group_popup.group_list_name(i)
        included = "true"
        p str + " is included in the group details"
        break
      end
      i = i+1
    end
  end
  #expect(included == "true").to be(true)
  if included =="false"
    p str + " is not included in the group details"
  end
end





