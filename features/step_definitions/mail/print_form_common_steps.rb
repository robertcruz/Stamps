# encoding: utf-8


Then /^set print form mail-from to (.*)$/ do |str|
  mail_from = SdcMail.print_form.mail_from
  selection = mail_from.selection(:selection_element, str)
  text = mail_from.text_field.text_value
  unless text.eql?(str)
    mail_from.drop_down.click
    selection.scroll_into_view
    selection.safe_wait_until_present(timeout: 1)
    selection.safe_click
  end
end

Then /^[Cc]heck Print form [Ee]mail [Tt]racking checkbox$/ do
  pending
  # stamps.mail.print_form.email_tracking.email_checkbox.click
end

Then /^set print form weight to lbs (\d+) oz (\d+)$/ do |lbs, oz|
  step "set print form pounds to #{lbs}"
  step "set print form ounces to #{oz}"
  step 'blur out on print form'
end

Then /^set print form pounds to (.+)$/ do |str|
  step 'blur out on print form'
  SdcMail.print_form.weight.lbs.set(str)
  step "expect print form pounds is #{str}"
  TestData.hash[:lbs] = str.to_f
  step 'blur out on print form'
end

Then /^set print form pounds to (\d+) by arrows$/ do |lbs|
  iterations = lbs.to_i - SdcMail.print_form.weight.lbs.text_value.to_i
  iterations.abs.times do SdcMail.print_form.weight.lbs.increment.click end if iterations > 0
  iterations.abs.times do SdcMail.print_form.weight.lbs.decrement.click end if iterations < 0
  step "expect print form pounds is #{lbs}"
  TestData.hash[:lbs] = lbs
  step 'blur out on print form'
end

Then /^set print form ounces to (\d+)$/ do |oz|
  SdcMail.print_form.weight.oz.set(oz)
  TestData.hash[:oz] = oz.to_f
end

Then /^increment print form weight by lbs (\d+) oz (\d+)$/ do |lbs, oz|
  step "increment print form pounds by #{lbs}"
  step "increment print form ounces by #{oz}"
end

Then /^decrement print form weight by lbs (\d+) oz (\d+)$/ do |lbs, oz|
  step "decrement print form pounds by #{lbs}"
  step "decrement print form ounces by #{oz}"
end

Then /^increment print form pounds by (\d+)$/ do |lbs|
  old_lbs = SdcMail.print_form.weight.lbs.text_value
  lbs.times do SdcMail.print_form.weight.lbs.increment.click end
  step "expect print form pounds is #{old_lbs.to_i + lbs.to_i}"
  TestData.hash[:lbs] = lbs
end

Then /^increment print form ounces by (\d+)$/ do |oz|
  old_oz = SdcMail.print_form.weight.oz.text_value
  oz.times do SdcMail.print_form.weight.oz.increment.click end
  step "expect print form ounces is #{old_oz.to_i + oz.to_i}"
  TestData.hash[:oz] = oz
end

Then /^decrement print form pounds by (\d+)$/ do |lbs|
  old_lbs = SdcMail.print_form.weight.lbs.text_value
  lbs.times do SdcMail.print_form.weight.lbs.decrement.click end
  step "expect print form pounds is #{old_lbs.to_i - lbs.to_i}"
  TestData.hash[:lbs] = lbs
end

Then /^decrement print form ounces by (\d+)$/ do |oz|
  old_oz = SdcMail.print_form.weight.oz.text_value
  oz.times do SdcMail.print_form.weight.oz.decrement.click end
  step "expect print form ounces is #{old_oz.to_i - oz.to_i}"
  TestData.hash[:oz] = oz
end

Then /^expect print form pounds is (?:correct|(\d+))$/ do |lbs|
  lbs = lbs.nil? ? TestData.hash[:lbs] : lbs
  expect(SdcMail.print_form.weight.lbs.text_value.to_i).to eql lbs
end

Then /^expect print form ounces is (?:correct|(\d+))$/ do |oz|
  oz = oz.nil? ? TestData.hash[:oz] : oz
  expect(SdcMail.print_form.weight.oz.text_value.to_i).to eql oz
end

Then /^set print form dimensions to length (\d+) width (\d+) height (\d+)$/ do |l, w, h|
  step "set print form length to #{l}"
  step "set print form width to #{w}"
  step "set print form height to #{h}"
end

Then /^set print form length to (\d+)$/ do |l|
  length = SdcMail.print_form.dimensions.length
  expect(length).to be_present, 'Length text field is not present'
  length.set(l)
  expect(length.text_value.to_i).to eql l
  TestData.hash[:length] = l
end

Then /^set print form width to (\d+)$/ do |w|
  width = SdcMail.print_form.dimensions.width
  expect(width).to be_present, 'Width text field is not present'
  width.set(w)
  expect(width.text_value.to_i).to eql w
  TestData.hash[:width] = w
