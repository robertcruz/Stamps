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


# Addresses

Then /^expect address shipped to in transaction details displays saved address$/ do
  shipped_address = SdcHistory.details.addresses
  expect(shipped_address.shipped_to.text_value). to eql(TestData.hash[:address])
end

Then /^expect address shipped to contains (\d+) lines$/ do |lines|
  address = TestData.hash[:address]
  address = address.split("\n")
  address_lines_count = address.length
  expect(address_lines_count.to_i). to eql(lines.to_i)
  SdcLogger.info "Shipped to address contains #{address_lines_count} lines"
end

Then /^click search icon on history filter panel$/ do
  search =  SdcHistory.filter_panel.search
  search.search_icon.click
end

Then /^set search prints to (?:newly added|(.*)) tracking number on history filter panel$/ do |str|
  search =  SdcHistory.filter_panel.search
  search.search_prints.safe_wait_until_present(timeout: 10)
  str||= TestData.hash[:tracking_number]
  search.search_prints.set(str)
end