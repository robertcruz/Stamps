Then(/^hover on (.*) column on contacts grid$/) do |column|
  column_header =SdcContacts.contacts_col.contacts_header_element(column)
  column_header.scroll_into_view
  # SdcLogger.info "Header Element Present of #{column} is #{column_header.present?}"
  column_header.flash
  column_header.hover
end

Then(/^click on (.*) column header dropdown trigger$/) do |column|
  column_trigger = SdcContacts.contacts_col.select_header_column_trigger(column)
  column_trigger.scroll_into_view
  # SdcLogger.info "Header Element Trigger Present : #{column_trigger.present?}"
  column_trigger.click
end

Then (/^expect contacts header dropdown menu is displayed$/) do
  menu_list=SdcContacts.contacts_col.header_dropdown_menu_list
  expect(menu_list.present?).to be(true)
end

Then(/^expect (.*) is available in the contacts header dropdown menu list$/) do |menu_name|
  menu_item = SdcContacts.contacts_col.header_dropdown_menu_item(menu_name)
  menu_item.flash
  expect(menu_item.text_value).to eql(menu_name)
  expect(menu_item.present?).to be(true)
  SdcLogger.info "#{menu_name} menu item is available in the contacts header dropdown menu list"
end

Then(/^verify (.*) in contact header menu dropdown is enabled$/) do |menu_name|
  menu_item = SdcContacts.contacts_col.header_dropdown_menu_item(menu_name)
  menu_item.wait_until_present(timeout: 15)
  enable_value = SdcContacts.contacts_col.header_menu_item_disabled(menu_name)
  expect(enable_value).to eql(false)
  SdcLogger.info "#{menu_name} menu item is available and enabled"

end

Then(/^verify (.*) in contact header menu dropdown is disabled$/) do |menu_name|
  enable_value = SdcContacts.contacts_col.header_menu_item_disabled(menu_name)
  expect(enable_value).to eql(true)
  SdcLogger.info "#{menu_name} menu item is available and disabled"
   #if enable_value
    #SdcLogger.info "#{menu_name} in contact header menu dropdown for is disabled"
  #else
   #SdcLogger.info "#{menu_name} in contact header menu dropdown for is enabled"
  #end
end

Then /^verify sorting options for all columns in contact header menu$/ do
  enabled_columns=['Name','Prefix','First Name','Middle','Last Name','Suffix','Company','Title','Department',
                   'Email','Phone','Ext.','City','State/Prv','Street Address','Postal Code','Country','Cost Code','Reference #']
  enabled_columns.each{|col|
    #SdcLogger.info "****** #{col} *******"
    step "hover on #{col} column on contacts grid"
    step "click on #{col} column header dropdown trigger"
    step "expect contacts header dropdown menu is displayed"
    case col
    when 'Email'
      step "verify Sort Ascending in contact header menu dropdown is disabled"
      step "verify Sort Descending in contact header menu dropdown is disabled"
    when 'Phone'
      step "verify Sort Ascending in contact header menu dropdown is disabled"
      step "verify Sort Descending in contact header menu dropdown is disabled"
    when 'Ext.'
      step "verify Sort Ascending in contact header menu dropdown is disabled"
      step "verify Sort Descending in contact header menu dropdown is disabled"
    else
      step "verify Sort Ascending in contact header menu dropdown is enabled"
      step "verify Sort Descending in contact header menu dropdown is enabled"
    end
  }
end

Then /^expect row name dropdown for all columns is present$/ do
  #"First Name",'Last Name'
  columns=['Name','Prefix','First Name','Middle','Last Name','Suffix','Company','Title','Department',
           'Email','Phone','Ext.','City','State/Prv','Street Address','Postal Code','Country','Cost Code','Reference #']
  columns.each{|col|
    #SdcLogger.info "****** #{col} *******"
    step "hover on #{col} column on contacts grid"
    step "click on #{col} column header dropdown trigger"
    step "expect contacts header dropdown menu is displayed"
    step "expect Sort Ascending is available in the contacts header dropdown menu list"
    step "expect Sort Descending is available in the contacts header dropdown menu list"
    step "expect Columns is available in the contacts header dropdown menu list"
    step "expect Unfreeze is available in the contacts header dropdown menu list"
    step "expect Freeze Column is available in the contacts header dropdown menu list"
    step "click on #{col} column header dropdown trigger"
  }
end

Then /^click on (.*) column header on the grid to sort$/ do |column|
  column_header =SdcContacts.contacts_col.contacts_header_element(column)
  column_header.scroll_into_view
  SdcLogger.info "Header Element Present of #{column} is #{column_header.present?}"
  column_header.flash
  column_header.click
  contacts_grid_body = SdcContacts.contacts_body
  contacts_grid_body.safe_wait_until_present(timeout: 60)
end

Then /^verify the contacts grid is sorted based on (.*)$/ do |column|
    grid_count =SdcContacts.contacts_col.count
  SdcLogger.info grid_count
  sleep (5)
  #yet to code
end
