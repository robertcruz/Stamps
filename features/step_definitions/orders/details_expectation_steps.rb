
Then /^Details: Expect Ship-From saved value is the same$/ do
  logger.step "Details: Expect Ship-From saved value is the same"
  stamps.orders.details.ship_from.text_box.text.should eql test_data[:ship_from]
end

Then /^Details: Expect Item (\d+) Qty is (\d+)$/ do |item_number, expectation|
  logger.step "^Details: Expect Item #{item_number} Qty is #{expectation}"
  step "Details: Blur out"
  step "Details: Blur out"
  step "Details: Blur out"
  stamps.orders.details.item_grid.item(item_number.to_i).qty.text_box.text.should eql expectation
end

Then /^Details: Expect Item (\d+) ID is (.*)$/ do |item_number, expectation|
  logger.step "^Details: Expect Item #{item_number} ID is #{expectation}"
  step "Details: Blur out"
  step "Details: Blur out"
  step "Details: Blur out"
  stamps.orders.details.item_grid.item(item_number.to_i).id.text.should eql expectation
end

Then /^Details: Expect Item (\d+) Description is (.*)$/ do |item_number, expectation|
  logger.step "^Details: Expect Item #{item_number} ID is #{expectation}"
  step "Details: Blur out"
  step "Details: Blur out"
  step "Details: Blur out"
  stamps.orders.details.item_grid.item(item_number.to_i).description.text.should eql expectation
end

Then /^Details: Expect Item (\d+) Qty Placeholder is (.*)$/ do |item_number, expectation|
  logger.step "Details: Expect Item Qty Placeholder is #{expectation}"
  step "Details: Blur out"
  step "Details: Blur out"
  step "Details: Blur out"
  stamps.orders.details.item_grid.item(item_number.to_i).qty.text_box.placeholder.should eql expectation
end

Then /^Details: Expect Item (\d+) ID Placeholder is (.*)$/ do |item_number, expectation|
  logger.step "Details: Expect Item ID# Placeholder is #{expectation}"
  step "Details: Blur out"
  step "Details: Blur out"
  step "Details: Blur out"
  stamps.orders.details.item_grid.item(item_number.to_i).id.placeholder.should eql expectation
end

Then /^Details: Expect Item (\d+) Description Placeholder is (.*)$/ do |item_number, expectation|
  logger.step "Details: Expect Item Description Placeholder is #{expectation}"
  step "Details: Blur out"
  step "Details: Blur out"
  step "Details: Blur out"
  stamps.orders.details.item_grid.item(item_number.to_i).description.placeholder.should eql expectation
end

Then /^Details: Expect Ship-To Address Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To Address Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.text_area.placeholder.should eql expectation
end

Then /^Details: Expect Ship-To Phone Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To Phone Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.phone.placeholder.should eql expectation
end

Then /^Details: Expect Ship-To Email Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To Email Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.email.placeholder.should eql expectation
end

Then /^Details: Expect Service Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect Service Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.service.text_box.placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Name is (.*)/ do |value|
  logger.step "Details: Expect International Ship-To Name is #{value}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.name.text.should eql value
end

Then /^Details: Expect International Ship-To Company is (.*)/ do |value|
  logger.step "Details: Expect International Ship-To Company is #{value}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.company.text.should eql value
end

Then /^Details: Expect International Ship-To Address 1 is (.*)/ do |value|
  logger.step "Details: Expect International Ship-To Address 1 is #{value}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.address_1.text.should eql value
end

Then /^Details: Expect International Ship-To Address 2 is (.*)/ do |value|
  logger.step "Details: Expect International Ship-To address 2 is #{value}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.address_2.text.should eql value
end

Then /^Details: Expect International Ship-To Province is (.*)/ do |value|
  logger.step "Details: Expect International Ship-To province is #{value}"
  stamps.orders.details.ship_to.international.province.text.should eql value
end

