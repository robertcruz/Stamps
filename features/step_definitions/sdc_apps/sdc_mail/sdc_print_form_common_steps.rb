
Then /^select print on (.+)$/ do |str|
  SdcLogger.debug "select print on #{str}"
  print_on = SdcMail.print_on
  step 'blur out on print form'
  print_on.text_field.wait_until_present(timeout: 6)
  unless TestData.hash[:print_on_arr]
    TestData.hash[:print_on_arr] = []
    print_on.drop_down.safe_click
    print_on.selection_list.each do |element|
      TestData.hash[:print_on_arr] << element.text
    end
    print_on.drop_down.safe_click
  end

  if TestData.hash[:print_on_arr].include? str
    print_on.selection(:selection_element, str)
    print_on.text_field.set_attribute('value', '')
    print_on.text_field.set str
    print_on.selection_element.safe_wait_until_present(timeout: 2)
    print_on.selection_element.safe_click
    print_on.selection_element.safe_wait_while_present(timeout: 2)
  else
    # bring in selection from Manage Printing Options modal
    print_on.text_field.set_attribute('value', '')
    print_on.text_field.set 'Manage Printing Options...'
    print_on.selection(:selection_element, 'Manage Printing Options...')
    print_on.selection_element.safe_wait_until_present(timeout: 2)
    print_on.selection_element.safe_click
    print_on.selection_element.safe_wait_while_present(timeout: 2)
    step "check #{str} in manage print options"
    step 'click save in manage print options'
    # update the list
    print_on.drop_down.safe_click
    print_on.selection_list.each do |element|
      TestData.hash[:print_on_arr] << element.text
    end
    print_on.drop_down.safe_click
    # select print on
    print_on.selection(:selection_element, str)
    print_on.text_field.set_attribute('value', '')
    print_on.text_field.set str
    print_on.selection_element.safe_wait_until_present(timeout: 1)
    print_on.selection_element.click
  end
  expect(print_on.text_field.text_value).to eql(str) unless str.include? 'Manage'
  #step 'blur out on print form'
  TestData.hash[:print_media] = str
end

Then /^blur out on print form$/ do
  print_on = SdcMail.print_on
  statusbar = SdcMail.statusbar
  print_on.text_field.wait_until_present(timeout: 6)
  print_on.label.safe_click
  print_on.label.double_click
  print_on.label.safe_click
  print_on.label.double_click
  print_on.label.safe_click
  print_on.label.double_click
  statusbar.total.blur_out
  statusbar.total.blur_out
end

Then /^select all options in manage printing options/ do
  step 'select print on Manage Printing Options...'
  step 'expect manage print options modal is present'
  step 'check Stamps in manage print options'
  step 'check Shipping Label - 8 ½" x 11" Paper in manage print options'
  step 'check Shipping Label - SDC-1200, 4 ¼" x 6 ¾" in manage print options'
  step 'check Shipping Label - 5 ½" x 8 ½" in manage print options'
  step 'check Envelope - #10, 4 ⅛" x 9 ½" in manage print options'
  step 'check Envelope - #9, 3 ⅞" x 8 ⅞" in manage print options'
  step 'check Envelope - #A9, 5 ¾" x 8 ¾" in manage print options'
  step 'check Envelope - #6, 3 ⅝" x 6 ½" in manage print options'
  step 'check Envelope - #A2, 4 ⅜" x 5 ¾" in manage print options'
  step 'check Envelope - #7, 3 ⅞" x 7 ½" in manage print options'
  step 'check Envelope - #11, 4 ½" x 10 ⅜" in manage print options'
  step 'check Envelope - #12, 4 ¾" x 11" in manage print options'
  step 'check Certified Mail Label - SDC-3610 in manage print options'
  step 'check Certified Mail Label - SDC-3710 in manage print options'
  step 'check Certified Mail Label - SDC-3910 in manage print options'
  step 'check Certified Mail Label - SDC-3930 in manage print options'
  step 'check Certified Mail #11 Envelope - SDC-3810 in manage print options'
  step 'check Certified Mail #11 Envelope - SDC-3830 in manage print options'
  step 'check Roll - 4" x 6" Shipping Label in manage print options'
  step 'check Roll - 4 ⅛" x 6 ¼" Shipping Label in manage print options'
  step 'click save in manage print options'
end

Then /^check (.+) in manage print options$/ do |str|
  manage_print_options = SdcMail.modals.manage_print_options
  unless manage_print_options.search.present?
    step 'select print on Manage Printing Options...'
  end
  step "search for #{str} in manage print options"
  SdcPage.browser.wait_until(timeout: 2) { manage_print_options.single_grid_item.text == str }
  manage_print_options.print_option_checkbox.check
  expect(manage_print_options.single_grid_item.text).to eql (str)
end

Then /^expect manage print options modal is present$/ do
  expect(SdcMail.modals.manage_print_options.search.present?).to eql(true)
end

Then /^uncheck (.+) in manage print options$/ do |str|
  step "search for #{str} in manage print options"
  SdcMail.modals.manage_print_options.print_option_checkbox.uncheck
end

Then /^search for (.+) in manage print options$/ do |str|
  manage_print_options = SdcMail.modals.manage_print_options
  manage_print_options.search.set str
  manage_print_options.search.send_keys(:enter)
  manage_print_options.search_button.click
end

