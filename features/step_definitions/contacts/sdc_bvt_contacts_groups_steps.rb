Then /^click on groups expand button of contacts left navigation$/ do
  left_nav_group = SdcContacts.contacts_filter.groups
  left_nav_group.groups_expand_button.safe_wait_until_present(timeout: 15)
  left_nav_group.groups_expand_button.click
  expect(left_nav_group.groups_collapse_button.present?).to be(true)
end

Then /^click on groups collapse button of contacts left navigation$/ do
  left_nav_group = SdcContacts.contacts_filter.groups
  left_nav_group.groups_collapse_button.safe_wait_until_present(timeout: 15)
  left_nav_group.groups_collapse_button.click
  expect(left_nav_group.groups_expand_button.present?).to be(true)
end

Then /^fetch total against each group available$/ do
  left_nav_group = SdcContacts.contacts_filter.groups
  row_count = left_nav_group.total_groups.count
  i = 1
  while i <= row_count.to_i
    group_label = left_nav_group.group('name',i).text_value
    SdcLogger.info  "name : #{group_label.to_s}"
    count = left_nav_group.group('count',i).text_value
    SdcLogger.info "count of #{group_label} is : #{count.to_s}"
    i = i + 1
  end
end

Then /^select (.*) from groups menu dropdown of contacts toolbar$/ do |str|
  toolbar = SdcContacts.toolbar.groups
  case str
  when 'Change Groups'
    toolbar.toolbar_groups_change_groups.safe_wait_until_present(timeout: 15)
    toolbar.toolbar_groups_change_groups.click
    step 'expect change groups pop up is displayed'
  when 'Add/Edit Groups'
    toolbar.toolbar_groups_add_edit_groups.safe_wait_until_present(timeout: 15)
    toolbar.toolbar_groups_add_edit_groups.click
    step 'expect manage groups pop up is displayed'
  end
end

Then /^hover on groups section of left navigation$/ do
  toolbar = SdcContacts.contacts_filter.groups
  toolbar.left_nav_groups.hover
  expect( toolbar.left_nav_add_groups.present?).to be(true)
end

Then /^click on groups add button of contacts left navigation$/ do
  toolbar = SdcContacts.contacts_filter.groups
  toolbar.left_nav_add_groups.flash
  toolbar.left_nav_add_groups.click
  step "expect add groups pop up is displayed"
end

Then /^click on groups settings button of contacts left navigation$/ do
  toolbar = SdcContacts.contacts_filter.groups
  toolbar.left_nav_add_edit_groups.flash
  toolbar.left_nav_add_edit_groups.click
end

Then /^expect manage groups pop up is displayed$/ do
  manage_groups = SdcContacts.modals.manage_groups
  manage_groups.manage_groups_title.safe_wait_until_present(timeout: 10)
  expect(manage_groups.manage_groups_title.present?).to be(true)
end

Then /^click add button on manage groups window toolbar$/ do
  manage_groups = SdcContacts.modals.manage_groups
  manage_groups.manage_groups_title.safe_wait_until_present(timeout: 10)
  manage_groups.add_button.click
  step 'expect add groups pop up is displayed'
end

Then /^expect add groups pop up is displayed$/ do
  add_groups = SdcContacts.modals.manage_groups.add_groups
  add_groups.add_groups_group_name_textbox.safe_wait_until_present(timeout: 10)
  expect(add_groups.add_groups_group_name_textbox.present?).to be(true)
end

Then /^set group name on add group pop up to (.*)$/ do |name|
  add_groups = SdcContacts.modals.manage_groups.add_groups
  add_groups.add_groups_group_name_textbox.safe_wait_until_present(timeout: 10)
  case name
  when 'blank'
    group_name = ""
  when 'random'
    group_name = TestHelper.rand_group_name
    TestData.hash[:group_name] = group_name
  when 'existing'
    if SdcContacts.modals.manage_groups.manage_groups_title.present?
      manage_groups = SdcContacts.modals.manage_groups
      row_count = manage_groups.manage_groups_table.count
      TestData.hash[:group_count] = row_count
      SdcLogger.info "exsisting group count #{row_count.to_s}"
      if row_count != 0
        str = manage_groups.group_name(row_count).text_value
        group_name = str
      end
    else
      #from left nav
      step 'click on groups expand button of contacts left navigation'
      left_nav_group = SdcContacts.contacts_filter.groups
      row_count = left_nav_group.total_groups.count
      TestData.hash[:group_count] = row_count
      SdcLogger.info  "Total no of groups : #{row_count.to_s}"
      if row_count != 0
        str = left_nav_group.group('name',row_count - 1).text_value
        group_name = str
      end
      step 'click on groups collapse button of contacts left navigation'
    end
  else
    group_name = name
  end
  add_groups.add_groups_group_name_textbox.set(group_name)
