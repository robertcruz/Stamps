

Then /^[Hh]ide Advanced Options$/ do
  pending #stamps.mail.print_form.advanced_options.hide
end

Then /^expect advanced options responds to (.+) \((.+)\)$/ do |method_description, method|
  pending
  #expect(stamps.mail.print_form.advanced_options).to respond_to(method.to_sym)
end

Then /^click select extra services button on print form$/ do
  step 'show advanced options'
  SdcMail.print_form.extra_services.select.click
  step 'expect extra services modal is present'
end

Then /^open extra services$/ do
  step 'click select extra services button on print form'
end

Then /^close extra services$/ do
  step 'expect extra services modal is present'
  extra_services = SdcMail.modals.extra_services
  extra_services.x_btn.click
  extra_services.window.wait_while_present(timeout: 3)
  step 'expect extra services modal is not present'
end

Then /^expect print form advanced options extra services button is (\w+)/ do |str|
  case str
  when /enabled/
    expect(SdcMail.print_form.extra_services.class_disabled?).to be(false)
  when /disabled/
    expect(SdcMail.print_form.extra_services.class_disabled?).to be(true)
  when /visible/
    expect(SdcMail.print_form.extra_services).to be_visible
  when /present/
    expect(SdcMail.print_form.extra_services).to be_present
  else
    raise ArgumentError, "#{str} is not implemented."
  end
end

Then /^select advanced options specify postage amount$/ do
  SdcMail.print_form.advanced_options.specify_postage_amount.select
end

Then /^expect advanced options specify postage amount is selected$/ do
  expect(SdcMail.print_form.advanced_options.specify_postage_amount.selected?).to be(true)
end

Then /^expect advanced options calculate postage amount radio button is present$/ do
  expect(SdcMail.print_form.advanced_options.calculate_postage_amount).to be_present
end

Then /^expect advanced options specify postage amount radio button is present$/ do
  expect(SdcMail.print_form.advanced_options.specify_postage_amount).to be_present
end

Then /^select advanced options calculate postage amount$/ do
  SdcMail.print_form.advanced_options.calculate_postage_amount.select
end

Then /^expect advanced options calculate postage amount is selected$/ do
  expect(SdcMail.print_form.advanced_options.calculate_postage_amount.selected?).to be(true)
end

Then /^expect print form advanced options ship date is (\d+) (?:day|days) from today$/ do |day|
  step 'expect print form advanced options mail date is present'
  expectation = TestHelper.mail_date_text_field_format(day)
  result = SdcOrders.modals.print.ship_date.text_field.text_value
  expect(result).to eql(expectation)
end
Then /^set print form advanced options ship date to today plus (\d+)$/ do |day|
  step 'expect print form advanced options mail date is present'
  text_field = SdcOrders.modals.print.ship_date.text_field
  date = TestHelper.mail_date_text_field_format(day)
  text_field.set_attribute('value', date)
  step 'blur out on print modal ship date 5'
  expect(text_field.value).to eql(date)
end

Then /^expect print form advanced options mail date is present$/ do
  # todo - Change this to be SdcMail..., not SdcOrders. Maybe move same PO to common files.
  expect(SdcOrders.modals.print.ship_date.drop_down).to be_present
end






Then /^expect print form advanced options mail date field is present$/ do
  expect(SdcMail.print_form.advanced_options.mail_date).to be_present
end

Then /^[Ss]et Advanced Options Mail Date to ((?:date|today plus|tomorrow|today|))? ?(.*)?$/ do |time_str, value|
  pending
  # step 'expect advanced options responds to Mail Date (mail_date)'
  # TestData.hash[:mail_date] = case time_str
  #                             when /date/
  #                               value
  #                             when /today plus/
  #                               (Date.today + value.to_i).strftime('%m/%d/%Y')
  #                             when /today/
  #                               Date.today.strftime('%m/%d/%Y')
  #                             when /tomorrow/
  #                               (Date.today + 1).strftime('%m/%d/%Y')
  #                             else
  #                               Date.today.strftime('%m/%d/%Y')
  #                             end
  # expect(stamps.mail.print_form.advanced_options.mail_date.textbox).to be_present
  # stamps.mail.print_form.advanced_options.mail_date.textbox.set(TestData.hash[:mail_date])
  # expect(stamps.mail.print_form.advanced_options.mail_date.textbox.text).to eql(TestData.hash[:mail_date])
end

Then /^open mail ship date picker$/ do
  mail_date = SdcMail.print_form.mail_date
  picker = mail_date.picker
  mail_date.picker_button.click unless picker.today.present?
  picker.today.wait_until_present(timeout: 3)
end

