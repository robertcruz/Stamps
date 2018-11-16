Then /^expect print details on history is present$/ do
  step 'wait while loading history details panel'
  expect(SdcHistory.details.header.title).to be_present
end

Then /^expect return to on history print details contain (.*)$/ do |str|
  expect(SdcHistory.details.addresses.return_to.text_value).to include(str)
end

Then /^wait while loading history details panel$/ do
  SdcHistory.details.loading.safe_wait_until_present(timeout: 8)
  SdcHistory.details.loading.wait_while_present(timeout: 240)
end

Then /^expect value of cost code in history print details panel is (?:correct|(.*))$/ do |str|
  history_detail_cost_code = SdcHistory.details.reference.cost_code
  history_detail_cost_code.text_field.safe_wait_until_present(timeout: 15)
  history_detail_cost_code.text_field.scroll_into_view
  history_detail_cost_code.text_field.flash
  str ||= TestData.hash[:cost_code]
  actual_value = history_detail_cost_code.text_field.text_value
  expect(actual_value.strip).to eql str.strip
end

