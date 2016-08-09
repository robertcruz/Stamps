
Then /^Paging: Set Per Page drop-down to 100$/ do
  logger.info "Toolbar:  Set Per Page Count to 100"
  web_apps.orders.grid.toolbar.per_page.x100
  per_page = web_apps.orders.grid.toolbar.per_page.text_box.text
  logger.info "Test #{(per_page == "100")?"Passed":"Failed"}"
  per_page.should eql "100"
end

Then /^Toolbar:  Set Per Page drop-down to 250$/ do
  logger.info "Toolbar:  Set Per Page Count to 250"
  web_apps.orders.grid.toolbar.per_page.x250
  per_page = web_apps.orders.grid.toolbar.per_page.text_box.text
  logger.info "Test #{(per_page == "250")?"Passed":"Failed"}"
  per_page.should eql "250"
end

Then /^Toolbar:  Set Per Page drop-down to 500$/ do
  logger.info "Toolbar:  Set Per Page Count to 500"
  web_apps.orders.grid.toolbar.per_page.x500
  per_page = web_apps.orders.grid.toolbar.per_page.text_box.text
  logger.info "Test #{(per_page == "500")?"Passed":"Failed"}"
  per_page.should eql "500"
end

Then /^Toolbar: Expect number of orders on page to be correct$/ do
  logger.info "Toolbar: Expect number of orders on page to be correct"
  filter = web_apps.orders.filter
  grid = filter.awaiting_shipment
  sleep 1
  grid.checkbox.check_all
  sleep 1
  awaiting_shipment_total_count = filter.awaiting_shipment_count
  multi_order_count = web_apps.orders.multi_order.order_count
  per_page_count = web_apps.orders.grid.toolbar.per_page.text_box.text.to_i

  if awaiting_shipment_total_count < per_page_count
    max_order_count = awaiting_shipment_total_count
  else
    max_order_count = per_page_count
  end

  sleep 1
  grid.checkbox.uncheck_all
  logger.info "Test #{(max_order_count == multi_order_count)?"Passed":"Failed"}"
  max_order_count.should eql multi_order_count
end

Then /^User is on the first page of orders$/ do
  logger.info "User is on the first page of orders"
  logger.info "Page Count = Page #{web_apps.orders.grid.row_count} orders"
  page_count = web_apps.orders.grid.toolbar.page_count.text
  logger.info "Page Count = Page #{page_count}"
  expect(page_count.to_i = 1).to be true
end

Then /^User clicks first page pagination control$/ do
  logger.info "User clicks first page pagination control"
  paging_toolbar = web_apps.orders.grid.toolbar
  paging_toolbar.first_page.click
end

Then /^User clicks previous page pagination control$/ do
  logger.info "User clicks previous page pagination control"
  paging_toolbar = web_apps.orders.grid.toolbar
  paging_toolbar.previous_page.click
end

Then /^User clicks next page pagination control$/ do
  logger.info "User clicks next page pagination control"
  paging_toolbar = web_apps.orders.grid.toolbar
  paging_toolbar.next_page.click
end

Then /^User clicks last page pagination control$/ do
  logger.info "User clicks last page pagination control"
  paging_toolbar = web_apps.orders.grid.toolbar
  paging_toolbar.last_page.click
end

