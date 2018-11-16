
Then /^an automotive enthusiast has accessed the microsite$/ do
  step 'Start test driver'
end

Then /^the enthusiast asks to see views of the car$/ do
  SeaGull.visit
end

Then /^he is shown all the available photographs$/ do
  SeaGull.car.back.wait_until_present(timeout: 10)
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