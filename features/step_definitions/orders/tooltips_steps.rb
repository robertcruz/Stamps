
Then /^[Ii]n Orders Toolbar, expect Print Tooltip to include (.*)$/ do |expectation|
  #logger.step "In Orders Toolbar, expect Print Tooltip to include #{expectation}"
  actual = stamps.orders.orders_toolbar.print_btn.tooltip
  #logger.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  expect(actual).to include(expectation)
end

Then /^[Ii]n Orders Toolbar, expect Move Tooltip to include (.*)$/ do |expectation|
  #logger.step "In Orders Toolbar, expect Move Tooltip to include #{expectation}"
  actual = stamps.orders.orders_toolbar.move_drop_down.tooltip
  #logger.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  expect(actual).to include(expectation)
end

Then /^[Ii]n Orders Toolbar, expect Add Tooltip to include (.*)$/ do |expectation|
  #logger.step "In Orders Toolbar, expect Add Tooltip to include #{expectation}"
  actual = stamps.orders.orders_toolbar.add.order_details.tooltip
  #logger.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  expect(actual).to include(expectation)
end

Then /^[Ee]xpect Order Details form Toolbar Menu Tooltip is (.*)$/ do |expectation|
  #logger.step "expect Order Details form Toolbar Menu Tooltip is #{expectation}"
  actual = stamps.orders.order_details.toolbar.menu.tooltip
  #logger.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  expect(actual).to include(expectation)
end

Then /^Filter Panel: Menu Item collapse button tooltip should be (.*)$/ do |expectation|
  #logger.step "Filter Panel: Menu Item collapse button tooltip should be #{expectation}"
  actual = stamps.orders.filter_panel.menu_item.collapse.tooltip
  #logger.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  expect(actual).to include(expectation)
end

Then /^Filter Panel: Menu Item expand button tooltip should be (.*)$/ do |expectation|
  #logger.step "Filter Panel: Menu Item expand button tooltip should be #{expectation}"
  actual = stamps.orders.filter_panel.menu_item.expand.tooltip
  #logger.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  expect(actual).to include(expectation)
end

Then /^Tooltips: Expect Print Modal Print Media \"(.*)\" tooltip to include \"(.*)\"$/ do |expectation, data_qtip|
  #logger.step "Tooltips: Expect Print Modal Print Media #{expectation} tooltip to include #{data_qtip}"
  tooltips = data_qtip.split "||"
  actual_tooltip = stamps.orders.orders_toolbar.print_btn.print_modal.printing_on.tooltip expectation
  tooltips.each do |tooltip|
    #logger.step "Test #{(actual_tooltip.include? tooltip)?"Passed":"Failed"}"
    expect(actual_tooltip).to include tooltip
  end
end

Then /^Tooltips: Expect Customs Form Tooltip Error for Total Weight is (.+)$/ do |expectation|
  #logger.step "Tooltips: Expect Customs Form Tooltip Error for Total Weight is #{expectation}"
  stamps.orders.order_details.customs.edit_form.should_not be_nil
  data_error_qtip = stamps.orders.order_details.customs.edit_form.total_weight.data_error
  #logger.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  expect(data_error_qtip).to include(expectation)
end

Then /^[Oo]n Customs form, expect Associated Item Description Tooltip Error is (.*)$/ do |expectation|
  #logger.step "expect Customs form Associated Item Description Tooltip Error is #{expectation}"
  stamps.orders.order_details.customs.edit_form.should_not be_nil
  data_error_qtip = stamps.orders.order_details.customs.edit_form.associated_items.item_number(1).description.data_error_qtip
  #logger.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  expect(data_error_qtip).to include(expectation)
end

Then /^[Oo]n Customs form, expect Qty Tooltip Error is (.*)$/ do |expectation|
  #logger.step "expect Customs form Qty Tooltip Error is #{expectation}"
  stamps.orders.order_details.customs.edit_form.should_not be_nil
  data_error_qtip = stamps.orders.order_details.customs.edit_form.associated_items.item_number(1).qty.text_box.data_error_qtip
  #logger.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  expect(data_error_qtip).to include(expectation)
end

Then /^[Oo]n Customs form, expect Unit Price Tooltip Error is (.*)$/ do |expectation|
  #logger.step "expect Customs form Unit Price Tooltip Error is #{expectation}"
  stamps.orders.order_details.customs.edit_form.should_not be_nil
  data_error_qtip = stamps.orders.order_details.customs.edit_form.associated_items.item_number(1).unit_price.text_box.data_error_qtip
  #logger.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  expect(data_error_qtip).to include(expectation)
end

Then /^[Oo]n Customs form, expect Pounds Tooltip Error is (.*)$/ do |expectation|
  #logger.step "expect Customs form Pounds Tooltip Error is #{expectation}"
  stamps.orders.order_details.customs.edit_form.should_not be_nil
  data_error_qtip = stamps.orders.order_details.customs.edit_form.associated_items.item_number(1).lb.text_box.data_error_qtip
  #logger.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  expect(data_error_qtip).to include(expectation)
end

