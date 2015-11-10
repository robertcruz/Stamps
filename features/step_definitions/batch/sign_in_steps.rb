Given /^I launch browser (\w+)$/ do |browser|
  log "Test: I launch browser #{browser}"
  @browser = Stamps::Test.setup browser
end

Given /^I launch default browser$/ do
  log "Test: I launch default browser"
  @browser = Stamps::Test.setup
end

Given /^I visit url for (\w+)$/ do |url_prefix|
  log "Test: I visit url for #{url_prefix}"
  batch.sign_in_page.visit url_prefix
end

Given /^I visit default url$/ do
  log "Test: I visit default url"
  batch.sign_in_page.visit
end

Given /^I am signed in as a batch shipper$/ do
  log "Test: I am signed in as a batch shipper"
  step "I launch default browser"
  step "I visit default url"
  batch.sign_in_page.sign_in
end

Given /^I am signed in as a batch shipper (.*)\/(.*)/ do |username, password|
  log "Test: I am signed in as a batch shipper #{username}/#{password}"
  step "I launch default browser"
  step "I visit default url"
  batch.sign_in_page.sign_in username, password
end

Given /^I am signed in as a batch shipper (.*)/ do |browser|
  log "Test: I am signed in as a batch shipper #{browser}"
  step "I launch browser #{browser}"
  step "I visit default url"
  batch.sign_in_page.sign_in
end

Given /^I am signed in as a batch shipper (.*)\/(.*)\/(.*)/ do |browser, username, password|
  log "Test: I am signed in as a batch shipper #{browser}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "I visit default url"
  batch.sign_in_page.sign_in username, password
end

Given /^I am signed in as a batch shipper (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  log "Test: I am signed in as a batch shipper #{browser}/#{url}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "I visit url for #{url}"
  batch.sign_in_page.sign_in username, password
end

Then /^Sign out$/ do
  log "Test: Sign out"
  batch.navigation.sign_out
end