Then /^Details: Expect International Ship-To Postal Code is (.*)/ do |value|
  logger.step "Details: Expect International Ship-To postal code is #{value}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.postal_code.text.should eql value
end

Then /^Details: Expect International Ship-To Phone is (.*)/ do |value|
  logger.step "Details: Expect International Ship-To phone is #{value}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.phone.text.should eql value
end

Then /^Details: Expect International Ship-To Email is (.*)/ do |value|
  logger.step "Details: Expect International Ship-To Email is #{value}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.email.text.should eql value
end

Then /^Details: Expect Ship-To Country is (.*)/ do |value|
  logger.step "Details: Expect Ship-To Country is #{value}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.country.text_box.text.should eql value
end

Then /^Details: Expect International Ship-To City is (.*)/ do |value|
  logger.step "Details: Expect International Ship-To City is #{value}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.city.text.should eql value
end

Then /^Details: Expect International Address fields are visible$/ do
  logger.step "Details: Expect International Address fields are visible"
  stamps.orders.details.ship_to.international.name.present?.should be true
  stamps.orders.details.ship_to.international.company.present?.should be true
  stamps.orders.details.ship_to.international.address_1.present?.should be true
  stamps.orders.details.ship_to.international.address_2.present?.should be true
  stamps.orders.details.ship_to.international.city.present?.should be true
  stamps.orders.details.ship_to.international.province.present?.should be true
  stamps.orders.details.ship_to.international.postal_code.present?.should be true
  stamps.orders.details.ship_to.international.phone.present?.should be true
  stamps.orders.details.ship_to.international.email.present?.should be true
end

Then /^Details: Expect Domestic Ship-To fields are hidden$/ do
  logger.step "Details: Expect Domestic Ship-To fields are hidden"
  step "Details: Blur out"
  stamps.orders.details.ship_to.address.text_area.present?.should be false
end

Then /^Details: Expect Customs Restrictions button is visible/ do
  logger.step "Details: Expect Customs Restrictions button is visible"
  step "Details: Blur out"
  stamps.orders.details.customs.browser_restrictions_button.present?.should be true
  stamps.orders.details.customs.restrictions.ok
end

Then /^Details: Expect Customs Restrictions button is hidden/ do
  logger.step "Details: Expect Customs Restrictions button is hidden"
  step "Details: Blur out"
  stamps.orders.details.customs.browser_restrictions_button.present?.should be false
end

Then /^Details: Expect Customs Edit Form button is visible/ do
  logger.step "Details: Expect Customs Edit Form button is visible"
  step "Details: Blur out"
  stamps.orders.details.customs.browser_edit_form_button.present?.should be true
end

Then /^Details: Expect Customs Edit Form button is hidden/ do
  logger.step "Details: Expect Customs Edit Form button is hidden"
  step "Details: Blur out"
  stamps.orders.details.customs.browser_edit_form_button.present?.should be false
end

Then /^Details: Expect Customs Edit Form button is enabled/ do
  logger.step "Details: Expect Customs Edit Form button is enabled"
  step "Details: Blur out"
  stamps.orders.details.customs.browser_edit_form_button.present?.should be true
end

Then /^Details: Expect Customs Edit Form button is disabled/ do
  logger.step "Details: Expect Customs Edit Form button is disabled"
  step "Details: Blur out"
  stamps.orders.details.customs.browser_edit_form_button.present?.should be false
end

Then /^Details: Expect International Ship-To Name Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To Email Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.name.placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Company Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect International Ship-To Company Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.company.placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Address 1 Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect International Ship-To Company Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.address_1.placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Address 2 Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect International Ship-To Company Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.address_2.placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To City Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect International Ship-To Company Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.city.placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Province Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect International Ship-To Company Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.province.placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Postal Code Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect International Ship-To Company Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.postal_code.placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Phone Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect International Ship-To Company Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.phone.placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Email Placeholder is (.*)$/ do |expectation|
  logger.step "Details: Expect International Ship-To Company Placeholder is #{expectation}"
  step "Details: Blur out"
  stamps.orders.details.ship_to.international.email.placeholder.should eql expectation
