
Then /^Open Settings Modal$/ do
  logger.info "Open Settings Modal"
  @general_settings = web_apps.orders.toolbar.settings.general_settings
end
# Services checkbox
Then /^Settings: Check Services$/ do
  step "Open Settings Modal" if @general_settings.nil?

  @general_settings.services.check
  logger.info "Show unavailable service #{(@general_settings.services.checked?)?"checked":"unchecked"}"
end

Then /^Settings:  Uncheck Services$/ do
  step "Open Settings Modal" if @general_settings.nil?

  @general_settings.services.uncheck
  logger.info "Show unavailable service #{(@general_settings.services.checked?)?"checked":"unchecked"}"
end

# Services checkbox
Then /^Settings: Check Print Confirm$/ do
  step "Open Settings Modal" if @general_settings.nil?

  @general_settings.print_confirm.check
  logger.info "Settings: Check Print Confirm #{(@general_settings.print_confirm.checked?)?"checked":"unchecked"}"
end

Then /^Settings: Uncheck Print Confirm$/ do
  step "Open Settings Modal" if @general_settings.nil?

  @general_settings.print_confirm.uncheck
  logger.info "Settings: Uncheck Print Confirm #{(@general_settings.print_confirm.checked?)?"checked":"unchecked"}"
end

# Contacts$ checkbox
Then /^Settings: Check Contacts$/ do
  step "Open Settings Modal" if @general_settings.nil?

  @general_settings.contacts.check
  logger.info "Settings: Check Contacts$ #{(@general_settings.contacts.checked?)?"checked":"unchecked"}"
end

Then /^Settings: Uncheck Contacts$/ do
  step "Open Settings Modal" if @general_settings.nil?

  @general_settings.contacts.uncheck
  logger.info "Settings: Uncheck Contacts$ #{(@general_settings.contacts.checked?)?"checked":"unchecked"}"
end

# Shipments checkbox
Then /^Settings: Check Shipments$/ do
  step "Open Settings Modal" if @general_settings.nil?

  @general_settings.shipments.check
  logger.info "Settings: Check Shipments #{(@general_settings.shipments.checked?)?"checked":"unchecked"}"
end

Then /^Settings: Uncheck Shipments$/ do
  step "Open Settings Modal" if @general_settings.nil?

  @general_settings.shipments.uncheck
  logger.info "Settings: Uncheck Shipments #{(@general_settings.shipments.checked?)?"checked":"unchecked"}"
end

# USPS Terms checkbox
Then /^Settings: Check USPS Terms$/ do
  step "Open Settings Modal" if @general_settings.nil?

  @general_settings.usps_terms.check
  logger.info "Settings: Check USPS Terms #{(@general_settings.usps_terms.checked?)?"checked":"unchecked"}"
end

Then /^Settings: Uncheck USPS Terms$/ do
  step "Open Settings Modal" if @general_settings.nil?

  @general_settings.usps_terms.uncheck
  logger.info "Settings: Uncheck USPS Terms #{(@general_settings.usps_terms.checked?)?"checked":"unchecked"}"
end

# Set Logoff

Then /^Settings:  Set Logoff to 5 min.$/ do
  step "Settings:  Logoff set 5 min"
end

Then /^Settings:  Set Logoff to 10 min.$/ do
  step "Settings:  Logoff set 10 min"
end

Then /^Settings:  Set Logoff to 15 min.$/ do
  step "Settings:  Logoff set 15 min"
end

Then /^Settings:  Set Logoff to 30 min.$/ do
  step "Settings:  Logoff set 30 min"
end

Then /^Settings:  Set Logoff to 1 hour.$/ do
  step "Settings:  Logoff set 1 hour"
end

Then /^Settings:  Set Logoff to 2 hours.$/ do
  step "Settings:  Logoff set 2 hours"
end

Then /^Settings:  Logoff set (.*)$/ do |logoff|
  step "Open Settings Modal" if @general_settings.nil?
  case logoff.downcase
    when "5 min"
      @general_settings.log_off.five_min
    when "10 min"
      @general_settings.log_off.ten_min
    when "15 min"
      @general_settings.log_off.fifteen_min
    when "30 min"
      @general_settings.log_off.thirty_min
    when "1 hour"
      @general_settings.log_off.one_hour
    when "2 hours"
      @general_settings.log_off.two_hours
    else
      logger.info "Teardown: Begin tearing down test"
      TestHelper.teardown
      logger.info "Teardown: Done!"
      raise "Invalid Logoff Selection -  Settings:  Logoff #{logoff}"
  end
  logger.info "Logoff if the application is inactive for #{@general_settings.log_off.text_box.text}"
