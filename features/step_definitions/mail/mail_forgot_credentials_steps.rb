Then /^Mail: Open Forgot Username Modal/ do
  #config.logger.step "Mail: Open Forgot Username Modal"
  @forgot_username = stamps.mail.sign_in_modal.forgot_username if @forgot_username.nil?

end

Then /^on Print form, set forgotten email to (.*)$/ do |email|
  #config.logger.step "on Print form, enter forgotten email: \n #{email}"
  @forgot_username = stamps.mail.sign_in_modal.forgot_username if @forgot_username.nil?
  @forgot_username.email.set email
  @forgot_username.continue
  @forgot_username.ok
end

Then /^Mail: Open Forgot Password Modal/ do
  #config.logger.step "Mail: Open Forgot Password Modal"
  @forgot_password = stamps.mail.sign_in_modal.forgot_password if @forgot_password.nil?
end

Then /^on Print form, set forgotten username to (.*)$/ do |username|
  #config.logger.step "on Print form, enter forgotten username: \n #{username}"
  @forgot_password = stamps.mail.sign_in_modal.forgot_password if @forgot_password.nil?
  @forgot_password.username.set username
  @forgot_password.continue
end

Then /^on Print form, set secret answer 1 to (.*)$/ do |answer|
  #config.logger.step "on Print form, set secret answer 1 to: \n #{answer}"
  @forgot_password = stamps.mail.sign_in_modal.forgot_password if @forgot_password.nil?
  @forgot_password.secret_answer_1.set answer
end

Then /^on Print form, set secret answer 2 to (.*)$/ do |answer|
  #config.logger.step "on Print form, set secret answer 1 to: \n #{answer}"
  @forgot_password = stamps.mail.sign_in_modal.forgot_password if @forgot_password.nil?
  @forgot_password.secret_answer_2.set answer
end

Then /^Mail: Confirm password reset/ do
  #config.logger.step "Mail: Confirm password reset"
  @forgot_password = stamps.mail.sign_in_modal.forgot_password if @forgot_password.nil?
  @forgot_password.continue
  @forgot_password.confirm_reset
end

