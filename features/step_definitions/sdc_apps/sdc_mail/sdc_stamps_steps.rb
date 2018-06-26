Then /^[Ss]et Print form Serial Number to (.*)$/ do |str|
  if str.include?('random')
    serial = case str.upcase
               when /A/
                 "A#{Random.rand(10000..99999)}"
               when /B/
                 "B#{Random.rand(10000..99999)}"
               when /C/
                 "c#{Random.rand(10000..99999)}"
               when /D/
                 "D#{Random.rand(10000..99999)}"
               when /K/
                 "K#{Random.rand(10000..99999)}"
               when /L/
                 "L#{Random.rand(10000..99999)}"
               when /ML/
                 "ML#{Random.rand(10000..99999)}"
               when /P/
                 "P#{Random.rand(10000..99999)}"
               when /R/
                 "R#{Random.rand(10000..99999)}"
               when /S/
                 "S#{Random.rand(10000..99999)}"
               when /V/
                 "V#{Random.rand(10000..99999)}"
               when /WN/
                 "WN#{Random.rand(10000..99999)}"
               else
                 raise ArgumentError, "#{str} is not a valid Stamps serial number."
             end
  else
    serial = str
  end
  stamps.mail.print_form.serial_number.set(serial)
end

Then /^[Ss]et Print form Amount to (\d*.?\d+)$/ do |value|
  TestData.hash[:stamp_amount] = value
  stamps.mail.print_form.stamp_amount.set(TestData.hash[:stamp_amount])
end

Then /^[Ss]et Print form Quantity to (\d+)$/ do |value|
  TestData.hash[:quantity] = value
  stamps.mail.print_form.quantity.set(TestData.hash[:quantity])
end


Then /^[Ee]xpect Print form Domestic Address field displays last printed contact$/ do
  20.times do
    stamps.mail.print_form.mail_to.blur_out  #blurs out domestic address field to make sure it can be read correctly
    sleep(0.5);
    stamps.mail.print_form.mail_to.blur_out
    sleep(0.5);
    reformatted_address = (stamps.mail.print_form.mail_to.dom_mail_address.textarea.text).gsub(/ \n/,"\n").gsub(",","")  #remove commas and unnecessary spaces from address that appears iin domestic address field
    uncleansed_address = reformatted_address.slice(0..-6) #remove last 4 digits from zip code
    break if uncleansed_address == TestData.hash[:address].gsub(/ \n/, "\n")  #compare reformatted address from domestic address field to the last address used for printing postage
  end
  reformatted_address = (stamps.mail.print_form.mail_to.dom_mail_address.textarea.text).gsub(/ \n/,"\n").gsub(",","")
  uncleansed_address = reformatted_address.slice(0..-6)
  expect(uncleansed_address).to eql TestData.hash[:address].gsub(/ \n/, "\n")
  SdcLogger.debug 'Address Match Confirmed'
end

Then /^[Ee]xpect Print form Domestic Address field displays (.*)$/ do |value|
  20.times do
    stamps.mail.print_form.mail_to.blur_out
    stamps.mail.print_form.mail_to.blur_out
    sleep(0.5);
    stamps.mail.print_form.mail_to.blur_out
    stamps.mail.print_form.mail_to.blur_out
    break if (stamps.mail.print_form.mail_to.mail_address.textarea.text).gsub(/ \n/,", ").gsub(/\n/,", ") == value
  end
  expect((stamps.mail.print_form.mail_to.mail_address.textarea.text).gsub(/ \n/,", ").gsub(/\n/,", ")).to eql value
  SdcLogger.debug 'Address Cleansed -- Expected Result Confirmed'
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect Print form Domestic Address field is empty$/ do
  expect(stamps.mail.print_form.mail_to.mail_address.textarea.text).to eql("")
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect [Pp]rint [Ff]orm [Pp]ounds [Ff]ield is (\d+)$/ do |weight_lb|
  expect(stamps.mail.print_form.weight.pounds.text).to eql(weight_lb), "Pound field isn't equal to #{weight_lb}"
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect [Pp]rint [Ff]orm [Oo]unces [Ff]ield is (\d+)$/ do |weight_oz|
  expect(stamps.mail.print_form.weight.ounces.text).to eql(weight_oz), "Ounces field isn't equal to #{weight_oz}"
end

#AB_ORDERSAUTO_3516
Then /^[Cc]lick [Rr]eset [Bb]utton$/ do
  step 'expect print form Toolbar Menu Reset Button is present'
  toolbar.reset.click
end

#AB_ORDERSAUTO_3516
Then /^[Cc]lick Mail toolbar menu reset button$/ do
  stamps.mail.toolbar_menu.reset_fields.click
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect mail fields are reset$/ do
  step "expect Print form Domestic Address field is empty"
  step "expect Print form Pounds Field is 0"
  step "expect Print form Ounces Field is 0"
  step "expect Print form service is empty"
end