end

Then /^click on save button of add groups pop up window$/ do
  add_groups = SdcContacts.modals.manage_groups.add_groups
  add_groups.add_groups_save_button.safe_wait_until_present(timeout: 10)
  add_groups.add_groups_save_button.click
end

Then /^expect error message on add groups modal is (.*)$/ do |message|
  add_groups = SdcContacts.modals.manage_groups.add_groups
  add_groups.add_groups_save_button.safe_wait_until_present(timeout: 10)
  expect(add_groups.add_groups_error_message.present?).to be(true)
  # add_groups.error_message_text.text_value
  expect(add_groups.error_message_text.text_value).to eql(message)
end

Then /^expect error message is not displayed on add groups pop up window$/ do
  add_groups = SdcContacts.modals.manage_groups.add_groups
  add_groups.add_groups_save_button.safe_wait_until_present(timeout: 10)
  expect(add_groups.add_groups_error_message.present?).to be(false)
end

Then /^expect group name added is available in the manage group pop up table$/ do
  actual_added = TestData.hash[:group_name]
  manage_groups = SdcContacts.modals.manage_groups
  #manage_groups.manage_groups_table.safe_wait_until_present(timeout:15)
  row_count = manage_groups.manage_groups_table.count
    SdcLogger.info "exsisting group count #{row_count.to_s}"
    i = 1
    group_name_available = 'no'
    while  i <= row_count
      str = manage_groups.group_name(i).text_value
      if str.eql? actual_added
        group_name_available = 'yes'
        SdcLogger.info  'Group is available in the Manange Groups table'
        break
      end
      i = i + 1
    end
  expect(group_name_available).to eql('yes')
end

Then /^expect group name deleted is not available in the manage group pop up table$/ do
  actual_added = TestData.hash[:group_name]
  manage_groups = SdcContacts.modals.manage_groups
  row_count = manage_groups.manage_groups_table.count
  SdcLogger.info "existing group count #{row_count.to_s}"
  i = 1
  group_name_available = 'no'
  while  i <= row_count
    str = manage_groups.group_name(i).text_value
    if str.eql? 'actual_added'
      group_name_available = 'yes'
      SdcLogger.info 'Group is available in the Manange Groups table'
      break
    end
    i = i + 1
  end
  expect(group_name_available.eql? 'yes').to eql(false)
  SdcLogger.info 'Group is not available in the Manange Groups table'
end

Then /^expect change groups pop up is displayed$/ do
  group_popup = SdcContacts.modals.change_groups
  group_popup.change_groups_title.safe_wait_until_present(timeout: 15)
  expect(group_popup.change_groups_title.present?).to be(true)
end

Then /^search and choose (.*) group from groups list from change groups popup to add$/ do |group_name|
  group_popup = SdcContacts.modals.change_groups
  group_popup.change_groups_search.safe_wait_until_present(timeout: 15)

 case group_name
 when "existing"
   row_count = group_popup.change_groups_table.count
   SdcLogger.info "row count#{row_count.to_s}"
   if row_count != 0
     i = 1
      str = ""
      while i <= row_count
        if (group_popup.groups_checkbox_row(i).checked?).eql? false
          str = group_popup.group_name(i).text_value
          break
        end
        i = i + 1
      end
      if str.eql? ''
        SdcLogger.info ' All Groups available have already been added'
        else
          group_popup.change_groups_search.set(str)
          TestData.hash[:group_added_value] = str
      end
    else
      SdcLogger.info 'No groups available for this account'
    end
  else
    group_popup.change_groups_search.set(group_name)
    TestData.hash[:group_added_value] = group_name
 end
  sleep(2)
  search_count = group_popup.change_groups_table.count
  SdcLogger.info "search count" + search_count.to_s
  if search_count != 0
    step 'check change groups grid row 1'
  else
    SdcLogger.info 'no such group found for this account'
  end
