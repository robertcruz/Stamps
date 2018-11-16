
Then /^an automotive enthusiast has accessed the microsite$/ do
  step 'Start test driver'
end

Then /^the enthusiast asks to see views of the car$/ do
  SeaGull.visit
end

Then /^he is shown all the available photographs$/ do
  # SeaGull.car.back.wait_until_present(timeout: 10)
  # expect(SeaGull.car.back.present?).to be true
  # expect(SeaGull.car.side_closed.present?).to be true
  # expect(SeaGull.car.front_above.present?).to be true
  # expect(SeaGull.car.left_rear.present?).to be true
end