end

Then /^set print form height to (\d+)$/ do |h|
  height = SdcMail.print_form.dimensions.height
  expect(height).to be_present, 'Height text field is not present'
  height.set(h)
  expect(height.text_value.to_i).to eql h
  TestData.hash[:height] = h
end

Then /^increment print form length by (\d+)$/ do |length|
  old_length = SdcMail.print_form.dimensions.length.text_value
  length.times do SdcMail.print_form.dimensions.length.increment.click end
  step "expect print form length is #{old_length.to_i + length.to_i}"
  TestData.hash[:length] = old_length.to_i + length.to_i
end

Then /^increment print form width by (\d+)$/ do |width|
  old_width = SdcMail.print_form.dimensions.width.text_value
  width.times do SdcMail.print_form.dimensions.width.increment.click end
  step "expect print form width is #{old_width.to_i + width.to_i}"
  TestData.hash[:width] = old_width.to_i + width.to_i
end

Then /^increment print form height by (\d+)$/ do |height|
  old_height = SdcMail.print_form.dimensions.height.text_value
  height.times do SdcMail.print_form.dimensions.height.increment.click end
  step "expect print form height is #{old_height.to_i + height.to_i}"
  TestData.hash[:height] = old_height.to_i + height.to_i
end

Then /^decrement print form length by (\d+)$/ do |length|
  old_length = SdcMail.print_form.dimensions.length.text_value
  length.times do SdcMail.print_form.dimensions.length.decrement.click end
  step "expect print form length is #{old_length.to_i - length.to_i}"
  TestData.hash[:length] = old_length.to_i + length.to_i
end

Then /^decrement print form width by (\d+)$/ do |width|
  old_width = SdcMail.print_form.dimensions.width.text_value
  width.times do SdcMail.print_form.dimensions.width.decrement.click end
  step "expect print form width is #{old_width.to_i - width.to_i}"
  TestData.hash[:width] = old_width.to_i + width.to_i
end

Then /^decrement print form height by (\d+)$/ do |height|
  old_height = SdcMail.print_form.dimensions.height.text_value
  height.times do SdcMail.print_form.dimensions.height.decrement.click end
  step "expect print form height is #{old_height.to_i - height.to_i}"
  TestData.hash[:height] = old_height.to_i + height.to_i
end

Then /^increment print form dimensions by length (\d+) width (\d+) height (\d+)$/ do |l, w, h|
  step "increment print form length by #{l}"
  step "increment print form width by #{w}"
  step "increment print form height by #{h}"
end

Then /^decrement print form dimensions by length (\d+) width (\d+) height (\d+)$/ do |l, w, h|
  step "decrement print form length by #{l}"
  step "decrement print form width by #{w}"
  step "decrement print form height by #{h}"
end

Then /^expect print form length is (?:correct|(\d+))$/ do |h|
  h = h.nil? ? TestData.hash[:length] : h
  expect(SdcMail.print_form.dimensions.length.text_value.to_i).to eql(h)
end

Then /^expect print form width is (?:correct|(\d+))$/ do |h|
  h = h.nil? ? TestData.hash[:width] : h
  expect(SdcMail.print_form.dimensions.width.text_value.to_i).to eql(h)
end

Then /^expect print form height is (?:correct|(\d+))$/ do |h|
  h = h.nil? ? TestData.hash[:height] : h
  expect(SdcMail.print_form.dimensions.height.text_value.to_i).to eql(h)
end

Then /^select print form service (.*)$/ do |str|
  step 'blur out on print form'
  SdcLogger.debug "service: #{str}"
  TestData.hash[:service] = str
  service = SdcMail.print_form.service
  unless service.text_field.text_value.include?(str)
    service.drop_down.click
    service_element = service.service_element(:service, str)
    service.drop_down.click unless service_element.present?
    service_element.scroll_into_view unless service_element.present?
    service_element.click if service_element.present?
  end
  expect(service.text_field.text_value).to include str
  step 'blur out on print form'
end

Then /^expect print form service cost is \$(.+)$/ do |str|
  step 'blur out on print form'
  service = SdcMail.print_form.service
  expect(service.cost.present?).to be_truthy
  cost = service.cost.text_value.parse_digits.to_f
  expect(cost).to eql(str.to_f)
end

Then /^expect print form service cost is greater than \$(.+)$/ do |str|
  step 'blur out on print form'
  service = SdcMail.print_form.service
  expect(service.cost.present?).to be_truthy
  cost = service.cost.text_value.parse_digits.to_f
  expect(cost).to be > str.to_f
end

