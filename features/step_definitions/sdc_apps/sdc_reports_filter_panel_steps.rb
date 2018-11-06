Then /^click prints on reports filter panel$/ do
  SdcReports.filter_panel.prints.link.click
  step 'expect by service on reports filter panel print is present'
  step 'expect by cost code on reports filter panel print is present'
end

Then /^expect by service on reports filter panel print is present$/ do
  expect(SdcReports.filter_panel.prints.by_service).to be_present
end

Then /^expect by cost code on reports filter panel print is present$/ do
  expect(SdcReports.filter_panel.prints.by_cost_code).to be_present
end

