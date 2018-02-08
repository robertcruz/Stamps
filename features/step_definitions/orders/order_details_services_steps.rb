
Then /^[Ss]et [Oo]rder [Dd]etails [Ss]ervice to (.*)$/ do |str|
  step 'expect Order Details is present'
  test_param[:service] = stamps.orders.order_details.service.select(str).parse_service_name
  expect(test_param[:service]).to eql(str)
  20.times do
    step 'blur out on Order Details form'
    sleep(0.015)
    break if stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2) > 0
  end
  step 'Save Order Details data'
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]ervice is (?:correct|(.*))$/ do |expectation|
  step 'expect Order Details is present'
  expectation='' if expectation.eql?('an empty string')
  expect(stamps.orders.order_details.service.textbox.text.parse_service_name).to eql((expectation.nil?) ? test_param[:service] : expectation)
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]ervice to (.*)$/ do |str|
  step 'expect Order Details is present'
  test_param[:int_service] = stamps.orders.order_details.service.select(str).parse_service_name
  20.times do
    step 'blur out on Order Details form'
    sleep(0.015)
    break if stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2) > 0
  end
  step 'Save Order Details data'
end


Then /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nternational [Ss]ervice is (?:correct|(.*))$/ do |expectation|
  step 'expect Order Details is present'
  expect(stamps.orders.order_details.service.textbox.text.parse_service_name).to eql((expectation.nil?) ? test_param[:int_service] : expectation)
end