end

Then /^Details: Collapse Panel$/ do
  logger.step "Details: Collapse Panel"
  stamps.orders.details.toolbar.menu.collapse
end

Then /^Details: Expect Panel is present$/ do
  logger.step "Details: Expect Panel is present"
  stamps.orders.details.present?.should be true
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  logger.step "Expect \"Exact Address Not Found\" module to appear"
  stamps.orders.details.ship_to.address.ambiguous.address_not_found.window_title.text.should eql "Exact Address Not Found"
end

Then /^Details: Expect Reference Number is (.*)$/ do |expectation|
  reference_no = (expectation.downcase.include? "random") ? test_data[:reference_no] : expectation
  logger.step "Details: Expect Reference Number is #{reference_no}"
  stamps.orders.details.reference_no.text.should eql reference_no
end

Then /^Details: Expect Insure-For is \$(.*)$/ do |expectation|
  logger.step "Details: Set Insure-For to #{expectation}"
  stamps.orders.details.insure_for.checkbox.check
  step "Details: Blur out"
  5.times do
    break if stamps.orders.details.insure_for.text_box.text == expectation
  end
  stamps.orders.details.insure_for.text_box.text.should eql expectation
end

Then /^Details: Expect Insure-For Cost saved value is the same$/ do
  logger.step "Details: Expect Insure-For Cost saved value is the same"
  step "Details: Blur out"
  step "Details: Expect Insure-For Cost is $#{test_data[:insure_for_cost]}"
end

Then /^Details: Expect Insure-For Cost is \$(.*)$/ do |expectation|
  logger.step "Details: Expect Insure-For Cost is #{expectation}"
  step "Details: Blur out"
  5.times do
    break if stamps.orders.details.insure_for.cost == expectation
  end
  stamps.orders.details.insure_for.cost.should eql expectation
end

Then /^Details: Expect Insure-For Cost is greater than \$(.*)$/ do |expectation|
  logger.step "Details: Expect Insure-For Cost is greater than #{expectation}"
  step "Details: Blur out"
  15.times do
    break if stamps.orders.details.insure_for.cost.to_f > expectation.to_f
  end
  stamps.orders.details.insure_for.cost.to_f.should be > expectation.to_f
end

Then /^Details: Expect Service \"(.*)\" is disabled/ do |service|
  logger.step "Details: Expect Service \"#{service}\" is disabled"
  step "Details: Blur out"
  stamps.orders.details.service.disabled?(service).should be true
end

Then /^Details: Expect Service \"(.*)\" is enabled/ do |expectation|
  logger.step "Details: Expect Service \"#{expectation}\" is enabled"
  step "Details: Blur out"
  stamps.orders.details.service.enabled?(expectation).should be true
end

Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  logger.step "Expect Pounds tooltip to display - The maximum value for this field is #{expectation}"
  stamps.orders.details.pounds_max_value.should eql expectation
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  logger.step "Expect Ounces tooltip to display - The maximum value for this field is #{expectation}"
  stamps.orders.details.ounces_max_value.should eql expectation
end

Then /^Details: Expect Service Cost inline price for "([a-zA-Z -\/]+)" is greater than \$([0-9.]*)$/ do |service, expectation|
  logger.step "Details: Expect Service Cost inline price for #{service} is greater than #{expectation}"
  10.times do
    break if stamps.orders.details.service.inline_cost(service).to_f >= expectation.to_f
  end
  stamps.orders.details.service.inline_cost(service).to_f.should be >= expectation.to_f
end

Then /^Details: Expect Service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  logger.step "Details: Expect Service Tooltip for \"#{service}\" to include \"#{tooltip_content}\""
  tooltips = tooltip_content.split "||"
  actual_tooltip = stamps.orders.details.service.tooltip service
  tooltips.each do |tooltip|
    logger.step "Does #{tooltip} exist in tooltip?  #{(actual_tooltip.include? tooltip)?"Yes.":"No."}"
    actual_tooltip.should include tooltip
  end