end

# Set Postdate

Then /^Settings:  Set Postdate to 12:00 a.m.$/ do
  step "Settings:  Postdate Set 12:00 a.m."
end

Then /^Settings:  Set Postdate to 1:00 a.m.$/ do
  step "Settings:  Postdate Set 1:00 a.m."
end

Then /^Settings:  Set Postdate to 2:00 a.m.$/ do
  step "Settings:  Postdate Set 2:00 a.m."
end

Then /^Settings:  Set Postdate to 3:00 a.m.$/ do
  step "Settings:  Postdate Set 3:00 a.m."
end

Then /^Settings:  Set Postdate to 4:00 a.m.$/ do
  step "Settings:  Postdate Set 4:00 a.m."
end

Then /^Settings:  Set Postdate to 5:00 a.m.$/ do
  step "Settings:  Postdate Set 5:00 a.m."
end

Then /^Settings:  Set Postdate to 6:00 a.m.$/ do
  step "Settings:  Postdate Set 6:00 a.m."
end

Then /^Settings:  Set Postdate to 7:00 a.m.$/ do
  step "Settings:  Postdate Set 7:00 a.m."
end

Then /^Settings:  Set Postdate to 8:00 a.m.$/ do
  step "Settings:  Postdate Set 8:00 a.m."
end

Then /^Settings:  Set Postdate to 9:00 a.m.$/ do
  step "Settings:  Postdate Set 9:00 a.m."
end

Then /^Settings:  Set Postdate to 10:00 a.m.$/ do
  step "Settings:  Postdate Set 10:00 a.m."
end

Then /^Settings:  Set Postdate to 11:00 a.m.$/ do
  step "Settings:  Postdate Set 11:00 a.m."
end

Then /^Settings:  Set Postdate to 12:00 p.m.$/ do
  step "Settings:  Postdate Set 12:00 p.m."
end

Then /^Settings:  Set Postdate to 1:00 p.m.$/ do
  step "Settings:  Postdate Set 1:00 p.m."
end

Then /^Settings:  Set Postdate to 2:00 p.m.$/ do
  step "Settings:  Postdate Set 2:00 p.m."
end

Then /^Settings:  Set Postdate to 3:00 p.m.$/ do
  step "Settings:  Postdate Set 3:00 p.m."
end

Then /^Settings:  Set Postdate to 4:00 p.m.$/ do
  step "Settings:  Postdate Set 4:00 p.m."
end

Then /^Settings:  Set Postdate to 5:00 p.m.$/ do
  step "Settings:  Postdate Set 5:00 p.m."
end

Then /^Settings:  Set Postdate to 6:00 p.m.$/ do
  step "Settings:  Postdate Set 6:00 p.m."
end

Then /^Settings:  Set Postdate to 7:00 p.m.$/ do
  step "Settings:  Postdate Set 7:00 p.m."
end

Then /^Settings:  Set Postdate to 8:00 p.m.$/ do
  step "Settings:  Postdate Set 8:00 p.m."
end

Then /^Settings:  Set Postdate to 9:00 p.m.$/ do
  step "Settings:  Postdate Set 9:00 p.m."
end

Then /^Settings:  Set Postdate to 10:00 p.m.$/ do
  step "Settings:  Postdate Set 10:00 p.m."
end

Then /^Settings:  Set Postdate to 11:00 p.m.$/ do
  step "Settings:  Postdate Set 11:00 p.m."
end

