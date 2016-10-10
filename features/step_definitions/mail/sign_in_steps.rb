Given /^Visit Mail sign in page$/ do
  logger.info "I visit mail sign-in page"
  web_apps.param.app = :mail
  web_apps.visit(:mail).should include "stamps.com"
end

Given /^I am signed in as Mail shipper$/ do
  logger.info "I am signed in as a mail shipper"
  step "Launch default browser"
  step "Visit Mail sign in page"
  web_apps.mail.sign_in_modal.sign_in
end

Given /^I am signed in as Mail shipper (.*)\/(.*)/ do |username, password|
  logger.info "I am signed in as mail shipper #{username}/#{password}"
  step "I launched default browser"
  step "Visit Mail sign in page"
  web_apps.mail.sign_in_modal.sign_in username, password
end

Then /^I am signed in as Mail shipper for the first time(?:| with credentials (.*)\/(.*))$/ do |username, password|
  logger.info "I am signed in as Mail shipper for the first time #{username}/#{password}"
  logger.info "I am signed in as Mail shipper for the first time #{@username}/#{@password}"
  @username = username unless username.nil?
  @password = password unless password.nil?
  logger.info "I am signed in as Mail shipper for the first time #{@username}/#{@password}"
  @whats_new_modal = web_apps.mail.sign_in_modal.sign_in_first_time username, password
end

Then /^What's New: Expect modal to be present$/ do
  web_apps.mail.sign_in_modal.whats_new_modal.window_title.text.should eql "What’s new in Stamps.com Online"
end

Then /^What's New: Click Continue button$/ do
  web_apps.mail.sign_in_modal.whats_new_modal.continue
end

Then /^What's new: Click More Info$/ do
  @more_info_page = web_apps.mail.sign_in_modal.whats_new_modal.more_info
end

Then /^More Info: Expect More Info page is present$/ do
  logger.info "More Info: Expect More Info page is present"
  expectation = "A second browser window was opened"
  expectation = "A second browser window did not open." unless @more_info_page.present?
  expectation.should eql "A second browser window was opened"
end

Then /^More Info: Close More Info page$/ do
  logger.info "More Info: Close More Info page"
  logger.info @more_info_page.title
  logger.info @more_info_page.title
  logger.info @more_info_page.title
  logger.info @more_info_page.title
  logger.info @more_info_page.title
  sleep 2
  @more_info_page.close
  sleep 3
end

Then /^Mail Sign In: Set Remember Username to Checked$/ do
  logger.info "Step: Mail Sign In: Set Remember Username to Checked"
  #todo-fix username
  fix me!
  web_apps.mail.sign_in_modal.remember_username.check
end

Then /^Mail Sign In: Check Remember Username$/ do
  logger.info "Step: Mail Sign In: Check Remember Username #{ENV["USR"]}"
  step "Visit Mail sign in page"
  #todo-fix username
  fix me!
  web_apps.mail.sign_in_modal.sign_in_username_check ENV["USR"]
end

Then /^Mail Sign In: Expect Remember Username is checked$/ do
  logger.info "Mail Sign In: Expect Remember Username is checked"
  fix me!
  #todo-fix username
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Mail Sign In: Set Remember Username to Unchecked$/ do
  logger.info "Step: Mail Sign In: Set Remember Username to Unchecked"
  fix me!
  #todo-fix username
  web_apps.mail.sign_in_modal.sign_in
end

Then /^Mail Sign In: Expect Remember Username is unchecked$/ do
  logger.info "Postage Sign In: Expect Remember Username is unchecked"
  fix me
  #todo-fix username
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Mail Sign In: Expect WhatsNewModal to be present$/ do
  logger.info "Sign In: Expect Welcome modal"

  @whats_new.present?.should be true
end

Then /^Mail Sign In: Close WhatsNewModal$/ do
  @whats_new.close
end

Then /^Mail Sign In: Continue WhatsNewModal$/ do
  @whats_new.continue
end