Then /^[Oo]n Customs form, expect Ounces Tooltip Error is (.*)$/ do |expectation|
  #logger.step "expect Customs form Ounces Tooltip Error is #{expectation}"
  stamps.orders.order_details.customs.edit_form.should_not be_nil
  data_error_qtip = stamps.orders.order_details.customs.edit_form.associated_items.item_number(1).oz.text_box.data_error_qtip
  #logger.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  expect(ddata_error_qtip).to include(expectation)
end

Then /^[Ee]xpect Order Details form Domestic Address data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form Domestic Address data error tooltip is #{expectation}"
  stamps.orders.order_details.ship_to.domestic.show_address
  text_box = stamps.orders.order_details.ship_to.domestic.text_area
  20.times do
    text_box.double_click
    stamps.orders.order_details.blur_out
    text_box.scroll_into_view
    text_box.double_click
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form Domestic Email data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form Domestic Email data error tooltip is #{expectation}"
  stamps.orders.order_details.ship_to.domestic.show_address
  text_box = stamps.orders.order_details.ship_to.domestic.email
  20.times do
    text_box.double_click
    stamps.orders.order_details.blur_out
    text_box.scroll_into_view
    text_box.double_click
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form Weight Lbs data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form Domestic  Weight lb data error tooltip is #{expectation}"
  text_box = stamps.orders.order_details.weight.lb.text_box
  20.times do
    text_box.scroll_into_view
    text_box.set "1"
    stamps.orders.order_details.blur_out
    text_box.set "0"
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end

  text_box.scroll_into_view
  sleep(2)
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form Weight Oz data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form Weight Oz data error tooltip is #{expectation}"
  text_box = stamps.orders.order_details.weight.oz.text_box
  20.times do
    text_box.scroll_into_view
    text_box.set "1"
    text_box.double_click
    stamps.orders.order_details.blur_out
    text_box.double_click
    text_box.set "0"
    text_box.scroll_into_view
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end

  text_box.scroll_into_view
  sleep(2)
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form service data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form Weight Oz data error tooltip is #{expectation}"
  text_box = stamps.orders.order_details.service.text_box
  20.times do
    text_box.double_click
    stamps.orders.order_details.blur_out
    text_box.scroll_into_view
    text_box.double_click
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end

  text_box.scroll_into_view
  sleep(2)
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form Dimensions Length data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form Dimensions Length data error tooltip is #{expectation}"
  text_box = stamps.orders.order_details.dimensions.length.text_box

  20.times do
    text_box.double_click
    stamps.orders.order_details.blur_out
    text_box.scroll_into_view
    text_box.double_click
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      stamps.orders.order_details.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form Dimensions Width data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form Dimensions Width data error tooltip is #{expectation}"
  width_text_box = stamps.orders.order_details.dimensions.width.text_box

  20.times do
    text_box.double_click
    stamps.orders.order_details.blur_out
    text_box.scroll_into_view
    text_box.double_click
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      stamps.orders.order_details.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form Dimensions Height data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form Dimensions Height data error tooltip is #{expectation}"
  height_text_box = stamps.orders.order_details.dimensions.height.text_box

  20.times do
    text_box.double_click
    stamps.orders.order_details.blur_out
    text_box.scroll_into_view
    text_box.double_click
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      stamps.orders.order_details.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form International Name data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form International Name data error tooltip is #{expectation}"
  text_box = stamps.orders.order_details.ship_to.international.name
  20.times do
    text_box.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    text_box.double_click
    #web_apps.orders.order_details.ship_to.international.click_form
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      stamps.orders.order_details.ship_to.international.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.ship_to.international.name.scroll_into_view
  sleep(2)
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form International Company data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form International Company data error tooltip is #{expectation}"
  text_box = stamps.orders.order_details.ship_to.international.company

  20.times do
    text_box.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    text_box.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      stamps.orders.order_details.ship_to.international.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.ship_to.international.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form International Address 1 data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form International Address 1 data error tooltip is #{expectation}"
  text_box = stamps.orders.order_details.ship_to.international.address_1

  20.times do
    text_box.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    text_box.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      stamps.orders.order_details.ship_to.international.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.ship_to.international.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form International City data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form International City data error tooltip is #{expectation}"
  text_box = stamps.orders.order_details.ship_to.international.city

  20.times do
    text_box.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      stamps.orders.order_details.ship_to.international.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.ship_to.international.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form International Phone data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form International Phone data error tooltip is #{expectation}"
  text_box = stamps.orders.order_details.ship_to.international.phone

  20.times do
    text_box.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    text_box.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      stamps.orders.order_details.ship_to.international.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.ship_to.international.name.scroll_into_view
  sleep(2)
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect Order Details form International Email data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Order Details form International Email data error tooltip is #{expectation}"
  text_box = stamps.orders.order_details.ship_to.international.email

  20.times do
    text_box.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    text_box.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    sleep(0.35)
    data_error_tooltip = text_box.data_error_qtip
    begin
      stamps.orders.order_details.ship_to.international.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.ship_to.international.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  #logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end