Then /^Settings:  Postdate Set (.*)$/ do |postdate|
  step "Open Settings Modal" if @general_settings.nil?

  case postdate.downcase
    when "12:00 a.m."
      @general_settings.post_date.twelve_am
    when "1:00 a.m."
      @general_settings.post_date.one_am
    when "2:00 a.m."
      @general_settings.post_date.two_am
    when "3:00 a.m."
      @general_settings.post_date.three_am
    when "4:00 a.m."
      @general_settings.post_date.four_am
    when "5:00 a.m."
      @general_settings.post_date.five_am
    when "6:00 a.m."
      @general_settings.post_date.six_am
    when "7:00 a.m."
      @general_settings.post_date.seven_am
    when "8:00 a.m."
      @general_settings.post_date.eight_am
    when "9:00 a.m."
      @general_settings.post_date.nine_am
    when "10:00 a.m."
      @general_settings.post_date.ten_am
    when "11:00 a.m."
      @general_settings.post_date.eleven_am
    when "12:00 p.m."
      @general_settings.post_date.twelve_pm
    when "1:00 p.m."
      @general_settings.post_date.one_pm
    when "2:00 p.m."
      @general_settings.post_date.two_pm
    when "3:00 p.m."
      @general_settings.post_date.three_pm
    when "4:00 p.m."
      @general_settings.post_date.four_pm
    when "5:00 p.m."
      @general_settings.post_date.five_pm
    when "6:00 p.m."
      @general_settings.post_date.six_pm
    when "7:00 p.m."
      @general_settings.post_date.seven_pm
    when "8:00 p.m."
      @general_settings.post_date.eight_pm
    when "9:00 p.m."
      @general_settings.post_date.nine_pm
    when "10:00 p.m."
      @general_settings.post_date.ten_pm
    when "11:00 p.m."
      @general_settings.post_date.eleven_pm
    else
      logger.info "Teardown: Begin tearing down test"
      TestHelper.teardown
      logger.info "Teardown: Done!"
      raise "Invalid Postdate Selection -  Settings:  Postdate #{postdate}"
  end
  logger.info "Postdate mail to next day after #{@general_settings.log_off.text_box.text}"
end

# Postage Balance

Then /^Settings:  Set Postage Balance to 0$/ do
  step 'Settings:  Postage Balance Set 0'
end

Then /^Settings:  Set Postage Balance to 10$/ do
  step 'Settings:  Postage Balance Set 10'
end

Then /^Settings:  Set Postage Balance to 25$/ do
  step 'Settings:  Postage Balance Set 25'
end

Then /^Settings:  Set Postage Balance to 50$/ do
  step 'Settings:  Postage Balance Set 50'
end


Then /^Settings:  Set Postage Balance to 100$/ do
  step 'Settings:  Postage Balance Set 100'
end


Then /^Settings:  Set Postage Balance to 250$/ do
  step 'Settings:  Postage Balance Set 250'
end


Then /^Settings:  Set Postage Balance to 500$/ do
  step 'Settings:  Postage Balance Set 500'
end


Then /^Settings:  Postage Balance Set (.*)$/ do |postage_balance|
  step "Open Settings Modal" if @general_settings.nil?

  case postage_balance.downcase
    when "0"
      @general_settings.postage_balance.zero
    when "10"
      @general_settings.postage_balance.ten
    when "25"
      @general_settings.postage_balance.twenty_five
    when "50"
      @general_settings.postage_balance.fifty
    when "100"
      @general_settings.postage_balance.one_hundred
    when "250"
      @general_settings.postage_balance.two_hundred_fifty
    when "500"
      @general_settings.postage_balance.five_hundred
    else
      logger.info "Teardown: Begin tearing down test"
      TestHelper.teardown
      logger.info "Teardown: Done!"
      raise "Invalid Postage Balance Selection -  Settings:  Postage Balance #{postage_balance}"
  end
  logger.info "Notify me when print balance drops below #{@general_settings.log_off.text_box.text}"
end






# Expectations
#  Services
Then /^Settings:  Expect Services Checked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Expect Settings - Show unavailable service Checked"
  logger.info "Test #{(@general_settings.services.checked?)?"Passed":"Failed"}"
  @general_settings.services.checked?.should be true
end

Then /^Settings:  Expect Services Unchecked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Expect Settings - Show unavailable service Unchecked"
  logger.info "Test #{(@general_settings.services.checked?)?"Passed":"Failed"}"
  @general_settings.services.checked?.should be false
end

#  Print Confirm
Then /^Settings:  Expect Print Confirm Checked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Expect Print Confirm Checked"
  logger.info "Test #{(@general_settings.print_confirm.checked?)?"Passed":"Failed"}"
  @general_settings.print_confirm.checked?.should be true
end

