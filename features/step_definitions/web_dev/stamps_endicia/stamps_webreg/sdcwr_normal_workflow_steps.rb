
Then /^SDCWR: navigates to default registration page$/ do
  SDCWWebsite.visit
  get_started = WhiteLabel.common_page.get_started
  get_started.wait_until_present(timeout: 5)
  WhiteLabel.common_page.get_started.click!
end