Then /^click save in manage print options$/ do
  save = SdcMail.modals.manage_print_options.save
  save.click
  save.safe_wait_while_present(timeout: 2)
end

Then /^show advanced options$/ do
  show = SdcMail.print_form.show_advanced_options
  hide = SdcMail.print_form.hide_advanced_options
  show.click unless hide.present?
  hide.wait_until_present(timeout: 3)
end

Then /^hide advanced options$/ do
  hide = SdcMail.print_form.hide_advanced_options
  show = SdcMail.print_form.show_advanced_options
  hide.click unless show.present?
  show.wait_until_present(timeout: 3)
end

Then /^set print form reference number (.+)$/ do |value|
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.reference_num.wait_until_present(timeout: 5)
  advanced_options.reference_num.set(value)
end

Then /^expect use reference # from contact list on print form is present$/ do
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.use_ref_num_from_contact_list.wait_until_present(timeout: 5)
  expect(advanced_options.use_ref_num_from_contact_list).to be_present
end

Then /^expect use reference # from contact list on print form is unchecked$/ do
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.use_ref_num_from_contact_list.wait_until_present(timeout: 5)
  expect(advanced_options.use_ref_num_from_contact_list.checked?).to be(false)
end

Then /^check use reference # from contact list on print form$/ do
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.use_ref_num_from_contact_list.wait_until_present(timeout: 5)
  advanced_options.use_ref_num_from_contact_list.check
  expect(advanced_options.use_ref_num_from_contact_list.checked?).to be(true)
end

Then /^uncheck use reference # from contact list on print form$/ do
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.use_ref_num_from_contact_list.wait_until_present(timeout: 5)
  advanced_options.use_ref_num_from_contact_list.uncheck
  expect(advanced_options.use_ref_num_from_contact_list.checked?).to be(false)
end

Then /^expect use reference # from contact list on print form is checked$/ do
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.use_ref_num_from_contact_list.wait_until_present(timeout: 5)
  expect(advanced_options.use_ref_num_from_contact_list.checked?).to be(true)
end

Then /^expect placeholder for disabled reference # on print form is (.+)$/ do |str|
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.reference_num_disabled.wait_until_present(timeout: 5)
  placeholder = advanced_options.reference_num_disabled.attribute_value('placeholder').strip
  expect(placeholder).to eql str
end


Then /^set print form cost code (.+)$/ do |value|
  cost_code = SdcMail.print_form.advanced_options.cost_code
  cost_code.selection_element(value: value)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.selection.click
  expect(cost_code.text_field.text_value).to include(value)
end

Then /^expect use cost code from contact list on print form is present$/ do
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.use_cost_code_from_contact_list.wait_until_present(timeout: 5)
  expect(advanced_options.use_cost_code_from_contact_list).to be_present
end

Then /^expect use cost code from contact list on print form is unchecked$/ do
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.use_cost_code_from_contact_list.wait_until_present(timeout: 5)
  expect(advanced_options.use_cost_code_from_contact_list.checked?).to be(false)
end

Then /^check use cost code from contact list on print form$/ do
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.use_cost_code_from_contact_list.wait_until_present(timeout: 5)
  advanced_options.use_cost_code_from_contact_list.check
  expect(advanced_options.use_cost_code_from_contact_list.checked?).to be(true)
end

Then /^uncheck use cost code from contact list on print form$/ do
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.use_cost_code_from_contact_list.wait_until_present(timeout: 5)
  advanced_options.use_cost_code_from_contact_list.uncheck
  expect(advanced_options.use_cost_code_from_contact_list.checked?).to be(false)
end

Then /^expect use cost code from contact list on print form is checked$/ do
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.use_cost_code_from_contact_list.wait_until_present(timeout: 5)
  expect(advanced_options.use_cost_code_from_contact_list.checked?).to be(true)
end

Then /^expect placeholder for disabled cost code on print form is (.+)$/ do |str|
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.cost_code_disabled.wait_until_present(timeout: 5)
  placeholder = advanced_options.cost_code_disabled.attribute_value('placeholder').strip
  expect(placeholder).to eql str
end

















Then /^expect print form ship date is (\d+) (?:day|days) from today$/ do |day|
  step "expect print form ship date dropdown is present"
  expectation = TestHelper.mail_date_text_field_format(day)
  result = SdcOrders.modals.print.ship_date.text_field.text_value
  expect(result).to eql(expectation)
end

Then /^set print form ship date to today$/ do
  step 'set print form ship date to today plus 0'
  #step 'set print form advanced options ship date to today plus 0'
end

Then /^set print form ship date to today plus (\d+)$/ do |day|
  step "expect print form ship date dropdown is present"
  text_field = SdcOrders.modals.print.ship_date.text_field
  date = TestHelper.mail_date_text_field_format(day)
  text_field.set_attribute('value', date)
  step "blur out on print modal ship date 5"
  expect(text_field.value).to eql(date)
end

Then /^expect print form ship date dropdown is present$/ do
  expect(SdcOrders.modals.print.ship_date.drop_down).to be_present, "Ship Date dropdown is not present. Check that StampsConnect is connected. You might need to re-login on this PC #{SdcEnv.hostname}"
end

Then /^expect print form is present$/ do
  SdcMail.print_on.drop_down.wait_until_present(timeout: 15)
  expect(SdcMail.print_on.drop_down).to be_present, "Print form is not present"
end