Then /^Settings:  Expect Print Confirm Unchecked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Expect Print Confirm Unchecked"
  logger.info "Test #{(@general_settings.print_confirm.checked?)?"Passed":"Failed"}"
  @general_settings.print_confirm.checked?.should be false
end

#  Print Confirm
Then /^Settings:  Expect USPS Terms Checked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Expect USPS Terms Checked"
  logger.info "Test #{(@general_settings.usps_terms.checked?)?"Passed":"Failed"}"
  @general_settings.usps_terms.checked?.should be true
end

Then /^Settings:  Expect USPS Terms Unchecked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Expect USPS Terms Unchecked"
  logger.info "Test #{(@general_settings.usps_terms.checked?)?"Passed":"Failed"}"
  @general_settings.usps_terms.checked?.should be false
end

#  Contacts
Then /^Settings:  Expect Contacts Checked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Expect Contacts Checked"
  logger.info "Test #{(@general_settings.contacts.checked?)?"Passed":"Failed"}"
  @general_settings.contacts.checked?.should be true
end

Then /^Settings:  Expect Contacts Unchecked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Expect Contacts Unchecked"
  logger.info "Test #{(@general_settings.contacts.checked?)?"Passed":"Failed"}"
  @general_settings.contacts.checked?.should be false
end

#  Shipments
Then /^Settings:  Expect Shipments Checked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Expect Shipments Checked"
  logger.info "Test #{(@general_settings.shipments.checked?)?"Passed":"Failed"}"
  @general_settings.shipments.checked?.should be true
end

Then /^Settings:  Expect Shipments Unchecked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Expect Shipments Unchecked"
  logger.info "Test #{(@general_settings.shipments.checked?)?"Passed":"Failed"}"
  @general_settings.shipments.checked?.should be false
end

# Logoff
Then /^Settings:  Expect Logoff is set for 5 min.$/ do
  step "Settings:  Expect Logoff to be 5 min."
end

Then /^Settings:  Expect Logoff is set for 10 min.$/ do
  step "Settings:  Expect Logoff to be 10 min."
end

Then /^Settings:  Expect Logoff is set for 15 min.$/ do
  step "Settings:  Expect Logoff to be 15 min."
end

Then /^Settings:  Expect Logoff is set for 30 min.$/ do
  step "Settings:  Expect Logoff to be 30 min."
end

Then /^Settings:  Expect Logoff is set for 1 hour$/ do
  step "Settings:  Expect Logoff to be 1 hour"
end

Then /^Settings:  Expect Logoff is set for 2 hours$/ do
  step "Settings:  Expect Logoff to be 2 hours"
end

Then /^Settings:  Expect Logoff to be (.*)$/ do |expectation|
  step "Open Settings Modal" if @general_settings.nil?

  logger.info "Settings:  Expect Logoff is set for #{expectation}"
  logger.info "Test #{(@general_settings.log_off.text_box.text.include? expectation)?"Passed":"Failed"}"
  @general_settings.log_off.text_box.text.should eql expectation
end

# Postadate
Then /^Settings:  Expect Postdate set to 12:00 a.m.$/ do
  step "Settings:  Expect Postdate to be 12:00 a.m."
end

Then /^Settings:  Expect Postdate set to 1:00 a.m.$/ do
  step "Settings:  Expect Postdate to be 1:00 a.m."
end

Then /^Settings:  Expect Postdate set to 2:00 a.m.$/ do
  step "Settings:  Expect Postdate to be 2:00 a.m."
end

Then /^Settings:  Expect Postdate set to 3:00 a.m.$/ do
  step "Settings:  Expect Postdate to be 3:00 a.m."
end

Then /^Settings:  Expect Postdate set to 4:00 a.m.$/ do
  step "Settings:  Expect Postdate to be 4:00 a.m."
end

Then /^Settings:  Expect Postdate set to 5:00 a.m.$/ do
  step "Settings:  Expect Postdate to be 5:00 a.m."
end

Then /^Settings:  Expect Postdate set to 6:00 a.m.$/ do
  step "Settings:  Expect Postdate to be 6:00 a.m."
end

Then /^Settings:  Expect Postdate set to 7:00 a.m.$/ do
  step "Settings:  Expect Postdate to be 7:00 a.m."
end

Then /^Settings:  Expect Postdate set to 8:00 a.m.$/ do
  step "Settings:  Expect Postdate to be 8:00 a.m."
end