Then /^hide mail ship date picker$/ do
  mail_date = SdcMail.print_form.mail_date
  picker = mail_date.picker
  mail_date.picker_button.click if picker.today.present?
end

Then /^click today on mail ship date picker$/ do
  step 'open mail ship date picker'
  SdcMail.print_form.mail_date.picker.today.click
  step 'expect mail ship date is correct'
end

Then /^click mail ship date picker today plus (\d+)$/ do |day|
  step 'open mail ship date picker'
  TestData.hash[:mail_date] = TestHelper.mail_date_text_field_format(day)

  picker = SdcMail.print_form.mail_date.picker
  title = picker.today_element.attribute_value('title')
  expect(title).to eql 'Today'

  picker_day = TestHelper.shipdate_today_plus(day, format: '%-d')
  picker.date_elements(:todays_date_elements, picker_day)
  picker.todays_date_elements.each do |element|
    unless element.parent.attribute_value('class').include?('disabled')
      element.click
      break
    end
  end
  step 'expect mail ship date is correct'
end

Then /^expect mail ship date is (?:correct|(.*))/ do |day|
  if day.nil? && TestData.hash[:mail_date].nil?
    day = "#{'%02i' % Date.today.month}/#{Date.today.day}/#{Date.today.year}"
  elsif day.nil?
    day = TestData.hash[:mail_date]
  end
  expect(SdcMail.print_form.mail_date.text_field.text_value).to eql day
end

Then /^set mail ship date to (.+)$/ do |str|
  SdcMail.print_form.mail_date.text_field.set_attribute(:value, str)
  step "expect mail ship date is #{str}"
end

Then /^[Ee]xpect Advanced Options Mail Date is (?:correct|(.*))$/ do |expectation|
  pending
  # step 'expect advanced options responds to Mail Date (mail_date)'
  # expectation = TestData.hash[:mail_date] if expectation.nil?
  # valid_date = Date.strptime(expectation, '%m/%d/%Y')
  # expect(valid_date).not_to be_nil, "Invalid Date format"
  # expect(stamps.mail.print_form.advanced_options.mail_date.textbox.text).to eql(expectation)
end

Then /^set print form advanced options reference number to (?:(?:a |some |)random string|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_numeric
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.reference_num.wait_until_present(timeout: 5)
  advanced_options.reference_num.scroll_into_view
  advanced_options.reference_num.set(str)
  advanced_options.reference_num.click
  TestData.hash[:reference_no] = str
end

Then /^expect print form advanced options reference number field is present$/ do
  expect(SdcMail.print_form.advanced_options.reference_num).to be_present
end

Then /^expect print form advanced options reference number is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:reference_no] if expectation.nil?
  expectation = '' if expectation.nil?
  expect(SdcMail.print_form.advanced_options.reference_num.text_value).to eql(expectation)
end

# this step confirms that there is no text in the Reference Number field
Then /^expect print form advanced options reference number is blank$/ do
  expect(SdcMail.print_form.advanced_options.reference_num.text_value).to eql('')
end

Then /^expect advanced options cost code field is present$/ do
  expect(SdcMail.print_form.advanced_options.cost_code).to be_present
end



Then /^set print form advanced options cost code (.+)$/ do |value|
  cost_code = SdcMail.print_form.advanced_options.cost_code
  cost_code.selection_element(value: value)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.selection.click
  expect(cost_code.text_field.text_value).to include(value)
  step "expect print form advanced options cost code is #{value}"
end

Then /^expect print form advanced options cost code is (.*)$/ do |expectation|
  cost_code = SdcMail.print_form.advanced_options.cost_code
  expect(cost_code.text_field.text_value).to include(expectation)
end

# Certified Mail
# Then /^expect restricted delivery on extra services modal is is present$/ do
#   step 'expect advanced options responds to Restricted Delivery (restricted_delivery)'
#   expect(stamps.mail.print_form.advanced_options.restricted_delivery).to be_present, 'Advanced Options include Restricted Delivery is NOT present'
# end

# Then /^check restricted delivery on extra services modal$/ do
#   step 'expect advanced options responds to Restricted Delivery (restricted_delivery)'
#   stamps.mail.print_form.advanced_options.restricted_delivery.check
# end

# Then /^expect restricted delivery on extra services modal is checked$/ do
#   step 'expect advanced options responds to Restricted Delivery (restricted_delivery)'
#   expect(stamps.mail.print_form.advanced_options.restricted_delivery.checked?).to be(true), 'Advanced Options include Restricted Delivery is NOT checked'
# end

# Then /^uncheck restricted delivery on extra services modal$/ do
#   step 'expect advanced options responds to Restricted Delivery (restricted_delivery)'
#   stamps.mail.print_form.advanced_options.restricted_delivery.uncheck
# end