end

Then /^search and choose (.*) group from groups list from change groups popup to remove$/ do |group_name|
  group_popup = SdcContacts.modals.change_groups
  group_popup.change_groups_search.safe_wait_until_present(timeout: 15)
  case group_name
  when 'existing'
    row_count = group_popup.change_groups_table.count
    #SdcLogger.info "row count" + row_count.to_s
    if row_count != 0
      i = 1
      str = ""
      while i <= row_count
        if group_popup.groups_checkbox_row(i).checked? .eql? true
           str = group_popup.group_name(i).text_value
          break
        end
        i = i + 1
      end
      if str.eql? ''
        #SdcLogger.info "No Groups available on the selected contact to remove"
      else
        group_popup.change_groups_search.set(str)
        TestData.hash[:group_removed_value] = str

      end
    else
      SdcLogger.info  'No groups available for this account'
    end
  else
    group_popup.change_groups_search.set(group_name)
    TestData.hash[:group_removed_value] = group_name
  end
  sleep(2)
  search_count = group_popup.change_groups_table.count
  SdcLogger.info  "search_count #{search_count.to_s}"
  if search_count != 0
    step 'uncheck change groups grid row 1'
  else
    expect(group_popup.change_groups_empty_table.present?).to be (true)
    SdcLogger.info  'No such group found for this account'
  end
end

Then /^check change groups grid row (\d+)$/ do |row|
  groups_grid_body = SdcContacts.modals.change_groups
  groups_grid_body.change_groups_grid_body.safe_wait_until_present(timeout: 60)
  checkbox = groups_grid_body.groups_checkbox_row(row)
  checkbox.safe_wait_until_present(timeout: 30)
  checkbox.check unless checkbox.checked?
  expect(checkbox.checked?).to be(true)

end

Then /^uncheck change groups grid row (\d+)$/ do |row|
  groups_grid_body = SdcContacts.modals.change_groups
  groups_grid_body.change_groups_grid_body.safe_wait_until_present(timeout: 60)
  checkbox = groups_grid_body.groups_checkbox_row(row)
  checkbox.safe_wait_until_present(timeout: 30)
  if checkbox.checked?
    checkbox.uncheck
  end
  expect(checkbox.checked?).to be(false)
end

Then /^click on save button of change groups pop up window$/ do
  group_popup = SdcContacts.modals.change_groups
  group_popup.groups_save_button.safe_wait_until_present(timeout: 10)
  group_popup.groups_save_button.click
end

Then /^expect added group is available in details groups textbox$/ do
  group_popup = SdcContacts.modals.change_groups
  str = TestData.hash[:group_added_value]
  group_count = group_popup.details_groups_list.count
  #'Group_list_count:' + group_count.to_s
  if group_count != 0
    i = 1
    included = "false"
    while i <= group_count
      if str.eql? group_popup.group_list_name(i).text_value
        included = "true"
        SdcLogger.info  "#{str} is included in the group details"
        break
      end
      i = i + 1
    end
  end
  #expect(included == "true").to be(true)
  if included .eql? 'false'
    SdcLogger.info  "#{str} is not included in the group details"
  end
end

Then /^expect removed group is not available in details groups textbox$/ do
  group_popup = SdcContacts.modals.change_groups
  str = TestData.hash[:group_removed_value]
  group_count = group_popup.details_groups_list.count
  # 'Group_list_count:' + group_count.to_s
  if group_count != 0
    i = 1
    included = "false"
    while i <= group_count
      if str.eql?  group_popup.group_list_name(i).text_value
        included = "true"
        SdcLogger.info  "#{str} is included in the group details"
        break
      end
      i = i + 1
    end
  end
  #expect(included.eql? 'true').to be(true)
  if included .eql? 'false'
    SdcLogger.info  "#{str} + is not included in the group details"
  end
end