Then /^Settings:  Expect Postdate set to 9:00 a.m.$/ do
  step "Settings:  Expect Postdate to be 9:00 a.m."
end

Then /^Settings:  Expect Postdate set to 10:00 a.m.$/ do
  step "Settings:  Expect Postdate to be 10:00 a.m."
end

Then /^Settings:  Expect Postdate set to 11:00 a.m.$/ do
  step "Settings:  Expect Postdate to be 11:00 a.m."
end

Then /^Settings:  Expect Postdate set to 12:00 p.m.$/ do
  step "Settings:  Expect Postdate to be 12:00 p.m."
end

Then /^Settings:  Expect Postdate set to 1:00 p.m.$/ do
  step "Settings:  Expect Postdate to be 1:00 p.m."
end

Then /^Settings:  Expect Postdate set to 2:00 p.m.$/ do
  step "Settings:  Expect Postdate to be 2:00 p.m."
end

Then /^Settings:  Expect Postdate set to 3:00 p.m.$/ do
  step "Settings:  Expect Postdate to be 3:00 p.m."
end

Then /^Settings:  Expect Postdate set to 4:00 p.m.$/ do
  step "Settings:  Expect Postdate to be 4:00 p.m."
end

Then /^Settings:  Expect Postdate set to 5:00 p.m.$/ do
  step "Settings:  Expect Postdate to be 5:00 p.m."
end

Then /^Settings:  Expect Postdate set to 6:00 p.m.$/ do
  step "Settings:  Expect Postdate to be 6:00 p.m."
end

Then /^Settings:  Expect Postdate set to 7:00 p.m.$/ do
  step "Settings:  Expect Postdate to be 7:00 p.m."
end

Then /^Settings:  Expect Postdate set to 8:00 p.m.$/ do
  step "Settings:  Expect Postdate to be 8:00 p.m."
end

Then /^Settings:  Expect Postdate set to 9:00 p.m.$/ do
  step "Settings:  Expect Postdate to be 9:00 p.m."
end

Then /^Settings:  Expect Postdate set to 10:00 p.m.$/ do
  step "Settings:  Expect Postdate to be 10:00 p.m."
end

Then /^Settings:  Expect Postdate set to 11:00 p.m.$/ do
  step "Settings:  Expect Postdate to be 11:00 p.m."
end

Then /^Settings:  Expect Postdate to be (.*)$/ do |expectation|
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Expect Postdate to be #{expectation}"

  logger.info "Test #{(@general_settings.post_date.text_box.text == expectation)?"Passed":"Failed"}"
  @general_settings.post_date.text_box.text.should eql expectation
end

# Postage Balance
Then /^Settings:  Expect Postage Balance set to 0$/ do
  step "Settings:  Expect Postage Balance to be $0"
end

Then /^Settings:  Expect Postage Balance set to 10$/ do
  step "Settings:  Expect Postage Balance to be $10"
end

Then /^Settings:  Expect Postage Balance set to 25$/ do
  step "Settings:  Expect Postage Balance to be $25"
end

Then /^Settings:  Expect Postage Balance set to 50$/ do
  step "Settings:  Expect Postage Balance to be $50"
end

Then /^Settings:  Expect Postage Balance set to 100$/ do
  step "Settings:  Expect Postage Balance to be $100"
end

Then /^Settings:  Expect Postage Balance set to 250$/ do
  step "Settings:  Expect Postage Balance to be $250"
end

Then /^Settings:  Expect Postage Balance set to 500$/ do
  step "Settings:  Expect Postage Balance to be $500"
end

Then /^Settings:  Expect Postage Balance to be (.*)$/ do |expectation|
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Expect Postage Balance to be $#{expectation}"

  logger.info "Test #{(@general_settings.postage_balance.text_box.text == expectation)?"Passed":"Failed"}"
  @general_settings.postage_balance.text_box.text.should eql expectation
end

# Reset Fields

Then /^Settings:  Open Reset Fields Modal$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Open Reset Fields Modal"

  @reset_fields = @general_settings.reset_fields
end

Then /^Reset Fields:  Check Service$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Service"
  @reset_fields.service.check
end

Then /^Reset Fields:  Uncheck Service$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Service"
  @reset_fields.service.uncheck
end