Then /^Pagination control to go to first page is (\w+)$/ do |first_pagination_enabled|
  logger.info "Pagination control to go to first page is #{first_pagination_enabled}"
  enabled = web_apps.orders.grid.toolbar.first_page.present?
  if first_pagination_enabled.downcase == "enabled"
    logger.info "Pagination control to go to first page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to previous page is (\w+)$/ do |previous_pagination_enabled|
  logger.info "Pagination control to go to previous page is #{previous_pagination_enabled}"
  enabled = web_apps.orders.grid.toolbar.previous_page.present?
  if previous_pagination_enabled.downcase == "enabled"
    logger.info "Pagination control to go to previous page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to page number is (\w+$)/ do |page_number_enabled|
  logger.info "Pagination control to go to page number is #{page_number_enabled}"
  enabled = web_apps.orders.grid.toolbar.page_number.present?
  if page_number_enabled.downcase == "enabled"
    logger.info "Pagination control to go to page number is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to next page is (\w+)$/ do |next_pagination_enabled|
  logger.info "Pagination control to go to next page is #{next_pagination_enabled}"
  enabled = web_apps.orders.grid.toolbar.next_page.present?
  if next_pagination_enabled.downcase == "enabled"
    logger.info "Pagination control to go to next page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to last page is (\w+)$/ do |last_pagination_enabled|
  logger.info "Pagination control to go to last page is #{last_pagination_enabled}"
  enabled = web_apps.orders.grid.toolbar.last_page.present?
  if last_pagination_enabled.downcase == "enabled"
    logger.info "Pagination control to go to last page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Expect page toolbar First Page is (\w+)$/  do |expectation|
  logger.info "Expect page toolbar First Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = web_apps.orders.grid.toolbar.first_page.present?
      logger.info enabled
    when "disabled"
      disabled = web_apps.orders.grid.toolbar.first_page_disabled
      logger.info disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Previous Page is (\w+)$/  do |expectation|
  logger.info "Expect page toolbar Previous Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = web_apps.orders.grid.toolbar.previous_page.present?
      logger.info enabled
    when "disabled"
      disabled = web_apps.orders.grid.toolbar.first_page_disabled
      logger.info disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Page Number is (\w+)$/  do |expectation|
  logger.info "Expect page toolbar Page Number is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = web_apps.orders.grid.toolbar.page_number.present?
      logger.info enabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Next Page is (\w+)$/  do |expectation|
  logger.info "Expect page toolbar Next Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = web_apps.orders.grid.toolbar.next_page.present?
      logger.info enabled
    when "disabled"
      disabled = web_apps.orders.grid.toolbar.last_page_disabled
      logger.info disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Last Page is (\w+)$/  do |expectation|
  logger.info "Expect page toolbar Last Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = web_apps.orders.grid.toolbar.last_page.present?
      logger.info enabled
    when "disabled"
      disabled = web_apps.orders.grid.toolbar.last_page_disabled
      logger.info disabled
    else
      raise "Illegal argument exception"
  end
end

When /^Set Page Number to (\d*)$/ do |value|
  logger.info "Set Page Number to #{value}"
  begin
    logger.info "Set Page Number to \"#{value}\""
    page_one_order_id = web_apps.orders.grid.order_id.row 1
    page_number = web_apps.orders.grid.toolbar.page_number.text
    logger.info "Current page number #{page_number}"
    web_apps.orders.grid.toolbar.page_number.set value
    sleep 1
    page_number_textbox = web_apps.orders.grid.toolbar.page_number
    page_number = page_number_textbox.text
    text_box_field = page_number_textbox.element
    text_box_field.send_keys :return
    text_box_field.send_keys :return
    logger.info "New page number #{page_number}"
    page_two_order_id = web_apps.orders.grid.order_id.row 1
    page_one_order_id.should_not eql page_two_order_id
  end unless value.length == 0
end

Then /^Paging: Expect Total Number of Pages to be (\d+)$/ do |total_number_of_pages|
  logger.info "Paging: Expect Total Number of Pages to be #{total_number_of_pages}"
  logger.info "Passed value is #{total_number_of_pages}"
  browser_total_number_of_pages = web_apps.orders.grid.toolbar.total_number_of_pages.to_s
  logger.info "DD value is #{browser_total_number_of_pages}"
  test_result = browser_total_number_of_pages.include? total_number_of_pages
  logger.info "#{(test_result)?'Test Passed.':'Test Failed'}"
  test_result.should be true
  #expect(total_number_of_pages).should be eql expect(browser_total_number_of_pages)
end

Then /^Web Batch grid has more orders than value selected in 'number of orders per page' pagination control$/ do
  logger.info "Web Batch grid has more orders than value selected in 'number of orders per page' pagination control"
  #1 Count order grid items ordersgridpagingtoolbar
  page_count = web_apps.orders.grid.toolbar.page_count.text
  expect(page_count.to_i > 1).to be true
  total_grid_count = web_apps.orders.grid.row_count
  #2 Get per page count

  #3 Compare
end