end

Then /^Details: Expect Service Cost saved value is the same$/ do
  logger.step "Details: Expect Service Cost saved value is the same"
  step "Details: Expect Service Cost is $#{test_data[:service_cost]}"
end

Then /^Details: Expect Service Cost is \$(.*)$/ do |expectation|
  logger.step "Details: Expect Service Cost is $#{expectation}"
  expectation = expectation.to_f
  30.times do
    sleep 1
    break if stamps.orders.details.service.cost.to_f == expectation
  end
  stamps.orders.details.service.cost.to_f.should eql expectation
end

Then /^Details: Expect Service Cost is greater than \$([0-9.]*)$/ do |expectation|
  logger.step "Details: Expect Service Cost is greater than $#{expectation}"
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.details.service.cost.to_f > expectation
  end
  stamps.orders.details.service.cost.to_f.should be > expectation
end

Then /^Details: Expect Tracking Cost saved value is correct$/ do
  logger.step "Details: Expect Tracking Cost saved value is correct"
  step "Details: Expect Tracking Cost is $#{test_data[:tracking_cost]}"
end

Then /^Details: Expect Tracking Cost is \$([0-9.]*)$/ do |expectation|
  logger.step "Details: Expect Tracking Cost is #{expectation}"
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.details.tracking.cost.to_f == expectation
  end
  stamps.orders.details.tracking.cost.to_f.should eql expectation
end

Then /^Details: Expect Tracking Cost is greater than \$([0-9.]*)$/ do |expectation|
  logger.step "Details: Expect Tracking Cost is #{expectation}"
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.details.tracking.cost.to_f > expectation
  end
  stamps.orders.details.tracking.cost.to_f.should be > expectation
end

Then /^Details: Expect Pounds? is (.*)$/ do |expectation|
  logger.step "Details: Expect Pounds is #{expectation}"
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.details.weight.lbs.text_box.text.to_f == expectation
  end
  stamps.orders.details.weight.lbs.text_box.text.to_f.should eql expectation
end

Then /^Details: Expect Ounces? is (.*)$/ do |expectation|
  logger.step "Details: Expect Ounces is  #{expectation}"
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.details.weight.oz.text_box.text.to_f == expectation
  end
  stamps.orders.details.weight.oz.text_box.text.to_f.should eql expectation
end

Then /^Details: Expect Length is (\d+)$/ do |expectation|
  logger.step "Details: Expect Length is #{expectation}"
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.details.dimensions.length.text_box.text.to_f == expectation
  end
  stamps.orders.details.dimensions.length.text_box.text.to_f.should eql expectation
end

Then /^Details: Expect Width is (\d+)$/ do |expectation|
  logger.step "Details: Expect Width is #{expectation}"
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.details.dimensions.width.text_box.text.to_f == expectation
  end
  stamps.orders.details.dimensions.width.text_box.text.to_f.should eql expectation
end

Then /^Details: Expect Height is (\d+)$/ do |expectation|
  logger.step "Details: Expect Height is #{expectation}"
  expectation = expectation.to_i
  text_box = stamps.orders.details.dimensions.height.text_box
  10.times do
    break if text_box.text.to_i == expectation
  end
  text_box.text.to_i.should eql expectation
end

Then /^Details: Expect Tracking is Signature Required$/ do
  step "Details: Expect Tracking is \"Signature Required\""
end

Then /^Details: Expect Tracking is USPS Tracking$/ do
  step "Details: Expect Tracking is \"USPS Tracking\""
end

Then /^Details: Expect Tracking is \"([\w\s]*)\"$/ do |expectation|
  logger.step "Details: Expect Tracking is #{expectation}"
  step "Details: Blur out"
  10.times do
    break if stamps.orders.details.tracking.text_box.text.include? expectation
  end
  stamps.orders.details.tracking.text_box.text.should eql expectation
end