Then /^Reset Fields:  Expect Service Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Service Checked"

  logger.info "Test #{(@reset_fields.service.checked?)?"Passed":"Failed"}"
  @reset_fields.service.checked?.should be true
end

Then /^Reset Fields:  Expect Service Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Service Unchecked"

  logger.info "Test #{(@reset_fields.service.checked?)?"Failed":"Passed"}"
  @reset_fields.service.checked?.should be false
end

Then /^Reset Fields:  Check Weight$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Weight"
  @reset_fields.weight.checkbox.check
end

Then /^Reset Fields:  Uncheck Weight$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Weight"
  @reset_fields.weight.checkbox.uncheck
end

Then /^Reset Fields:  Expect Weight Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Weight Checked"

  logger.info "Test #{(@reset_fields.weight.checkbox.checked?)?"Passed":"Failed"}"
  @reset_fields.weight.checkbox.checked?.should be true
end

Then /^Reset Fields:  Expect Weight Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Weight Unchecked"

  logger.info "Test #{(@reset_fields.weight.checkbox.checked?)?"Failed":"Passed"}"
  @reset_fields.weight.checkbox.checked?.should be false
end

Then /^Reset Fields:  Check Dimensions$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Weight"
  @reset_fields.dimensions.checkbox.check
end

Then /^Reset Fields:  Uncheck Dimensions$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Weight"
  @reset_fields.dimensions.checkbox.uncheck
end

Then /^Reset Fields:  Expect Dimensions Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Dimensions Checked"

  logger.info "Test #{(@reset_fields.dimensions.checkbox.checked?)?"Passed":"Failed"}"
  @reset_fields.dimensions.checkbox.checked?.should be true
end

Then /^Reset Fields:  Expect Dimensions Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Dimensions Unchecked"

  logger.info "Test #{(@reset_fields.dimensions.checkbox.checked?)?"Failed":"Passed"}"
  @reset_fields.dimensions.checkbox.checked?.should be false
end

Then /^Reset Fields:  Check Ship to Address$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Ship to Address"
  @reset_fields.ship_to_address.check

end

Then /^Reset Fields:  Uncheck Ship to Address$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Ship to Address"
  @reset_fields.ship_to_address.uncheck
end


Then /^Reset Fields:  Expect Ship to Address Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Ship to Address Checked"

  logger.info "Test #{(@reset_fields.ship_to_address.checked?)?"Passed":"Failed"}"
  @reset_fields.ship_to_address.checked?.should be true

end

Then /^Reset Fields:  Expect Ship to Address Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Ship to Address Unchecked"

  logger.info "Test #{(@reset_fields.ship_to_address.checked?)?"Failed":"Passed"}"
  @reset_fields.ship_to_address.checked?.should be false
end

Then /^Reset Fields:  Check Tracking$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Tracking"
  @reset_fields.tracking.check
end

Then /^Reset Fields:  Uncheck Tracking$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Tracking"
  @reset_fields.tracking.uncheck
end

Then /^Reset Fields:  Expect Tracking Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Tracking Checked"

  logger.info "Test #{(@reset_fields.tracking.checked?)?"Passed":"Failed"}"
  @reset_fields.tracking.checked?.should be true

end

Then /^Reset Fields:  Expect Tracking Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Tracking Unchecked"

  logger.info "Test #{(@reset_fields.tracking.checked?)?"Failed":"Passed"}"
  @reset_fields.tracking.checked?.should be false
end

Then /^Reset Fields:  Check Extra Services$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Extra Services"
  @reset_fields.extra_services.check
end

Then /^Reset Fields:  Uncheck Extra Services$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Extra Services"
  @reset_fields.extra_services.uncheck
end

Then /^Reset Fields:  Expect Extra Services Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Extra Services Checked"

  logger.info "Test #{(@reset_fields.extra_services.checked?)?"Passed":"Failed"}"
  @reset_fields.extra_services.checked?.should be true

end

Then /^Reset Fields:  Expect Extra Services Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Extra Services Unchecked"

  logger.info "Test #{(@reset_fields.extra_services.checked?)?"Failed":"Passed"}"
  @reset_fields.extra_services.checked?.should be false
end

Then /^Reset Fields:  Check Insurance$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Insurance"
  @reset_fields.insurance.check
end

Then /^Reset Fields:  Uncheck Insurance$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Insurance"
  @reset_fields.insurance.uncheck
end

