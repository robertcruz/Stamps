
Then /^set address on add address modal to (.+)$/ do |str|
  address = TestHelper.address_helper(str)
  add_address = SdcMail.modals.add_address
  expect(add_address.window.present?).to be(true)
  add_address.address.set!(address)
  add_address.address_label.blur_out
  add_address.email_label.blur_out
  TestData.hash[:add_address_address] = address
end

Then /^click cancel button on add address modal$/ do
  add_address = SdcMail.modals.add_address
  add_address.cancel.safe_click
end

Then /^click add button on add address modal$/ do
  add_address = SdcMail.modals.add_address
  add_address.add.safe_click
end

Then /^blur out on add address modal$/ do
  add_address = SdcMail.modals.add_address
  add_address.email_label.blur_out
  add_address.address_label.blur_out
end

Then /^expect add address modal is present$/ do
  add_address = SdcMail.modals.add_address
  expect(add_address.window.present?).to be true
  expect(add_address.title.text.strip).to eql 'Add Address'
end

Then /^expect add address email error message is (.*)$/ do |str|
  add_address = SdcMail.modals.add_address
  5.times do
    step 'blur out on add address modal'
    add_address.email_error_message.safe_wait_until_present(timeout: 2)
    add_address.email_error_message.safe_click
    break if add_address.email_error_message.present?
  end
  expect(add_address.email_error_message.attribute_value 'data-errorqtip').to include str
end



Then /^set email on add address modal(?:| (.+))$/ do |str|
  str ||= TestHelper.rand_email
  add_address = SdcMail.modals.add_address
  expect(add_address.window.present?).to be(true)
  add_address.email.set(str)
  step 'blur out on add address modal'
  expect(add_address.email.text_value).to eql(str)
  TestData.hash[:add_address_email] = str
end

Then /^expect incomplete fields modal is not present$/ do
  incomplete_fields = SdcMail.modals.incomplete_fields
  incomplete_fields.window.safe_wait_until_present(timeout: 3)
  if incomplete_fields.window.present?
    expect(incomplete_fields.body.text).to eql('')
  end
end

Then /^expect incomplete fields modal is present$/ do
  incomplete_fields = SdcMail.modals.incomplete_fields
  incomplete_fields.window.safe_wait_until_present(timeout: 10)
  expect(incomplete_fields.window.present?).to be true
  expect(incomplete_fields.title.text.strip).to eql('Incomplete Fields')
end

Then /^expect error message on incomplete fields modal includes (.*)$/ do |str|
  incomplete_fields = SdcMail.modals.incomplete_fields
  incomplete_fields.window.safe_wait_until_present(timeout: 4)
  expect(incomplete_fields.window.present?).to be_truthy
  expect(incomplete_fields.error_message.text_value.strip).to include str
end

Then /^click close button on incomplete fields$/ do
  incomplete_fields = SdcMail.modals.incomplete_fields
  3.times do
    incomplete_fields.close.safe_click
    break unless incomplete_fields.window.present?
  end
  expect(incomplete_fields.window.present?).to be(false)
end

Then /^expect address cleansing modal is present$/ do
  address_cleansing=SdcMail.modals.address_cleansing
  address_cleansing.title.safe_wait_until_present(timeout:10)
  expect(address_cleansing.title.present?).to be(true)
end

Then /^click accept button on address cleansing modal$/ do
  address_cleansing=SdcMail.modals.address_cleansing
  address_cleansing.accept_button.safe_wait_until_present(timeout:10)
  expect(address_cleansing.accept_button.present?).to be(true)
  address_cleansing.accept_button.click
end

Then /^expect mail server error is present$/ do
  expect(SdcMail.modals.server_error.title).to be_present
end

Then /^expect mail server error is not present$/ do
  server_error = SdcMail.modals.server_error
  server_error.title.safe_wait_until_present(timeout: 2)
  expect(server_error.title).not_to be_present
end

Then /^wait for mail server error$/ do
  SdcMail.modals.server_error.title.wait_until_present
end


