Then /^wait while loading reports grid$/ do
  SdcReports.loading.safe_wait_until_present(timeout: 8)
  SdcReports.loading.wait_while_present(timeout: 240)
end