# Then /^expect restricted delivery on extra services modal is unchecked$/ do
#   step 'expect advanced options responds to Restricted Delivery (restricted_delivery)'
#   expect(stamps.mail.print_form.advanced_options.restricted_delivery.checked?).not_to be(true), 'Advanced Options include Restricted Delivery is NOT unchecked'
# end

# Then /^expect extra services electronic return receipt is present$/ do
#   expect(stamps.mail.print_form.electronic_return_receipt).to be_present, 'Print form include Electronic Return Receipt is NOT present'
# end

Then /^[Ee]xpect Print form responds to (.+) \((.+)\)$/ do |method_description, method|
  pending
  # expect(stamps.mail.print_form).to respond_to(method.to_sym), "Print media error. Print form does not respond to #{method_description} (#{method})"
end

# Then /^check extra services electronic return receipt$/ do
#   step 'Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)'
#   stamps.mail.print_form.electronic_return_receipt.check
# end

# Then /^expect extra services electronic return receipt is checked$/ do
#   step 'Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)'
#   expect(stamps.mail.print_form.electronic_return_receipt.checked?).to be(true), 'Print form include Electronic Return Receipt is NOT checked'
# end

# Then /^uncheck extra services electronic return receipt$/ do
#   step 'Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)'
#   stamps.mail.print_form.electronic_return_receipt.uncheck
# end

# Then /^expect extra services electronic return receipt is unchecked$/ do
#   step 'Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)'
#   expect(stamps.mail.print_form.electronic_return_receipt.checked?).not_to be(true), 'Print form include Electronic Return Receipt is NOT unchecked'
# end

# Then /^expect extra services return receipt is present$/ do
#   step 'Expect Print form responds to Return Receipt (return_receipt)'
#   expect(stamps.mail.print_form.return_receipt).to be_present, 'Print form include Return Receipt is NOT present'
# end

# Then /^expect extra services return receipt is present$/ do
#   step 'Expect Print form responds to Return Receipt (return_receipt)'
#   expect(stamps.mail.print_form.return_receipt.visible?).to be(true), 'Print form include Return Receipt is NOT visible'
# end

# Then /^[Ee]xpect Print Form Return Receipt is disabled$/ do
#   step 'Expect Print form responds to Return Receipt (return_receipt)'
#   # expect(stamps.mail.print_form.return_receipt.enabled?).to be(false), "Print form include Return Receipt is enabled"
#   expect(stamps.mail.print_form.return_receipt.stamps_disabled?).to be(true), 'Print form include Return Receipt is enabled'
# end

# Then /^expect extra services return receipt is not present$/ do
#   # expect(stamps.mail.print_form.return_receipt.present?).to raise_exception(NoMethodError)
#   expect(stamps.mail.print_form.return_receipt.present?).to be(false), 'Print Form Return Receipt is visible'
# end
#
# Then /^check return receipt on extra services modal$/ do
#   step 'Expect Print form responds to Return Receipt (return_receipt)'
#   stamps.mail.print_form.return_receipt.check
# end

# Then /^expect extra services return receipt is checked$/ do
#   step 'Expect Print form responds to Return Receipt (return_receipt)'
#   expect(stamps.mail.print_form.return_receipt.checked?).to be(true), 'Print form include Return Receipt is NOT checked'
# end

# Then /^uncheck return receipt on extra services modal$/ do
#   step 'Expect Print form responds to Return Receipt (return_receipt)'
#   stamps.mail.print_form.return_receipt.uncheck
# end

# Then /^expect extra services return receipt is unchecked$/ do
#   step 'Expect Print form responds to Return Receipt (return_receipt)'
#   expect(stamps.mail.print_form.return_receipt.checked?).not_to be(true), 'Print form include Return Receipt is NOT unchecked'
# end



Then /^expect advanced options include return address is present$/ do
  expect(SdcMail.print_form.advanced_options.return_address).to be_present
end

Then /^check advanced options include return address$/ do
  SdcMail.print_form.advanced_options.return_address.check
  step 'expect advanced options include return address is checked'
end

Then /^expect advanced options include return address is checked$/ do
  expect(SdcMail.print_form.advanced_options.return_address.checked?).to be(true)
end

Then /^uncheck advanced options include return address$/ do
  SdcMail.print_form.advanced_options.return_address.uncheck
  step 'expect advanced options include return address is unchecked'
end

Then /^expect advanced options include return address is unchecked$/ do
  expect(SdcMail.print_form.advanced_options.return_address.checked?).not_to be(true)
end

Then /^expect advanced options include delivery address is present$/ do
  expect(SdcMail.print_form.advanced_options.delivery_address).to be_present
end

