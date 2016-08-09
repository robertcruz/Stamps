
Then /^Postage Envelopes: Select Service First-Class Mail Letter$/ do
  step "Postage Envelopes: Set Service to First-Class Mail Letter"
end

Then /^Postage Envelopes: Set Service to (.*)$/ do |service|
  logger.info "Envelopes: Set Print Postage Service to: \n #{service}"
  web_apps.mail.service.select service
end

Then /^Postage Envelopes: Set Include Return Address to Checked$/ do
  logger.info "Postage Shipping Labels: Check Include Return Address"
  web_apps.mail.form_view.include_return_address.check
end

Then /^Postage Envelopes: Set Include Return Address to Unchecked$/ do
  logger.info "Postage Shipping Labels: Uncheck Include Return Address"
  web_apps.mail.form_view.include_return_address.uncheck
end

Then /^Postage Envelopes: Set Include Delivery Address to Checked$/ do
  logger.info "Postage Shipping Labels: Check Include Delivery Address"
  web_apps.mail.form_view.include_delivery_address.check
end

Then /^Postage Envelopes: Set Include Delivery Address to Unchecked$/ do
  logger.info "Postage Shipping Labels: Uncheck Include Delivery Address"
  web_apps.mail.form_view.include_delivery_address.uncheck
end

Then /^Postage Envelopes: Set Include Postage to Checked$/ do
  logger.info "Postage Shipping Labels: Check Include Postage"
  web_apps.mail.form_view.include_postage.check
end

Then /^Postage Envelopes: Set Include Postage to Unchecked$/ do
  logger.info "Postage Shipping Labels: Uncheck Include Postage"
  web_apps.mail.form_view.include_postage.uncheck
end

Then /^Postage Envelopes: Set Reference Number to (.*)/ do |ref_no|
  logger.info "Set Envelope Reference Number to #{ref_no}"
  web_apps.mail.form_view.reference_number.set ref_no
end

Then /^Postage Envelopes: Set Cost Code to (.*)/ do |code|
  logger.info "Postage Envelopes: Set Cost Code to \n #{code}"
  web_apps.mail.form_view.cost_code.select code
end