Then /^expect print form insure-for cost is \$(.+)$/ do |str|
  step 'blur out on print form'
  insure_for = SdcMail.print_form.insure_for
  expect(insure_for.cost.present?).to be_truthy
  cost = insure_for.cost.text_value.parse_digits.to_f
  expect(cost).to eql(str.to_f)
end

Then /^expect print form insure-for cost is greater than \$(.+)$/ do |str|
  step 'blur out on print form'
  insure_for = SdcMail.print_form.insure_for
  expect(insure_for.cost.present?).to be_truthy
  cost = insure_for.cost.text_value.parse_digits.to_f
  expect(cost).to be > str.to_f
end

Then /^expect print form tracking cost is \$(.+)$/ do |str|
  step 'blur out on print form'
  tracking = SdcMail.print_form.tracking
  expect(tracking.cost.present?).to be_truthy
  cost = tracking.cost.text_value.parse_digits.to_f
  expect(cost).to eql(str.to_f)
end

Then /^expect print form tracking cost is greater than \$(.+)$/ do |str|
  step 'blur out on print form'
  tracking = SdcMail.print_form.tracking
  expect(tracking.cost.present?).to be_truthy
  cost = tracking.cost.text_value.parse_digits.to_f
  expect(cost).to be > str.to_f
end

Then /^expect print form extra services cost is \$(.+)$/ do |str|
  step 'blur out on print form'
  step 'show advanced options'
  extra_services = SdcMail.print_form.extra_services
  expect(extra_services.cost.present?).to be_truthy
  cost = extra_services.cost.text_value.parse_digits.to_f
  expect(cost).to eql(str.to_f)
end

Then /^expect print form extra services cost is greater than \$(.+)$/ do |str|
  step 'blur out on print form'
  step 'show advanced options'
  extra_services = SdcMail.print_form.extra_services
  expect(extra_services.cost.present?).to be_truthy
  cost = extra_services.cost.text_value.parse_digits.to_f
  expect(cost).to be > str.to_f
end

Then /^expect print form total amount is \$(.+)$/ do |str|
  step 'blur out on print form'
  statusbar = SdcMail.statusbar
  expect(statusbar.total.present?).to be_truthy
  total = statusbar.total.text_value.parse_digits.to_f
  expect(total).to eql(str.to_f)
end

Then /^expect print form total amount is greater than \$(.+)$/ do |str|
  step 'blur out on print form'
  statusbar = SdcMail.statusbar
  expect(statusbar.total.present?).to be_truthy
  total = statusbar.total.text_value.parse_digits.to_f
  expect(total).to be > str.to_f
end


Then /^expect settings link is present in notification bar$/ do
  SdcMail.modals.notification_bar.settings_link.safe_wait_until_present(timeout: 15)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ss]ervice [Cc]ost [Ff]or (.*) is (.*)$/ do |service, cost|
  pending
  #stamps.mail.print_form.service.service_cost(TestData.hash[:service] = service).to eql("$#{cost}")
end

When /^[Pp]rint [Ll]abel$/ do
  pending
  #stamps.mail.mail_toolbar.print_label
end

When /^[Cc]lick Print Sample button on Print form$/ do
  pending
  #@print_window = stamps.mail.mail_toolbar.print_sample
end

When /^[Ss]elect on [Pp]rint [Pp]review [Pp]anel, [Ll]eft side starting label$/ do
  pending
  #stamps.mail.print_preview.select_left_label
end

Then /^[Ee]xpect on [Pp]rint [Pp]review [Pp]anel, left side label is selected$/ do
  pending
  #expect(stamps.mail.print_preview.left_selected?).to be(true), "Left Label image doesn't exists on Print form"
end

When /^[Ss]elect on [Pp]rint [Pp]review [Pp]anel, [Rr]ight side starting label$/ do
  pending
  #stamps.mail.print_preview.select_right_label
end

Then /^[Ee]xpect on [Pp]rint [Pp]review [Pp]anel, right side label is selected$/ do
  pending
  #expect(stamps.mail.print_preview.right_selected?).to be(true), "Right Label image doesn't exists on Print form"
end

Then /^[Ss]et Print Form Ship-To Country to a random country in PMI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMI_flat_rate, {})["group" + group].values
  TestData.hash[:country] = country_list[rand(country_list.size)]
  step "set print form mail-to country to #{TestData.hash[:country]}" unless SdcMail.print_form.mail_to.text_field.text_value.eql?(TestData.hash[:country])
end

Then /^set print form ship-to to international address$/ do |table|
  hash = table.hashes.first
  step "set print form mail-to country to #{hash['country']}"
  step "set print form name to #{hash['name']}"
  step "set print form company to #{hash[:company]}"
  step "set print form address 1 to #{hash['street_address1']}"
  step "set print form address 2 to #{hash[:street_address2]}"
  step "set print form province to #{hash['province']}"
  step "set print form city to #{hash[:city]}"
  step "set print form postal code to #{hash['postal_code']}"
  step "set print form phone to #{hash[:phone]}"
  TestData.hash[:address_hash] = hash
