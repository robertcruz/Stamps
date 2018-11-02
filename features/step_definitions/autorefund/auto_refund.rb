
Then /^navigate to auto refund page$/ do
  env = case TestSession.env.url
          when :qacc
            'ext.qacc'
          when :qasc
            'ext.qasc'
          when :stg
            '.staging'
          when :prod
            ''
          else
            # ignore
        end
  step "go to url https://or#{env}.stamps.com/PostageTools/RefundEligibilityReport.aspx"
end

Then /^wait while auto refund page ready$/ do
  SdcAutoRefund.loading.safe_wait_until_present(timeout: 8)
  SdcAutoRefund.loading.wait_while_present(timeout: 240)
end

Then /^expect title on auto refund present$/ do
  expect(SdcAutoRefund.title).to be_present
end

Then /^expect terms and conditions link on auto refund present$/ do
  expect(SdcAutoRefund.terms_conditions).to be_present
end

Then /^expect update label status button on auto refund present$/ do
  expect(SdcAutoRefund.update_label_status).to be_present
end

Then /^select shipped on row (.*) on auto refund$/ do |str|
  SdcAutoRefund.shipped_label(str).click
  step "expect shipped on row #{str} on auto refund selected"
end

Then /^expect shipped on row (.*) on auto refund selected$/ do |str|
  expect(SdcAutoRefund.shipped(str).checked?).to be_truthy
end

Then /^select not shipped on row (.*) on auto refund$/ do |str|
  SdcAutoRefund.not_shipped_label(str).click
  step "expect not shipped on row #{str} on auto refund selected"
end

Then /^expect not shipped on row (.*) on auto refund selected$/ do |str|
  expect(SdcAutoRefund.not_shipped(str).checked?).to be_truthy
end

Then /^click update label status button on auto refund present$/ do
  SdcAutoRefund.update_label_status.click
end

Then /^expect success message on auto refund present$/ do
  expect(SdcAutoRefund.success_msg).to be_present
end

Then /^select not shipped for all rows on auto refund/ do
  (1..SdcAutoRefund.rows.count).each do |index|
    step "select not shipped on row #{index} on auto refund"
  end
end

Then /^expect not shipped for all rows on auto refund selected$/ do
  (1..SdcAutoRefund.rows.count).each do |index|
    step "expect not shipped on row #{index} on auto refund selected"
  end
end

Then /^select shipped for all rows on auto refund/ do
  (1..SdcAutoRefund.rows.count).each do |index|
    step "select shipped on row #{index} on auto refund"
  end
end

Then /^expect shipped for all rows on auto refund selected$/ do
  (1..SdcAutoRefund.rows.count).each do |index|
    step "expect shipped on row #{index} on auto refund selected"
  end
end