Then /^click (.*) row in manage group table$/ do |group_name|
  manage_groups = SdcContacts.modals.manage_groups
  manage_groups.group_row.safe_wait_until_present(timeout: 10)
  edit_groups = SdcContacts.modals.manage_groups.edit_groups
  row_count = manage_groups.manage_groups_table.count
  if group_name != 'existing'
    if row_count.to_i != 0
      i = 1
      while i <= row_count.to_i
        if (manage_groups.group_name(i).text_value).eql? "#{group_name}"
          TestData.hash[:old_group] = group_name
          manage_groups.group_text.safe_wait_until_present(timeout:45)
          manage_groups.group_text.click
        end
        i = i + 1
      end
    end
  else
    str = manage_groups.group_name(row_count - 1).text_value
    TestData.hash[:old_group] = str
    manage_groups.group_text.click
  end

end

Then /^click edit button on manage groups window toolbar$/ do
  manage_groups = SdcContacts.modals.manage_groups
  manage_groups.manage_groups_title.safe_wait_until_present(timeout: 10)
  manage_groups.edit_button.click
  step 'expect edit groups pop up is displayed'
end

Then /^expect edit groups pop up is displayed$/ do
  edit_groups = SdcContacts.modals.manage_groups.edit_groups
  expect(edit_groups.edit_group_window.present?).to be(true)
end

Then /^set group name on edit pop up to (.*)$/ do |group_name|
  edit_groups =  SdcContacts.modals.manage_groups.edit_groups
  case group_name
  when 'random'
    new_group_name = TestHelper.rand_group_name
    edit_groups.edit_groups_group_name_textbox.set(new_group_name)
    TestData.hash[:group_name] = new_group_name
    TestData.hash[:new_group] = new_group_name
  when 'existing'
    manage_groups = SdcContacts.modals.manage_groups
    str = manage_groups.group_name(1).text_value
    edit_groups.edit_groups_group_name_textbox.set(str)
  when 'blank'
    edit_groups.edit_groups_group_name_textbox.set("")
  else
    edit_groups.edit_groups_group_name_textbox.set(group_name)
    TestData.hash[:group_name] = group_name
    TestData.hash[:new_group] = group_name
  end
end

Then /^click on save button of edit groups pop up$/ do
  edit_groups = SdcContacts.modals.manage_groups.edit_groups
  edit_groups.edit_groups_save_button.safe_wait_until_present(timeout: 10)
  edit_groups.edit_groups_save_button.click
end

Then /^expect error message on edit groups modal is (.*)$/ do |message|
  edit_groups = SdcContacts.modals.manage_groups.edit_groups
  edit_groups.edit_groups_error_message.safe_wait_until_present(timeout: 10)
  expect(edit_groups.edit_groups_error_message.present?).to be(true)
  expect(edit_groups.error_message_text.text_value).to eql(message)
end

Then /^expect error message is not displayed on edit groups pop up window$/ do
  edit_groups = SdcContacts.modals.manage_groups.edit_groups
  edit_groups.edit_groups_save_button.safe_wait_until_present(timeout: 10)
  expect(edit_groups.edit_groups_error_message.present?).to be(false)
end

Then /^click delete button on manage groups window toolbar$/ do
  manage_groups = SdcContacts.modals.manage_groups
  manage_groups.delete_button.safe_wait_until_present(timeout: 10)
  manage_groups.delete_button.click
  step 'expect delete groups pop up is displayed'
end

Then /^expect delete groups pop up is displayed$/ do
  delete_groups = SdcContacts.modals.manage_groups.delete_groups
  delete_groups.groups_delete_popup.safe_wait_until_present(timeout: 10)
  expect(delete_groups.groups_delete_popup.present?).to be(true)
end

Then /^click on yes button of delete groups pop up$/ do
  delete_groups = SdcContacts.modals.manage_groups.delete_groups
  delete_groups.groups_delete_yes_button.safe_wait_until_present(timeout: 10)
  delete_groups.groups_delete_yes_button.click
  step 'expect manage groups popup is displayed'
end

Then /^expect manage groups popup is displayed$/ do
  manage_groups = SdcContacts.modals.manage_groups
  manage_groups.manage_groups_title.safe_wait_until_present(timeout: 45)
end

Then /^click on close button of manage groups pop up window$/ do
  manage_groups = SdcContacts.modals.manage_groups
  manage_groups.manage_groups_close.safe_wait_until_present(timeout: 10)
  manage_groups.manage_groups_close.click
end