end

Then /^set print form mail-to country to (.*)$/ do |str|
  mail_to = SdcMail.print_form.mail_to
  mail_to.selection(:selection_element, str)
  text_field = mail_to.dom_text_field
  text_field.safe_wait_until_present(timeout: 1)
  text_field = mail_to.int_text_field if mail_to.int_text_field.present?
  unless text_field.text_value.eql?(str)
    text_field.set(str)
    mail_to.selection_element.safe_wait_until_present(timeout: 2)
    mail_to.selection_element.safe_click if mail_to.selection_element.present?
  end
  expect(text_field.text_value).to eql(str)
end

Then /^set print form name to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.name.wait_until_present(timeout: 4)
  mail_to.name.click
  mail_to.name.set(str)
  TestData.hash[:name] = str
end

Then /^set print form company to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.company.wait_until_present(timeout: 4)
  mail_to.company.click
  mail_to.company.set(str)
  TestData.hash[:company] = str
end

Then /^set print form address 1 to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.address1.wait_until_present(timeout: 4)
  mail_to.address1.click
  mail_to.address1.set(str)
  TestData.hash[:address1] = str
end

Then /^set print form address 2 to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.address2.wait_until_present(timeout: 4)
  mail_to.address2.click
  mail_to.address2.set(str)
  TestData.hash[:address2] = str
end

Then /^set print form city to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.city.wait_until_present(timeout: 4)
  mail_to.city.click
  mail_to.city.set(str)
  TestData.hash[:city] = str
end

Then /^set print form province to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.province.wait_until_present(timeout: 4)
  mail_to.province.click
  mail_to.province.set(str)
  TestData.hash[:province] = str
end

Then /^set print form postal code to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.postal_code.wait_until_present(timeout: 4)
  mail_to.postal_code.click
  mail_to.postal_code.set(str)
  TestData.hash[:postal_code] = str
end

Then /^set print form phone to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_phone : str
  mail_to = SdcMail.print_form.mail_to
  phone = mail_to.phone
  phone = mail_to.int_phone if mail_to.int_phone.present?
  phone.wait_until_present(timeout: 4)
  phone.click
  phone.set(str)
  TestData.hash[:phone] = str
end

Then /^click print form edit customs form button$/ do
  SdcMail.print_form.contents.customs_form.click
  # that's it you're ready to print
end

Then /^click print form restrictions button$/ do
  SdcMail.print_form.contents.restrictions.click
  step 'expect restrictions modal is present'
end


##
#
#
#
#
#
#
#
#
Then /^[Ee]xpect Print form Domestic Address Field is present$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.mail_address.textarea).to be_present, "Print form Domestic Address Field is NOT present"
end

Then /^[Ee]xpect Print form International Name Field is present$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.int_mail_address.name).to be_present, "Print form International Name Field is NOT present"
end

Then /^[Ee]xpect Print form International Company Field is present$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.int_mail_address.company).to be_present, "Print form International Company Field is NOT present"
end

Then /^[Ee]xpect Print form International Address 1 Field is present$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.int_mail_address.address1).to be_present, "Print form International Address 1 Field is NOT present"
end

Then /^[Ee]xpect Print form International Address 2 Field is present$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.int_mail_address.address2).to be_present, "Print form International Address 2 Field is NOT present"
end

Then /^[Ee]xpect Print form International City Field is present$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.int_mail_address.city).to be_present, "Print form International City Field is NOT present"
end

Then /^[Ee]xpect Print form International Province Field is present$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.int_mail_address.province).to be_present, "Print form International Province Field is NOT present"
end

Then /^[Ee]xpect Print form International Postcode Field is present$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.int_mail_address.postal_code).to be_present, "Print form International Postcode Field is NOT present"
end

Then /^[Ee]xpect Print form International Phone Field is present$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.int_mail_address.phone).to be_present, "Print form International Phone Field is NOT present"
end

Then /^save print form total cost$/ do
  TestData.hash[:total_ship_cost] = SdcMail.statusbar.total.text_value.parse_digits.to_f
end

Then /^save print form mail from$/ do
  TestData.hash[:ship_from] = SdcMail.print_form.mail_from.text_field.text_value
end

Then /^[Cc]lick on [Bb]uy [Mm]ore [Ll]abels link$/ do
  pending
  #stamps.mail.print_preview.buy_more_labels.link.click
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect Print form service is empty$/ do
  pending
  #expect(stamps.mail.print_form.service.textbox.text).eql?("")
end



