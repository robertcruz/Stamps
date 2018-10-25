
Then /^navigate to auto refund page$/ do
  env = case SdcEnv.env
          when :qacc
            'ext.qacc'
          when :qasc
            'ext.qasc'
          when :stg
            '.testing'
          when :prod
            ''
          else
            # ignore
        end
  step "go to url https://print#{env}.stamps.com/PostageTools/RefundEligibilityReport.aspx"
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
  SdcAutoRefund.shipped(str).radio.click
end

Then /^expect shipped on row (.*) on auto refund selected$/ do |str|
  expect(SdcAutoRefund.shipped(str).radio.selected?).to be_truthy
end

Then /^select not shipped on row (.*) on auto refund$/ do |str|
  SdcAutoRefund.not_shipped(str).radio.click
end

Then /^expect not shipped on row (.*) on auto refund selected$/ do |str|
  expect(SdcAutoRefund.not_shipped(str).radio.selected?).to be_truthy
end

Then /^click update label status button on auto refund present$/ do
  SdcAutoRefund.update_label_status.click
end

Then /^expect success message on auto refund present$/ do
  expect(SdcAutoRefund.success_msg).to be_present
end

Then /^expect not shipped for all rows on auto refund selected$/ do
  #not implemented
  not_shipped_all = SdcAutoRefund.not_shipped_all
  not_shipped_all.each do |not_shipped|
    expect(not_shipped.selected?).to be_truthy
  end
end