Then /^check advanced options include delivery address$/ do
  SdcMail.print_form.advanced_options.delivery_address.check
  step 'expect advanced options include delivery address is checked'
end

Then /^expect advanced options include delivery address is checked$/ do
  expect(SdcMail.print_form.advanced_options.delivery_address.checked?).to be(true)
end

Then /^uncheck advanced options include delivery address$/ do
  SdcMail.print_form.advanced_options.delivery_address.uncheck
  step 'expect advanced options include delivery address is unchecked'
end

Then /^expect advanced options include delivery address is unchecked$/ do
  expect(SdcMail.print_form.advanced_options.delivery_address.checked?).not_to be(true)
end

Then /^expect advanced options include postage is present$/ do
  expect(SdcMail.print_form.advanced_options.postage).to be_present
end

Then /^check advanced options include postage$/ do
  SdcMail.print_form.advanced_options.postage.check
  step 'expect advanced options include postage is checked'
end

Then /^expect advanced options include postage is checked$/ do
  expect(SdcMail.print_form.advanced_options.postage.checked?).to be(true)
end

Then /^uncheck advanced options include postage$/ do
  SdcMail.print_form.advanced_options.postage.uncheck
  step 'expect advanced options include postage is unchecked'
end

Then /^expect advanced options include postage is unchecked$/ do
  expect(SdcMail.print_form.advanced_options.postage.checked?).not_to be(true)
end





Then /^expect advanced options hide label value is present$/ do
  expect(SdcMail.print_form.advanced_options.hide_label_value).to be_present
end

Then /^check advanced options hide label value$/ do
  SdcMail.print_form.advanced_options.hide_label_value.check unless SdcMail.print_form.advanced_options.hide_label_value.checked?
  step 'expect advanced options hide label value is checked'
end

Then /^expect advanced options hide label value is checked$/ do
  expect(SdcMail.print_form.advanced_options.hide_label_value.checked?).to be(true)
end

Then /^uncheck advanced options hide label value$/ do
  SdcMail.print_form.advanced_options.hide_label_value.uncheck if SdcMail.print_form.advanced_options.hide_label_value.checked?
  step 'expect advanced options hide label value is unchecked'
end

Then /^expect advanced options hide label value is unchecked$/ do
  expect(SdcMail.print_form.advanced_options.hide_label_value.checked?).not_to be(true)
end

Then /^expect advanced options print receipt is present$/ do
  expect(SdcMail.print_form.advanced_options.print_receipt).to be_present
end

Then /^check advanced options print receipt$/ do
  SdcMail.print_form.advanced_options.print_receipt.check unless SdcMail.print_form.advanced_options.print_receipt.checked?
  step 'expect advanced options print receipt is checked'
end

Then /^expect advanced options print receipt is checked$/ do
  expect(SdcMail.print_form.advanced_options.print_receipt.checked?).to be(true)
end

Then /^uncheck advanced options print receipt$/ do
  SdcMail.print_form.advanced_options.print_receipt.uncheck if SdcMail.print_form.advanced_options.print_receipt.checked?
  step 'expect advanced options print receipt is unchecked'
end

Then /^expect advanced options print receipt is unchecked$/ do
  expect(SdcMail.print_form.advanced_options.print_receipt.checked?).not_to be(true)
end

Then /^expect advanced options print reference # is present$/ do
  expect(SdcMail.print_form.advanced_options.print_reference).to be_present
end

Then /^check advanced options print reference \#$/ do
  SdcMail.print_form.advanced_options.print_reference.check unless SdcMail.print_form.advanced_options.print_reference.checked?
  step 'expect advanced options print reference # is checked'
end

Then /^expect advanced options print reference # is checked$/ do
  expect(SdcMail.print_form.advanced_options.print_reference.checked?).to be(true)
end

Then /^uncheck advanced options print reference \#$/ do
  SdcMail.print_form.advanced_options.print_reference.uncheck if SdcMail.print_form.advanced_options.print_reference.checked?
  step 'expect advanced options print reference # is unchecked'
end

Then /^expect advanced options print reference # is unchecked$/ do
  expect(SdcMail.print_form.advanced_options.print_reference.checked?).not_to be(true)
end

Then /^expect advanced options print reference # is disabled/ do
  # expect(SdcMail.print_form.advanced_options.print_reference.class_disabled?).to be(true), 'Advanced Options Print Reference # is NOT disabled!'
  expect(SdcMail.print_form.advanced_options.print_reference.check?(attr: 'class', value: 'disabled')).to be(true)
end

Then /^click advanced options service commitments$/ do
  SdcMail.print_form.advanced_options.service_commitments.click
  step 'pause for 15 seconds'
  step 'expect service commitments modal is present'
end