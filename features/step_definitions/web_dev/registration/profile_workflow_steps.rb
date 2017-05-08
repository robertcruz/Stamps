Then /^(?:|[Ii] )[Ll]oad(?:|ed) (?:|default )[Rr]egistration(?: [Pp]age| [Tt]heme (.*))$/ do |str|
  test_param[:registration_theme] = str
  step "I launch default browser"
  registration.load_theme(test_param[:registration_theme])
end

Then /^(?:|[Ii] )[Ll]oad(?:|ed) SDC Website$/ do
  step "I launch default browser"
  sdc_website.load_page
end

Then /^[Cc]lick on [Gg]et [Ss]tarted$/ do
  registration = sdc_website.get_started
end

Then /^[Ss]et [Pp]rofile [Pp]age [Ee]mail to (?:random value|(.*))$/ do |str|
  test_param[:email] = (str.nil?)?(helper.random_email):str
  registration.profile.email.wait_until_present(10)
  registration.profile.email.set(test_param[:email])
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Ee]mail is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:email]:str
  expect(registration.profile.email.text).to eql(str)
end

Then /^[Ss]et [Pp]rofile [Pp]age [Uu]sername to (?:random value|(.*))$/ do |str|
  test_param[:username] = (str.nil?)?(helper.random_alpha_numeric):str
  registration.profile.account_info.account_username.set(test_param[:username])
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Uu]sername is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:username]:str
  expect(registration.profile.account_info.account_username.text).to eql(str)
end

Then /^[Ss]et [Pp]rofile [Pp]age [Pp]assword to (?:random value|(.*))$/ do |str|
  test_param[:password] = (str.nil?)?(helper.random_password):str
  registration.profile.account_info.account_password.set(test_param[:password])
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Pp]assword is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:password]:str
  expect(registration.profile.account_info.account_password.text).to eql(str)
end

Then /^[Ss]et [Pp]rofile [Pp]age [Rr]e-[Tt]ype [Pp]assword to (?:random value|(.*))$/ do |str|
  registration.profile.account_info.retype_password.set((str.nil?)?(test_param[:password]):str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Rr]e-[Tt]ype [Pp]assword is (?:correct|(.*))$/ do |str|
  expect(registration.profile.account_info.retype_password.text).to eql(test_param[:password])
end

# Business Use - Mostly mailing (letters/postcards/flats)
# Business/Ecommerce Use - Mostly shipping packages
# Business Use - Both mailing and shipping
# Individual/Home Office
Then /^[Ss]et [Pp]rofile [Pp]age [Ss]urvey [Qq]uestion to (.*)$/ do |str|
  test_param[:survey_question] = str
  test_param[:survey_question_selected] = registration.profile.survey_question.select_from_lov(test_param[:survey_question])
end

#Magazine Ad
#Radio/Podcast/Streaming Audio
#Television Commercial
#Telephone Call
#Web Search
#Web Banner
#Trade show/convention
#Recommended by USPS
#Recommended by Friend
#Other
#Newspaper Ad
#Received Mailer
#Received Mailer
#Email from Stamps.com
# Already used in office
Then /^[Ss]et [Pp]rofile [Pp]age Referer Name to (.*)$/ do |str|
  test_param[:referer_name] = str
  test_param[:survey_question_selected] = registration.profile.referer_name.select_from_lov(test_param[:referer_name])
end

Then /^[Ss]et [Pp]rofile [Pp]age [Pp]romo [Cc]ode to (.*)$/ do |str|
  test_param[:promo_code] = str
  registration.profile.promo_code.show_promo_code.set(test_param[:promo_code])
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Pp]romo [Cc]ode is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:promo_code]:str
  expect(registration.profile.promo_code.show_promo_code.text).to eql(str)
end

Then /^check [Pp]rofile [Pp]age [Mm]oney-saving offers and new products$/ do
  registration.profile.side_content.money_saving_offers.checkbox.check
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Mm]oney-saving offers and new products is checked$/ do
  expect(registration.profile.side_content.money_saving_offers.checkbox).to be_checked, "Profile Money-saving offers and new products is not checked. Got checked"
end

Then /^uncheck [Pp]rofile [Pp]age [Mm]oney-saving offers and new products$/ do
  registration.profile.side_content.money_saving_offers.checkbox.uncheck
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Mm]oney-saving offers and new products is unchecked$/ do
  expect(registration.profile.side_content.money_saving_offers.checkbox).not_to be_checked, "Expected Profile Money-saving offers and new products is checked. Got unchecked"
end

Then /^[Cc]ontinue to [Mm]embership page$/ do
  registration.profile.continue
end

Then /^[Ss]et [Mm]embership [Ff]irst [Ff]ame to (?:random value|(.*))$/ do |str|
  test_param[:first_name] = (str.nil?)?(helper.random_alpha_capitalize(2, 8)):str
  registration.membership.first_name(test_param[:first_name])
end

Then /^[Ss]et [Mm]embership [Ll]ast [Ff]ame to (?:random value|(.*))$/ do |str|
  test_param[:last_name] = (str.nil?)?(helper.random_alpha_capitalize(3, 10)):str
  registration.membership.last_name(test_param[:last_name])
end














# legacy

Then /^select [Pp]rofile [Pp]age Security Question 1 (.*)$/ do |str|

end

Then /^[Oo]n [Pp]rofile [Pp]age, Continue$/ do
  registration.profile.continue.click
end

Then /^[Oo]n [Pp]rofile [Pp]age, continue to Mailing Information page$/ do
  10.times do
    registration.profile.continue.click
    sleep(0.35)
    break if registration.profile.membership.present?
  end
  expect("Unable to continue....").to eql "Mailing Information page Did not load." unless registration.profile.membership.present?
end

Then /^Registration Choose Supplies: Place Order$/ do
  expect(@registration_result).to be_truthy
  case @registration_result
    when Registration::UserIdTaken
      message = @registration_result.message
      raise "USER ID IS TAKEN!  #{message}"
    when Registration::ChooseSupplies
      if @registration_result.present?
        @web_mail = @registration_result.place_order
      end
    else
      raise "Unable to Place Order. Supplies page did not load"
  end
end

Then /^Registration Result: Wait for Download Page or Webpostage page to load$/ do
  case @registration_result_page
    when MailLandingPage
      @registration_result_page.wait_until_url_loads
    when Registration::DownloadPage
      @web_mail.landing_page.wait_until_present 10
    else
      #do nothing
  end
end


Then(/^Clear Email Field$/) do
  registration.profile.email.clear
end

Then(/^Clear User ID Field$/) do
  registration.profile.user_id.clear
end

Then(/^Clear How will you use Stamps\.com\?$/) do
  registration.profile.survey_question.clear
end

Then(/^Clear 1st Question$/) do
  registration.profile.secret_questions.secret_question_1.clear
end

Then(/^Clear 2nd Question$/) do
  registration.profile.secret_questions.secret_question_2.clear
end