Then /^Reset Fields:  Expect Insurance Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Insurance Checked"

  logger.info "Test #{(@reset_fields.insurance.checked?)?"Passed":"Failed"}"
  @reset_fields.insurance.checked?.should be true
end

Then /^Reset Fields:  Expect Insurance Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Insurance Unchecked"

  logger.info "Test #{(@reset_fields.insurance.checked?)?"Failed":"Passed"}"
  @reset_fields.insurance.checked?.should be false
end

Then /^Reset Fields:  Check Reference Numbers$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Reference Number"
  @reset_fields.reference_numbers.check

end

Then /^Reset Fields:  Uncheck Reference Numbers$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Reference Numbers"
  @reset_fields.reference_numbers.uncheck

end

Then /^Reset Fields:  Expect Reference Numbers Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Reference Numbers Checked"

  logger.info "Test #{(@reset_fields.reference_numbers.checked?)?"Passed":"Failed"}"
  @reset_fields.reference_numbers.checked?.should be true

end

Then /^Reset Fields:  Expect Reference Numbers Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Reference Numbers Unchecked"

  logger.info "Test #{(@reset_fields.reference_numbers.checked?)?"Failed":"Passed"}"
  @reset_fields.reference_numbers.checked?.should be false
end

Then /^Reset Fields:  Check Cost Code$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Cost Code"
  @reset_fields.cost_code.check
end

Then /^Reset Fields:  Uncheck Cost Code$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Cost Code"
  @reset_fields.cost_code.uncheck
end

Then /^Reset Fields:  Expect Cost Code Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Cost Code Checked"

  logger.info "Test #{(@reset_fields.insurance.checked?)?"Passed":"Failed"}"
  @reset_fields.cost_code.checked?.should be true
end

Then /^Reset Fields:  Expect Cost Code Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Cost Code Unchecked"

  logger.info "Test #{(@reset_fields.insurance.checked?)?"Failed":"Passed"}"
  @reset_fields.cost_code.checked?.should be false
end

Then /^Reset Fields:  Check Customs$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Customs"
  @reset_fields.customs.check
end

Then /^Reset Fields:  Uncheck Customs$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Customs"
  @reset_fields.customs.uncheck
end

Then /^Reset Fields:  Expect Customs Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Customs Checked"

  logger.info "Test #{(@reset_fields.customs.checked?)?"Passed":"Failed"}"
  @reset_fields.customs.checked?.should be true
end

Then /^Reset Fields:  Expect Customs Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Customs Unchecked"

  logger.info "Test #{(@reset_fields.customs.checked?)?"Failed":"Passed"}"
  @reset_fields.customs.checked?.should be false
end

Then /^Reset Fields:  Check Quantity$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Quantity"
  @reset_fields.quantity.check
end

Then /^Reset Fields:  Uncheck Quantity$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Quantity"
  @reset_fields.quantity.uncheck
end

Then /^Reset Fields:  Expect Quantity Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Quantity Checked"

  logger.info "Test #{(@reset_fields.quantity.checked?)?"Passed":"Failed"}"
  @reset_fields.quantity.checked?.should be true
end

Then /^Reset Fields:  Expect Quantity Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Quantity Unchecked"

  logger.info "Test #{(@reset_fields.quantity.checked?)?"Failed":"Passed"}"
  @reset_fields.quantity.checked?.should be false
end

Then /^Reset Fields:  Check Stamps Amount$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Stamps Amount"
  @reset_fields.stamps_amount.check
end

Then /^Reset Fields:  Uncheck Stamps Amount$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Stamps Amount"
  @reset_fields.stamps_amount.uncheck
end

Then /^Reset Fields:  Expect Stamps Amount Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Stamps Amount Checked"

  logger.info "Test #{(@reset_fields.stamps_amount.checked?)?"Passed":"Failed"}"
  @reset_fields.stamps_amount.checked?.should be true
end

Then /^Reset Fields:  Expect Stamps Amount Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Stamps Amount Unchecked"

  logger.info "Test #{(@reset_fields.stamps_amount.checked?)?"Failed":"Passed"}"
  @reset_fields.stamps_amount.checked?.should be false
end

Then /^Reset Fields:  Check Auto-Advance Label Position$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Check Auto-Advance Label Position"
  @reset_fields.auto_advance_label_position.check

end

