
# common Print form steps for Envelope|Label|Roll|CM

Then /^set print form mail-to (?:|to )(?:|a )(?:|random )address(?: to| in| between|) (.*)$/ do |str|
  address = SdcCore::TestHelper.address_helper(str)
  SdcMail.print_form.mail_to.text_area.set(address)
  TestData.hash[:address] = address
end

Then /^[Ee]xpect Print form Mail To is disabled$/ do
  expect(stamps.mail.print_form.mail_to.enabled?).to be(true), "Print form Mail To is NOT disabled"
end

Then /^click print form mail to link$/ do
  SdcMail.print_form.mail_to.link.click
  step 'expect search contacts modal is present'
end

Then /^set print form email tracking (.+)$/ do |value|
  SdcMail.print_form.email_tracking.text_field.set(value)
  expect(SdcMail.print_form.email_tracking.text_field.text_value).to eql(value)
end

Then /^set print form insure for ([\d.]+)$/ do |value|
  SdcMail.print_form.insure_for.insurance.set(value)
  expect(SdcMail.print_form.insure_for.insurance.text_value.to_f).to eql(value.to_f)
end

Then /^set print form tracking (.+)$/ do |value|
  step 'wait for js to stop'
  tracking = SdcMail.print_form.tracking
  tracking.tracking_element(name: "selection", value: value)
  tracking.drop_down.click unless tracking.selection.present?
  expect(tracking.selection).to be_present, "#{value} is not present in Tracking list"
  tracking.selection.click
  expect(tracking.text_field.text_value).to include(value)
end