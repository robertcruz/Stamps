Then /^click prints on reports filter panel$/ do
  SdcReports.filter_panel.prints.link.click
  step 'expect by service on reports filter panel print is present'
  step 'expect by cost code on reports filter panel print is present'
end

Then /^expand prints on reports filter panel$/ do
  SdcReports.filter_panel.prints.link.click unless SdcReports.filter_panel.prints.by_service.present?
end

Then /^expect by service on reports filter panel print is present$/ do
  expect(SdcReports.filter_panel.prints.by_service).to be_present
end

Then /^expect by cost code on reports filter panel print is present$/ do
  expect(SdcReports.filter_panel.prints.by_cost_code).to be_present
end

Then /^expect filter panel on reports is expanded$/ do
  expect(SdcReports.filter_panel.collapse).to be_present
end

Then /^expect filter panel on reports is collapsed$/ do
  expect(SdcReports.filter_panel.collapsed_view.title).to be_present
end

Then /^click collapse button on reports filter panel$/ do
  SdcReports.filter_panel.collapse.click
  step 'expect filter panel on reports is collapsed'
end

Then /^click expand button on reports filter panel$/ do
  SdcReports.filter_panel.collapsed_view.expand.click
  step 'expect filter panel on reports is expanded'
end

Then /^select by service on reports filter panel prints$/ do
  SdcReports.filter_panel.prints.by_service.select
  step 'expect by service on filter panel prints on reports is selected'
end

Then /^expect by service on filter panel prints on reports is selected$/ do
  expect(SdcReports.filter_panel.prints.by_service.selected?).to be_truthy
end

Then /^select by cost code on reports filter panel prints$/ do
  SdcReports.filter_panel.prints.by_cost_code.select
  step 'expect by cost code on filter panel prints on reports is selected'
end

Then /^expect by cost code on filter panel prints on reports is selected$/ do
  expect(SdcReports.filter_panel.prints.by_cost_code.selected?).to be_truthy
end

Then /^select expenses on reports filter panel$/ do
  SdcReports.filter_panel.expenses.select
  step 'expect expenses on filter panel on reports is selected'
end

Then /^expect expenses on filter panel on reports is selected$/ do
  expect(SdcReports.filter_panel.expenses.selected?).to be_truthy
end

Then /^select balances on reports filter panel$/ do
  SdcReports.filter_panel.balances.select
  step 'expect balances on filter panel on reports is selected'
end

Then /^expect balances on filter panel on reports is selected$/ do
  expect(SdcReports.filter_panel.balances.selected?).to be_truthy
end








