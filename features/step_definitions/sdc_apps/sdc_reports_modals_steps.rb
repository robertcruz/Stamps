#filters
Then /^expect filters modal on reports is present$/ do
  expect(SdcReports.modals.filters.title).to be_present
end

Then /^expect filters modal on reports is not present$/ do
  expect(SdcReports.modals.filters.title).not_to be_present
end

Then /^close filters modal on reports$/ do
  SdcReports.modals.filters.x_btn.click
  step 'expect filters modal on reports is not present'
end

#feedback
Then /^expect feedback modal on reports is present$/ do
  expect(SdcReports.modals.feedback.title).to be_present
end

Then /^expect feedback modal on reports is not present$/ do
  expect(SdcReports.modals.feedback.title).not_to be_present
end

Then /^close feedback modal on reports$/ do
  SdcReports.modals.feedback.x_btn.click
  step 'expect filters modal on reports is not present'
end

#welcome modal
Then /^expect welcome modal on reports is present$/ do
  expect(SdcReports.modals.welcome.title).to be_present
end

Then /^expect welcome modal on reports is not present$/ do
  expect(SdcReports.modals.welcome.title).not_to be_present
end

Then /^close welcome modal on reports$/ do
  welcome = SdcReports.modals.welcome
  welcome.x_btn.click if welcome.present?
  step 'expect welcome modal on reports is not present'
end