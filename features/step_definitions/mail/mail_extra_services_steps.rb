Then /^expect extra services cod is present$/ do
  expect(SdcMail.print_form.advanced_options.extra_services.cod).to be_present, "COD is not present!"
end

Then /^set extra services cod to (\d*.?\d+)$/ do |amount|
  step 'expect extra services cod is present'
  SdcMail.print_form.advanced_options.extra_services.cod.set(amount)
  step "expect extra services cod value is #{amount}"
end

Then /^expect extra services cod value is (\d*.?\d+)$/ do |amount|
  step 'expect extra services cod is present'
  expect(stamps.mail.print_form.advanced_options.extra_services.cod.value.to_f).to eql(amount.to_f)
end

Then /^[Ee]xpect Extra Services COD Price to be (\d*.?\d+)$/ do |expectation|
  expect(stamps.mail.print_form.advanced_options.extra_services.cod_price_field).to be_present
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.cod_price==expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.cod_price).to eql(expectation.to_f.round(2))
end

Then /^[Ss]ave Extra Services$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.save_field).to be_present
  stamps.mail.print_form.advanced_options.extra_services.save
  # stamps.mail.print_form.advanced_options.xtra_serv_panel.save
end

Then /^expect extra services modal is present$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services).to be_present, "Extra services modal is not present"
end

Then /^expect extra services modal is not present$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services).not_to be_present, "Extra services modal is still present"
end

Then /^close extra services$/ do
  step 'expect extra services modal is present'
  SdcMailprint_form.advanced_options.extra_services.x_btn.click
  step 'expect extra services modal is not present'
end

Then  /^expect extra services security is present$/ do |value|
  expect(SdcMail.print_form.advanced_options.extra_services.security.drop_down).to be_present, "Extra services security is not present!"
end

Then /^set extra services security to (.*)$/ do |value|
  security = SdcMail.print_form.advanced_options.extra_services.security
  security.selection_element(name: 'selection', value: value)
  security.drop_down.click unless security.selection.present?
  expect(security.selection).to be_present, "#{value} is not present in Extra Services Security list"
  security.selection.click
  expect(security.text_field.text_value).to include(value)
end

Then /^expect extra services security is (.*)$/ do |value|
  expect(SdcMail.print_form.advanced_options.extra_services.security.text_field.text_value).to eql(value)
end

Then /^[Cc]lick value must be shown window Continue button$/ do
  expect(stamps.mail.print_form.advanced_options.value_must_be_shown.continue).to be_present
  stamps.mail.print_form.advanced_options.value_must_be_shown.continue.click
end

Then /^[Cc]lick [Ii] [Aa]gree in Special Contents Warning modal$/ do
  expect(stamps.mail.print_form.advanced_options.special_contents_warning.i_agree).to be_present
  stamps.mail.print_form.advanced_options.special_contents_warning.i_agree.click
end


Then /^[Ee]xpect Extra Services Security Price to be (\d*.?\d+)$/ do |expectation|
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.security_price==expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.security_price).to eql(expectation.to_f.round(2))
end

Then /^expect extra services security value is enabled$/ do
  expect(SdcMail.print_form.advanced_options.extra_services.value.enabled?).to be_truthy, 'Extra services security value is disabled'
end

Then /^[Ss]et Extra Services Value to (\d*.?\d+)$/ do |value|
  stamps.mail.print_form.advanced_options.extra_services.value.set(value)
end

Then /^[Ss]et Extra Services Handling to (.*)$/ do |str|
  stamps.mail.print_form.advanced_options.extra_services.handling.select(str)
end

Then /^[Ee]xpect Extra Services Handling is (.*)$/ do |str|
  expect(stamps.mail.print_form.advanced_options.extra_services.handling).to be_present
  expect(stamps.mail.print_form.advanced_options.extra_services.handling.textbox.text).to eq str
end

Then /^[Cc]heck Extra Services Return Receipt$/ do
  stamps.mail.print_form.advanced_options.extra_services.return_receipt.check
end

Then /^[Ee]xpect Extra Services Return Receipt Price to be (\d*.?\d+)$/ do |expectation|
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.return_receipt_price==expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.return_receipt_price).to eql(expectation.to_f.round(2))
end

Then /^[Uu]ncheck Extra Services Return Receipt$/ do
  stamps.mail.print_form.advanced_options.extra_services.return_receipt.uncheck