Then /^Details: Expect Total Ship Cost saved value is correct$/ do
  logger.step "Details: Expect Tracking Cost saved value is correct"
  step "Details: Blur out"
  step "Details: Expect Tracking Cost is $#{test_data[:tracking_cost]}"
end

Then /^Details: Expect Total Ship Cost is \$(.*)$/ do |expectation|
  logger.step "Details: Expect Total Ship Cost is $#{expectation}"
  step "Details: Blur out"
  10.times do
    break if stamps.orders.details.footer.total_ship_cost.eql? expectation
  end
  stamps.orders.details.footer.total_ship_cost.should eql expectation
end

And /^Details: Expect Ship-From Textbox is enabled$/ do
  logger.step "Details: Expect Ship-From Textbox is enabled"
  stamps.orders.details.ship_from.text_box.element.visible?.should be true
end

And /^Details: Expect Ship-From drop-down be enabled$/ do
  logger.step "Details: Expect Ship-From drop-down be enabled"
  stamps.orders.details.ship_from.drop_down.element.visible?.should be true
end

And /^Details: Expect Ship-To Textbox is enabled$/ do
  logger.step "Details: Expect Ship-To Textbox is enabled"
  stamps.orders.details.ship_to.address.text_area.element.visible?.should be true
end

And /^Details: Expect Ship-To drop-down is enabled$/ do
  logger.step "Details: Expect Ship-To drop-down is enabled"
  stamps.orders.details.ship_to.country.drop_down.element.visible?.should be true
end

And /^Details: Expect Ship-To text area is enabled$/ do
  logger.step "Details: Expect Ship-To text area is enabled"
  stamps.orders.details.ship_to.address.text_area.element.visible?.should be true
end

And /^Details: Expect Phone Textbox is enabled$/ do
  logger.step "Details: Expect Phone Textbox is enabled"
  stamps.orders.details.ship_to.address.phone.element.visible?.should be true
end

And /^Details: Expect Email Textbox is enabled$/ do
  logger.step "Details: Expect Email Textbox is enabled"
  stamps.orders.details.ship_to.address.email.element.visible?.should be true
end

And /^Details: Expect Pounds Textbox is enabled$/ do
  logger.step "Details: Expect Pounds Textbox is enabled"
  stamps.orders.details.weight.lbs.element.visible?.should be true
end

And /^Details: Expect Ounces Textbox is enabled$/ do
  logger.step "Details: Expect Ounces Textbox is enabled"
  stamps.orders.details.weight.oz.element.visible?.should be true
end

And /^Details: Expect Service Textbox is enabled$/ do
  logger.step "Details: Expect Service Textbox is enabled"
  stamps.orders.details.service.text_box.element.visible?.should be true
end

And /^Details: Expect Service drop-down is enabled$/ do
  logger.step "Details: Expect Service drop-down is enabled"
  stamps.orders.details.service.drop_down.element.visible?.should be true
end

And /^Details: Expect Insure-For Textbox is enabled$/ do
  logger.step "Details: Expect Insure-For Textbox is enabled"
  stamps.orders.details.insure_for.text_box.element.visible?.should be true
end

And /^Details: Expect Insure-For Textbox is disabled$/ do
  logger.step "Details: Expect Insure-For Textbox is enabled"
  stamps.orders.details.insure_for.text_box.element.visible?.should be true
end

And /^Expect Order Detials Form Tracking Textbox is enabled$/ do
  logger.step "Expect Order Detials Form Tracking Textbox is enabled"
  stamps.orders.details.tracking.text_box.element.visible?.should be true
end

And /^Details: Expect Tracking drop-down is enabled$/ do
  logger.step "Details: Expect Tracking drop-down is enabled"
  stamps.orders.details.tracking.drop_down.element.visible?.should be true
end


Then /^Expect (\d+) orders selected$/ do |expectation|
  logger.step "Expect #{expectation} orders selected"
  stamps.orders.multi_web_apps.orders.order_count.should eql expectation
end


