
Then /^expect ship-to country on mail is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:country]
  mail_to = SdcMail::SdcPrintForm::MailToContainer::MailTo.new
  actual_value = mail_to.dom_text_field
  expect(actual_value.text_value.to_s).to eql(str.to_s)
end

Then /^expect ship-to address on mail is (?:correct|(.*))$/ do |str|
  full_name ||= TestData.hash[:full_name]
  company ||= TestData.hash[:company]
  street_address ||= TestData.hash[:street_address]
  city ||= TestData.hash[:city]
  state ||= TestData.hash[:state]
  us_states = data_for(:us_states, {})
  state_abbver = us_states.key(state)
  postal_code ||= TestData.hash[:postal_code]
  address = "#{full_name}\n#{company}\n#{street_address}\n#{city}, #{state_abbver} #{postal_code}"
  mail_to = SdcMail::SdcPrintForm::MailToContainer::MailTo.new
  actual_value = mail_to.text_area
  expect(actual_value.text_value.to_s).to eql(address.to_s)
end

Then /^expect email on mail is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:email]
  email_obj = SdcMail::SdcPrintForm::EmailTrackingContainer::EmailTracking.new
  actual_value = email_obj.text_field
  expect(actual_value.text_value.to_s).to eql(str.to_s)
end

Then /^expect reference # on mail is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:reference_number]
  advanced_options = SdcMail::SdcPrintForm::AdvancedOptionsContainer::AdvancedOptions.new
  actual_value = advanced_options.reference_num
  expect(actual_value.text_value.to_s).to eql(str.to_s)
end

Then /^expect cost code on mail is (?:correct|(.*))$/ do |str|
  temp ||= TestData.hash[:cost_code]
  if temp.eql? ""
    str = "None"
  else
    str ||= TestData.hash[:cost_code]
  end

  advanced_options = SdcMail::SdcPrintForm::AdvancedOptionsContainer::AdvancedOptionsCostCode.new
  actual_value = advanced_options.text_field
  expect(actual_value.text_value.to_s).to eql(str.to_s)
end

Then /^fetch value of mail-to address$/ do
  sleep(10)
  mail_to = SdcMail::SdcPrintForm::MailToContainer::MailTo.new
  mail_to.text_area.safe_wait_until_present(timeout:30)
  TestData.hash[:mail_to_domestic_address] = mail_to.text_area.text_value
  p TestData.hash[:mail_to_domestic_address]
end


Then /^expect contact address value after address cleansing is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:mail_to_domestic_address]
  addr = str.split("\n")
  word_count = addr.length
  full_name	=	addr[0]
  #company
  company	=	addr[1]
  #street_address
  street_address	=	addr[2]
  #city
  city_state = addr[3].split(',')
  city = city_state[0]
  #state
  temp_state = city_state[1].split(' ')
  us_states = data_for(:us_states, {})
  state = us_states[temp_state[0]]
  #postal_code
  postal_code = temp_state[1]

  step "expect value of Name in contact details panel is #{full_name}"
  step "expect value of Company in contact details panel is #{company}"
  step "expect value of Street Address in contact details panel is #{street_address}"
  step "expect value of City in contact details panel is #{city}"
  step "expect value of State/Prv in contact details panel is #{state}"
  step "expect value of Postal Code in contact details panel is #{postal_code}"
end