Then /^add new order$/ do
  step 'add order 0'
end

Then /^add order (\d+)$/ do |count|
  step 'check for server error'
  toolbar = SdcOrders.toolbar
  order_details = SdcOrders.order_details
  ship_from = order_details.ship_from
  initializing = SdcOrders.initializing_orders_db
  toolbar.add.wait_until_present(timeout: 10)
  toolbar.add.click if TestSession.env.browser_test
  toolbar.add.send_keys(:enter) if TestSession.env.ios_test

  order_details.title.safe_wait_until_present(timeout: 10)
  unless order_details.order_id.present?
    if initializing.present?
      initializing.safe_wait_until_present(timeout: 20)
      expect(initializing.text).not_to eql 'Initializing Order Database'
    end
  end
  order_details.order_id.safe_wait_until_present(timeout: 20)
  order_details.order_id.click if order_details.order_id.present?
  order_details.title.safe_wait_until_present(timeout: 20)
  expect(order_details.order_id.text_value).not_to eql ''
  sleep 1 unless TestSession.env.build_number
  order_id = order_details.order_id.text_value.parse_digits
  TestData.hash[:order_id][count.to_i] = order_id

  step 'save order details data'
  TestData.hash[:ord_id_ctr] += 1
  TestData.hash[:items_ordered_qty] = 0
  TestData.hash[:customs_items_qty] = 0
  ship_from = ship_from.text_field.text_value
  TestData.hash[:ship_from] = ship_from
end

Then /^check for server error$/ do
  server_error = SdcOrders.modals.server_error
  error_msg = nil
  if server_error.title.present?
    error_msg = "#{server_error.title.text} - #{server_error.body.text}"
    SdcLogger.error error_msg
  end
  expect(error_msg).to be_nil
end

Then /^wait until orders available$/ do
  step 'wait for js to stop'
  SdcOrders.toolbar.add.wait_until_present(timeout: 10)
  SdcOrders.grid.body.wait_until_present(timeout: 20)
end

# #{TestData.hash[:full_name]}, #{TestData.hash[:street_address]}, #{TestData.hash[:city]}, #{TestData.hash[:state]}, #{TestData.hash[:zip]}"
Then /^save order details data$/ do
  step 'expect order details is present'
  order_details = SdcOrders.order_details
  TestData.hash[:country] = order_details.ship_to.domestic.country.text_field.text_value
  TestData.hash[:service_cost] = order_details.service.cost.text_value.parse_digits.to_f.round(2)
  TestData.hash[:service] = order_details.service.text_field.text_value
  TestData.hash[:ship_from] = order_details.ship_from.text_field.text_value
  TestData.hash[:insure_for_cost] = order_details.insure_for.cost.text_value.parse_digits.to_f.round(2)
  TestData.hash[:total_ship_cost] = order_details.footer.total_ship_cost.text_value.parse_digits.to_f.round(2)
  TestData.hash[:awaiting_shipment_count] = SdcOrders.filter_panel.awaiting_shipment.count.text_value.to_f.round(2)
  # if !order_details.ship_to.domestic.address.text_value.nil? && !order_details.ship_to.domestic.address.text_value.eql?('')
  #   TestData.hash[:full_name], TestData.hash[:company], TestData.hash[:street_address], TestData.hash[:city], TestData.hash[:state],
  #       TestData.hash[:zip] = TestHelper.address_str_to_hash(order_details.ship_to.domestic.address.text_value).values
  # end
  if order_details.tracking.cost.present?
    TestData.hash[:tracking_cost] = order_details.tracking.cost.text_value.parse_digits.to_f.round(2)
  end
  if order_details.tracking.text_field.present?
    TestData.hash[:tracking] = order_details.tracking.text_field.text_value
  end
end

Then /^click orders toolbar print button$/ do
  step 'save order details data'
  SdcOrders.order_details.footer.print.click
  print = SdcOrders.modals.print
  print.title.safe_wait_until_present(timeout: 5)
  expect(print.title).to be_present
  expect(print.title.text_value).to match(/You have \d label ready to print/)
end


Then /^click orders toolbar print all button$/ do
  step 'save order details data'
  SdcOrders.order_details.footer.print.click
  expect(SdcOrders.modals.print.title).to be_present
  expect(SdcOrders.modals.print.title.text_value).to match(/You have \d label ready to print/)
end

Then /^expect orders toolbar print is present$/ do
  expect(SdcOrders.toolbar.print).to be_present, "Orders Toolbar Print is not present!"
end

Then /^expect orders toolbar add is present$/ do
  expect(SdcOrders.toolbar.add).to be_present, "Orders Toolbar Add is not present!"
end

Then /^expect orders toolbar move is present$/ do
  expect(SdcOrders.toolbar.move).to be_present, "Orders Toolbar Move is not present!"
end

Then /^expect orders toolbar tags is present$/ do
  expect(SdcOrders.toolbar.tags).to be_present, "Orders Toolbar Tags button is not present!"
end

Then /^expect orders toolbar more actions is present$/ do
  expect(SdcOrders.toolbar.more_actions).to be_present, "Orders Toolbar More Actions button is not present!"
end