end

Then /^[Cc]heck Extra Services Electronic Return Receipt$/ do
  stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.check
end

Then /^[Uu]ncheck Extra Services Electronic Return Receipt$/ do
  stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.uncheck
end

Then /^[Cc]heck Extra Services Restricted Delivery$/ do
  stamps.mail.print_form.advanced_options.extra_services.restricted_delivery.check
end

Then /^[Ee]xpect Extra Services Restricted Delivery is checked$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.restricted_delivery.checked?).to be(true)
end

Then /^[Ee]xpect Extra Services Restricted Delivery is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.restricted_delivery.checked?).to be(false)
end

Then /^[Ee]xpect Extra Services Return Receipt is checked$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.return_receipt.checked?).to be(true)
end

Then /^[Ee]xpect Extra Services Return Receipt is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.return_receipt.checked?).to be(false)
end

Then /^[Ee]xpect [Ee]xtra [Ss]ervices Electronic Return Receipt is checked$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.checked?).to be(true)
end

Then /^[Ee]xpect [Ee]xtra [Ss]ervices Electronic Return Receipt is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.checked?).to be(false)
end




Then /^[Ee]xpect Extra Services Restricted Delivery Price to be (\d*.?\d+)$/ do |expectation|
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.restricted_delivery_price==expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.restricted_delivery_price).to eql(expectation.to_f.round(2))
end

Then /^[Uu]ncheck Extra Services Restricted Delivery$/ do
  stamps.mail.print_form.advanced_options.extra_services.restricted_delivery.uncheck
end

Then /^[Cc]heck Extra Services Notice of Non-Delivery$/ do
  stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice.check
end

Then /^[Ee]xpect Extra Services Notice of Non-Delivery Price to be (\d*.?\d+)$/ do |expectation|
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice_price==expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice_price).to eql(expectation.to_f.round(2))
end

Then /^[Uu]ncheck Extra Services Notice of Non-Delivery$/ do
  stamps.mail.print_form.advanced_options.extra_services.non_delivery_notice.uncheck
end

Then /^[Cc]heck Extra Services Fragile$/ do
  stamps.mail.print_form.advanced_options.extra_services.fragile.check
end

Then /^[Uu]ncheck Extra Services Fragile$/ do
  stamps.mail.print_form.advanced_options.extra_services.fragile.uncheck
end

Then /^[Cc]heck Extra Services Return Receipt for Merchandise$/ do
  stamps.mail.print_form.advanced_options.extra_services.return_receipt_merchandise.check
end

Then /^[Ee]xpect Extra Services Return Receipt for Merchandise is checked$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.return_receipt_merchandise.checked?).to be(true)
end

Then /^[Ee]xpect Extra Services Return Receipt for Merchandise is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.return_receipt_merchandise.checked?).to be(false)
end

Then /^[Uu]ncheck Extra Services Return Receipt for Merchandise$/ do
  stamps.mail.print_form.advanced_options.extra_services.merchandise_return_receipt.uncheck
end

Then /^[Cc]heck Extra Services Non-Rectangular$/ do
  stamps.mail.print_form.advanced_options.extra_services.non_rectangular.check
end

Then /^[Uu]ncheck Extra Services Non-Rectangular$/ do
  stamps.mail.print_form.advanced_options.extra_services.non_rectangular.uncheck
end

Then /^[Ee]xpect Extra Services Total Price to be (\d*.?\d+)$/ do |expectation|
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.total_price==expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.total_price).to eql(expectation.to_f.round(2))
end

Then /^[Cc]lick [Cc]ontinue in [Hh]idden [Pp]ostage [Nn]ot [Aa]llowed modal$/ do
  stamps.mail.mail_toolbar.hidden_postage_warning.continue
end

Then /^[Cc]lick [Cc]ancel in [Hh]idden [Pp]ostage [Nn]ot [Aa]llowed modal$/ do
  stamps.mail.mail_toolbar.hidden_postage_warning.cancel
end

Then /^[Ee]xpect [Hh]idden [Pp]ostage [Nn]ot [Aa]llowed modal appears due to [Ee]xtra [Ss]ervice (.*)$/ do |service|
  expect(stamps.mail.mail_toolbar.hidden_postage_warning.present?).to be(true)
  expect(stamps.mail.mail_toolbar.hidden_postage_warning.extra_service(service).present?).to be(true)
end