Then /^Reset Fields:  Uncheck Auto-Advance Label Position$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Uncheck Auto-Advance Label Position"
  @reset_fields.auto_advance_label_position.uncheck

end

Then /^Reset Fields:  Expect Auto-Advance Label Position Checked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Auto-Advance Label Position Checked"

  logger.info "Test #{(@reset_fields.auto_advance_label_position.checked?)?"Passed":"Failed"}"
  @reset_fields.auto_advance_label_position.checked?.should be true
end

Then /^Reset Fields:  Expect Auto-Advance Label Position Unchecked$/ do
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Expect Auto-Advance Label Position Unchecked"

  logger.info "Test #{(@reset_fields.auto_advance_label_position.checked?)?"Failed":"Passed"}"
  @reset_fields.auto_advance_label_position.checked?.should be false
end

Then /^Reset Fields:  Set Weight to (\d+) lbs (\d+) oz$/ do |lbs, oz|
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info "Reset Fields:  Set Weight to #{lbs} lbs #{oz} oz"

  step "Reset Fields:  Check Weight"
  @reset_fields.weight.lbs.set lbs
  @reset_fields.weight.oz.set oz
end

Then /^Reset Fields:  Expect Weight lbs equals (\d+)$/ do |lbs|
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info  "Reset Fields:  Expect Weight lbs equals #{lbs}"

  step "Reset Fields:  Check Weight"
  logger.info "Test #{(@reset_fields.weight.lbs.text_box.text.to_i == lbs.to_i)?"Passed":"Faild"}"
  @reset_fields.weight.lbs.text_box.text.to_i.should eql lbs.to_i
end

Then /^Reset Fields:  Expect Weight oz equals (\d+)$/ do |oz|
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info  "Reset Fields:  Expect Weight oz equals #{oz}"

  step "Reset Fields:  Check Weight"
  logger.info "Test #{(@reset_fields.weight.oz.text_box.text.to_i == oz.to_i)?"Passed":"Faild"}"
  @reset_fields.weight.oz.text_box.text.to_i.should eql oz.to_i
end

Then /^Reset Fields:  Set Dimensions to length (\d+), width (\d+), height (\d+)$/ do |length, width, height|
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info  "Reset Fields:  Set Dimensions to length #{length}, width #{width}, height #{height}"

  step "Reset Fields:  Check Dimensions"
  @reset_fields.dimensions.length.set length
  @reset_fields.dimensions.width.set width
  @reset_fields.dimensions.height.set height
end

Then /^Reset Fields:  Expect Dimensions to length equals (\d+)$/ do |length|
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info  "Reset Fields:  Expect Dimensions to length equals #{length}"

  step "Reset Fields:  Check Dimensions"
  logger.info "Test #{(@reset_fields.dimensions.length.text_box.text.to_i == length.to_i)?"Passed":"Faild"}"
  @reset_fields.dimensions.length.text_box.text.to_i.should eql length.to_i
end

Then /^Reset Fields:  Expect Dimensions to width equals (\d+)$/ do |width|
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info  "Reset Fields:  Expect Dimensions to width equals #{width}"

  step "Reset Fields:  Check Dimensions"
  logger.info "Test #{(@reset_fields.dimensions.width.text_box.text.to_i == width.to_i)?"Passed":"Faild"}"
  @reset_fields.dimensions.width.text_box.text.to_i.should eql width.to_i
end

Then /^Reset Fields:  Expect Dimensions to height equals (\d+)$/ do |height|
  step "Settings:  Open Reset Fields Modal" if @reset_fields.nil?
  logger.info  "Reset Fields:  Expect Dimensions to height equals #{height}"

  step "Reset Fields:  Check Dimensions"
  logger.info "Test #{(@reset_fields.dimensions.height.text_box.text.to_i == height.to_i)?"Passed":"Faild"}"
  @reset_fields.dimensions.height.text_box.text.to_i.should eql height.to_i
end

Then /^Reset Fields:  Close$/ do
  logger.info "Reset Fields:  Close"
  @reset_fields.close
end

Then /^Settings:  Save$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Save"
  @general_settings.save
  logger.info "Settings #{(@general_settings.present?)?"was not saved":"Saved"}"
end

Then /^Settings:  Close$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.info "Settings:  Close"
  @general_settings.close
  logger.info "Settings #{(@general_settings.present?)?"was not closed":"Closed"}"
end





