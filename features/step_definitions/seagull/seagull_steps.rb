
Then /^an automotive enthusiast has accessed the microsite$/ do
  step 'Start test driver'
  SeaGull.visit
end

Then /^the enthusiast asks to see views of the car$/ do
  SeaGull.visit
end

Then /^he is shown all the available photographs$/ do
  begin
    SeaGull.car.back.wait_until_present(timeout: 5)
  rescue
    # ignore
  end
  expect(SeaGull.car.back.present?).to be true
  expect(SeaGull.car.side_closed.present?).to be true
  expect(SeaGull.car.front_above.present?).to be true
  expect(SeaGull.car.left_rear.present?).to be true
  sleep 2
end

Then /^I need to be able to request an appointment for a test drive at his nearest SEA dealership$/ do
  step "set seagull test drive first name to #{TestHelper.rand_alpha_str}"
  step "set seagull test drive last name to #{TestHelper.rand_alpha_str}"
  step "set seagull test drive email to #{TestHelper.rand_email}"
  step "set seagull test drive phone to #{TestHelper.rand_phone}"
  step 'set seagull test drive zip code to 94102'
  step 'click seagull test drive submit button'
  step "expect ui contains Thanks for contacting us! We will get in touch with you shortly."
end

Then /^expect ui contains (.+)$/ do |str|
  expect(SdcPage.browser.text).to include str
end

Then /^set seagull test drive first name to (.*)$/ do |str|
  SeaGull.car.first_name.wait_until_present(timeout: 4)
  SeaGull.car.first_name.scroll_into_view
  SeaGull.car.first_name.set str
end

Then /^set seagull test drive last name to (.*)$/ do |str|
  SeaGull.car.last_name.set str
end

Then /^set seagull test drive email to (.*)$/ do |str|
  SeaGull.car.email.set str
end

Then /^set seagull test drive phone to (.*)$/ do |str|
  SeaGull.car.phone.set str
end

Then /^set seagull test drive zip code to (.*)$/ do |str|
  SeaGull.car.zip_code.set str
end

Then /^click seagull test drive submit button$/ do
  SeaGull.car.submit.click
  SeaGull.car.submit.wait_while_present(timeout: 5)
  sleep 3
end


When /^the enthusiast enters his contract data to get more information$/ do
  step "set seagull more info first name to #{TestHelper.rand_alpha_str}"
  step "set seagull more info last name to #{TestHelper.rand_alpha_str}"
  step "set seagull more info email to #{TestHelper.rand_email}"
end

Then /^his contract data is stored so that he can receive the additional information he wants$/ do
  step 'expect ui contains Thanks for contacting us! We will get in touch with you shortly.'
end


Then /^set seagull more info first name to (.*)$/ do |str|
  SeaGull.car.more_info.first_name.set str
end

Then /^set seagull more info last name to (.*)$/ do |str|
  SeaGull.car.more_info.last_name.set str
end

Then /^set seagull more info email to (.*)$/ do |str|
  SeaGull.car.more_info.email.set str
end

Then /^click seagull more info submit button$/ do
  SeaGull.car.more_info.submit.click
  #SeaGull.car.submit.more_info.wait_while_present(timeout: 5)
  sleep 3
end


Then /^I need to be able to view photographs of the exterior in available colors and trims \(separate from the interior views\)$/ do
  step "verify seagull section Exterior Images exist"
end

Then /^verify seagull section (.+) exist$/ do |str|
  expect(SeaGull.car.external_images.header.text).to eql str
end

Then /^he is shown a video of the car in motion$/ do
  expect(SeaGull.car.video.present?).to be true
end