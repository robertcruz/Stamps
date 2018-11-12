# encoding: utf-8

Then /^set print form serial number to (.*)$/ do |str|
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
  SdcMail.print_form.serial_number.set(serial)
end

Then /^[Ss]et Print form Amount to (\d*.?\d+)$/ do |value|
  TestData.hash[:stamp_amount] = value
  SdcMail.print_form.amt_text_field.set(TestData.hash[:stamp_amount])
end

Then /^[Ss]et Print form Quantity to (\d+)$/ do |value|
  TestData.hash[:quantity] = value
  SdcMail.print_form.qty_text_field.set(TestData.hash[:quantity])
end


Then /^[Ee]xpect Print form Domestic Address field displays last printed contact$/ do
  pending
  ## 20.times do
  #   stamps.mail.print_form.mail_to.blur_out  #blurs out domestic address field to make sure it can be read correctly
  #   sleep(0.5);
  #   stamps.mail.print_form.mail_to.blur_out
  #   sleep(0.5);
  #   reformatted_address = (stamps.mail.print_form.mail_to.dom_mail_address.textarea.text).gsub(/ \n/,"\n").gsub(",","")  #remove commas and unnecessary spaces from address that appears iin domestic address field
  #   uncleansed_address = reformatted_address.slice(0..-6) #remove last 4 digits from zip code
  #   break if uncleansed_address == TestData.hash[:address].gsub(/ \n/, "\n")  #compare reformatted address from domestic address field to the last address used for printing postage
  # end
  # reformatted_address = (stamps.mail.print_form.mail_to.dom_mail_address.textarea.text).gsub(/ \n/,"\n").gsub(",","")
  # uncleansed_address = reformatted_address.slice(0..-6)
  # expect(uncleansed_address).to eql TestData.hash[:address].gsub(/ \n/, "\n")
  # SdcLogger.debug 'Address Match Confirmed'
end

Then /^[Ee]xpect Print form Domestic Address field displays (.*)$/ do |value|
  step 'blur out on print form'
  expect((SdcMail.print_form.mail_to.text_area.text_value).gsub(/ \n/,", ").gsub(/\n/,", ")).to eql value
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect Print form Domestic Address field is empty$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.mail_address.textarea.text).to eql("")
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect [Pp]rint [Ff]orm [Pp]ounds [Ff]ield is (\d+)$/ do |weight_lb|
  pending
  #expect(stamps.mail.print_form.weight.pounds.text).to eql(weight_lb), "Pound field isn't equal to #{weight_lb}"
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect [Pp]rint [Ff]orm [Oo]unces [Ff]ield is (\d+)$/ do |weight_oz|
  pending
  #expect(stamps.mail.print_form.weight.ounces.text).to eql(weight_oz), "Ounces field isn't equal to #{weight_oz}"
end

#AB_ORDERSAUTO_3516
Then /^[Cc]lick [Rr]eset [Bb]utton$/ do
  pending
  # # step 'expect print form Toolbar Menu Reset Button is present'
  # toolbar.reset.click
end

#AB_ORDERSAUTO_3516
Then /^[Cc]lick Mail toolbar menu reset button$/ do
  pending
  #stamps.mail.toolbar_menu.reset_fields.click
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect mail fields are reset$/ do
  step "expect Print form Domestic Address field is empty"
  step "expect print form pounds is 0"
  step "expect print form ounces is 0"
  step "expect Print form service is empty"
end


Then /^select print form calculate postage amount$/ do
  advanced_options = SdcMail.print_form.advanced_options
  advanced_options.calculate_postage_amount.check
  expect(advanced_options.calculate_postage_amount.checked?).to be_truthy
end

Then /^select print form specify postage amount$/ do
  step 'show advanced options'
  SdcMail.print_form.advanced_options.specify_postage_amount.select
  expect(SdcMail.print_form.advanced_options.specify_postage_amount.selected?).to be_truthy
end

Then /^set print form stamp amount to ([\d.]+)$/ do |value|
  step 'show advanced options'
  SdcMail.print_form.stamp_amount.set(value)
  expect(SdcMail.print_form.stamp_amount.text_value.to_f).to eql(value.to_f)
end

Then /^set print form stamp quantity to (\d+)$/ do |value|
  SdcMail.print_form.quantity.set(value)
  step "expect print form stamp quantity is #{value}"
end

Then /^increment print form stamp quantity by (\d+)$/ do |value|
  old_quantity = SdcMail.print_form.quantity.text_value
  value.times do SdcMail.print_form.quantity.increment.click end
  step "expect print form stamp quantity is #{old_quantity.to_i + value.to_i}"
end

Then /^decrement print form stamp quantity by (\d+)$/ do |value|
  old_quantity = SdcMail.print_form.quantity.text_value
  value.times do SdcMail.print_form.quantity.decrement.click end
  step "expect print form stamp quantity is #{old_quantity.to_i - value.to_i}"
end

Then /^expect print form stamp quantity is (\d+)$/ do |value|
  expect(SdcMail.print_form.quantity.text_value.to_i).to eql(value.to_i)
end


Then /^check print form print all$/ do
  SdcMail.print_form.print_all.check
  expect(SdcMail.print_form.print_all.checked?).to be_truthy
end

Then /^uncheck print form print all$/ do
  SdcMail.print_form.print_all.uncheck
  expect(SdcMail.print_form.print_all.checked?).to be_falsey
end