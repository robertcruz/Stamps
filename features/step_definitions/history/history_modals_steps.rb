#refund
Then /^expect refund modal on history is present$/ do
  expect(SdcHistory.modals.refund.title).to be_present
end

Then /^click submit button on refund modal$/ do
  SdcHistory.modals.refund.submit.click
end

Then /^click cancel button on refund modal$/ do
  SdcHistory.modals.refund.submit.click
end

Then /^close refund modal on history$/ do
  SdcHistory.modals.refund.x_btn.click
end

#schedule pickup
Then /^expect schedule pickup on history is present$/ do
  expect(SdcHistory.modals.schedule_pickup.title).to be_present
end

Then /^click submit button on schedule pickup modal$/ do
  SdcHistory.modals.schedule_pickup.submit.click
end

Then /^click cancel button on schedule pickup modal$/ do
  SdcHistory.modals.schedule_pickup.submit.click
end

Then /^close schedule pickup modal on history$/ do
  SdcHistory.modals.schedule_pickup.x_btn.click
end

Then /^set first name on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.first_name.set(str)
  step "expect first name on schedule pickup is #{str}"
end
Then /^expect first name on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.first_name.text_value).to eql(str)
end

Then /^set last name on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.last_name.set(str)
  step "expect last name on schedule pickup is #{str}"
end
Then /^expect last name on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.last_name.text_value).to eql(str)
end

Then /^set company on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.company.set(str)
  step "expect company on schedule pickup is #{str}"
end
Then /^expect company on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.company.text_value).to eql(str)
end

Then /^set address on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.address.set(str)
  step "expect address on schedule pickup is #{str}"
end
Then /^expect address on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.address.text_value).to eql(str)
end

Then /^set city on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.city.set(str)
  step "expect city on schedule pickup is #{str}"
end
Then /^expect city on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.city.text_value).to eql(str)
end

Then /^select state on schedule pickup modal (.*)$/ do |str|
  state = SdcHistory.modals.schedule_pickup.state
  unless state.text_field.text_value.include?(str)
    state.drop_down.click
    state.selection(str)
    state.drop_down.click unless selection_obj.present?
    selection_obj.scroll_into_view unless selection_obj.present?
    selection_obj.click if selection_obj.present?
  end
  step "expect state on schedule pickup modal is #{str}"
end

Then /^expect state on schedule pickup modal is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.state.text_field.text_value).to eql(str)
end

Then /^set zip on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.zip.set(str)
  step "expect zip on schedule pickup is #{str}"
end
Then /^expect zip on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.zip.text_value).to eql(str)
end

Then /^set phone on schedule pickup modal to (\d+)$/ do |str|
  SdcHistory.modals.schedule_pickup.phone_number.set(str)
  step "expect phone on schedule pickup is #{str}"
end

Then /^expect phone on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.phone_number.text_value).to eql(str)
end

Then /^set phone ext on schedule pickup modal to (\d+)$/ do |str|
  SdcHistory.modals.schedule_pickup.phone_ext.set(str)
  step "expect phone ext on schedule pickup is #{str}"
end
Then /^expect phone ext on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.phone_ext.text_value).to eql(str)
end

Then /^set number of express mail pieces on schedule pickup modal to (\d+)$/ do |str|
  SdcHistory.modals.schedule_pickup.express_mail_pieces.set(str)
  step "expect number of express mail pieces on schedule pickup is #{str}"
end
Then /^expect number of express mail pieces on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.express_mail_pieces.text_value).to eql(str)
end

Then /^set number of priority mail pieces on schedule pickup modal to (\d+)$/ do |str|
  SdcHistory.modals.schedule_pickup.priority_mail_pieces.set(str)
  step "expect number of priority mail pieces on schedule pickup is #{str}"
end
Then /^expect number of priority mail pieces on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.priority_mail_pieces.text_value).to eql(str)
end

Then /^set number of international pieces on schedule pickup modal to (\d+)$/ do |str|
  SdcHistory.modals.schedule_pickup.international_pieces.set(str)
  step "expect number of international pieces on schedule pickup is #{str}"
end
Then /^expect number of international pieces on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.international_pieces.text_value).to eql(str)
end

Then /^set number of first class pieces on schedule pickup modal to (\d+)$/ do |str|
  SdcHistory.modals.schedule_pickup.first_class_pieces.set(str)
  step "expect number of first class pieces on schedule pickup is #{str}"
end
Then /^expect number of first class pieces on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.first_class_pieces.text_value).to eql(str)
end

Then /^set number of other pieces on schedule pickup modal to (\d+)$/ do |str|
  SdcHistory.modals.schedule_pickup.other_pieces.set(str)
  step "expect number of other pieces on schedule pickup is #{str}"
end
Then /^expect number of other pieces on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.other_pieces.text_value).to eql(str)
end

Then /^set estimated weight on schedule pickup modal to (\d+)$/ do |str|
  SdcHistory.modals.schedule_pickup.estimated_weight.set(str)
  step "expect estimated weight on schedule pickup is #{str}"
end

Then /^expect estimated weight on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.estimated_weight.text_value).to eql(str)
end

Then /^select package location on schedule pickup modal (.*)$/ do |str|
  package_location = SdcHistory.modals.schedule_pickup.package_location
  unless package_location.text_field.text_value.include?(str)
    package_location.drop_down.click
    package_location.selection(str)
    package_location.drop_down.click unless package_location.selection_obj.present?
    package_location.selection_obj.scroll_into_view unless package_location.selection_obj.present?
    package_location.selection_obj.click if package_location.selection_obj.present?
  end
  step "expect package location on schedule pickup modal is #{str}"
end

Then /^expect package location on schedule pickup modal is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.package_location.text_field.text_value).to eql(str)
end

Then /^set special instructions on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.special_instructions.set(str)
  step "expect special instructions on schedule pickup is #{str}"
end
Then /^expect special instructions on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.special_instructions.text_value).to eql(str)
end

#manage pickups
Then /^expect manage pickups on history is present$/ do
  expect(SdcHistory.modals.manage_pickups.title).to be_present
end

Then /^expect edit pickup button on manage pickups modal is enabled$/ do
  expect(SdcHistory.modals.manage_pickups.edit_pickup.class_disabled?).to be_falsy
end

Then /^click edit pickup button on manage pickups modal$/ do
  SdcHistory.modals.manage_pickups.edit_pickup.click
end

Then /^expect cancel pickup button on manage pickups modal is enabled$/ do
  expect(SdcHistory.modals.manage_pickups.cancel_pickup.class_disabled?).to be_falsy
end

Then /^click cancel pickup button on manage pickups modal$/ do
  SdcHistory.modals.manage_pickups.cancel_pickup.click
end

Then /^select row (\d+) on manage pickups modal$/ do |num|
  SdcHistory.modals.manage_pickups.row_select(num).click
end

Then /^close manage pickups modal on history$/ do
  SdcHistory.modals.manage_pickups.x_btn.click
end

#scan form
Then /^expect scan form on history is present$/ do
  expect(SdcHistory.modals.scan_form.title).to be_present
end

Then /^close scan form modal on history$/ do
  SdcHistory.modals.scan_form.x_btn.click
end

Then /^click print scan form on scan form modal$/ do
  SdcHistory.modals.scan_form.print_scan_form.click
end

Then /^click close on scan form modal$/ do
  SdcHistory.modals.scan_form.close.click
end

Then /^check print details on scan form modal$/ do
  step 'expect print details on scan form modal is unchecked'
  SdcHistory.modals.scan_form.print_details.check
  step 'expect print details on scan form modal is checked'
end

Then /^uncheck print details on scan form modal$/ do
  step 'expect print details on scan form modal is checked'
  SdcHistory.modals.scan_form.print_details.uncheck
  step 'expect print details on scan form modal is unchecked'
end

Then /^expect print details on scan form modal is checked$/ do
  expect(SdcHistory.modals.scan_form.print_details.checked?).to be_truthy
end

Then /^expect print details on scan form modal is unchecked$/ do
  expect(SdcHistory.modals.scan_form.print_details.checked?).to be_falsy
end

#reprint scan form
Then /^expect reprint scan form on history is present$/ do
  expect(SdcHistory.modals.reprint_scan_form.title).to be_present
end

Then /^close reprint scan form modal on history$/ do
  SdcHistory.modals.reprint_scan_form.x_btn.click
end

Then /^expect print scan form button on reprint scan form is enabled$/ do
  expect(SdcHistory.modals.reprint_scan_form.print_scan_form.class_disabled?).to be_falsy
end

Then /^expect print scan form button on reprint scan form is disabled$/ do
  expect(SdcHistory.modals.reprint_scan_form.print_scan_form.class_disabled?).to be_truthy
end

Then /^expect print details button on reprint scan form is enabled$/ do
  expect(SdcHistory.modals.reprint_scan_form.print_details.class_disabled?).to be_falsy
end

Then /^expect print details button on reprint scan form is disabled$/ do
  expect(SdcHistory.modals.reprint_scan_form.print_details.class_disabled?).to be_truthy
end

Then /^click print scan form button on reprint scan form modal$/ do
  step 'expect print scan form button on reprint scan form is enabled'
  SdcHistory.modals.reprint_scan_form.print_details.click
end

Then /^click print details button on reprint scan form modal$/ do
  step 'expect print scan form button on reprint scan form is enabled'
  SdcHistory.modals.reprint_scan_form.print_details.click
end

Then /^select row (\d+) on reprint scan form modal$/ do |num|
  SdcHistory.modals.reprint_scan_form.row_select(num).click
end

#create return label
Then /^expect return label modal on history is present$/ do
  SdcHistory.modals.return_label.title.wait_until_present(timeout: 5)
  expect(SdcHistory.modals.return_label.title).to be_present
end

Then /^expect return label modal on history is not present$/ do
  expect(SdcHistory.modals.return_label.title).not_to be_present
end

Then /^close return label modal on history$/ do
  SdcHistory.modals.return_label.x_btn.click
end

Then /^expect from address on return label modal is (.*)$/ do |str|
  expect(SdcHistory.modals.return_label.from.text_value).to eql(str)
end

Then /^set from address on return label modal to (.*)$/ do |str|
  SdcHistory.modals.return_label.from.set(str)
end

Then /^expect to address on return label modal is (.*)$/ do |str|
  expect(SdcHistory.modals.return_label.to.text_value).to eql(str)
end

Then /^set to address on return label modal to (.*)$/ do |str|
  SdcHistory.modals.return_label.to.set(str)
end

Then /^set weight on return label modal to (\d+) lbs (\d+) oz$/ do |lbs, oz|
  step "set lbs on return label modal to #{lbs}"
  step "set oz on return label modal to #{oz}"
end

Then /^set lbs on return label modal to (.+)$/ do |val|
  lbs = SdcHistory.modals.return_label.lbs
  iterations = val.to_i - lbs.text_value.to_i
  iterations.abs.times do lbs.increment.click end if iterations > 0
  iterations.abs.times do lbs.decrement.click end if iterations < 0
  step "expect lbs on return label modal is #{val}"
end

Then /^set oz on return label modal to (.+)$/ do |val|
  oz = SdcHistory.modals.return_label.oz
  iterations = val.to_i - oz.text_value.to_i
  iterations.abs.times do oz.increment.click end if iterations > 0
  iterations.abs.times do oz.decrement.click end if iterations < 0
  step "expect oz on return label modal is #{val}"
end

Then /^expect lbs on return label modal is (.*)$/ do |num|
  expect(SdcHistory.modals.return_label.lbs.text_value).to eql(num)
end

Then /^expect oz on return label modal is (.*)$/ do |num|
  expect(SdcHistory.modals.return_label.oz.text_value).to eql(num)
end

Then /^select service on return label modal (.*)$/ do |str|
  service = SdcHistory.modals.return_label.service
  unless service.text_field.text_value.include?(str)
    service.service_element(:service_element, str)
    service.drop_down.click unless service_element.present?
    service_element.scroll_into_view unless service_element.present?
    service_element.click if service_element.present?
  end
  step "expect service on return label modal is #{str}"
end

Then /^expect service on return label modal is (.*)$/ do |str|
  expect(SdcHistory.modals.return_label.service.text_field.text_value).to eql(str)
end

Then /^expect service on return label modal is \$(.+)$/ do |str|
  service = SdcHistory.modals.return_label.service
  expect(service.cost.present?).to be_truthy
  cost = service.cost.text_value.parse_digits.to_f
  expect(cost).to eql(str.to_f)
end

Then /^set insure for on return label modal to (\d+)$/ do |val|
  SdcHistory.modals.return_label.insure_for.set(val)
  step "expect insure for on return label modal is #{val}"
end

Then /^expect insure for on return label modal is (.*)$/ do |str|
  expect(SdcHistory.modals.return_label.insure_for.text_value).to eql(str)
end

Then /^select tracking on return label modal (.*)$/ do |str|
  tracking = SdcHistory.modals.return_label.tracking
  unless tracking.text_field.text_value.include?(str)
    tracking.drop_down.click
    tracking_element = tracking.tracking_element(:service, str)
    tracking.drop_down.click unless tracking_element.present?
    tracking_element.scroll_into_view unless tracking_element.present?
    tracking_element.click if tracking_element.present?
  end
  step "expect tracking on return label modal is #{str}"
end

Then /^expect tracking on return label modal is (.*)$/ do |str|
  expect(SdcHistory.modals.return_label.tracking.text_value).to eql(str)
end

Then /^set rma memo on return label modal to (.*)$/ do |str|
  SdcHistory.modals.return_label.rma_memo.set(str)
  step "expect rma memo on return label modal is #{val}"
end

Then /^expect rma memo on return label modal is (.*)$/ do |str|
  expect(SdcHistory.modals.return_label.rma_memo.text_value).to eql(str)
end

Then /^select cost code on return label modal (.*)$/ do |str|
  cost_code = SdcHistory.modals.return_label.cost_code
  unless cost_code.text_field.text_value.include?(str)
    cost_code.drop_down.click
    cost_code.selection(str)
    cost_code.drop_down.click unless selection_obj.present?
    selection_obj.scroll_into_view unless selection_obj.present?
    selection_obj.click if selection_obj.present?
  end
  step "expect tracking on return label modal is #{str}"
end

Then /^expect cost code on return label modal is (.*)$/ do |str|
  expect(SdcHistory.modals.return_label.cost_code.text_field.text_value).to eql(str)
end

#change cost code
Then /^expect change cost code modal on history is present$/ do
  expect(SdcHistory.modals.change_cost_code.title).to be_present
end

Then /^expect change cost code modal on history is not present$/ do
  expect(SdcHistory.modals.change_cost_code.title).not_to be_present
end

Then /^close change cost code modal on history$/ do
  SdcHistory.modals.change_cost_code.x_btn.click
end

Then /^click save button on change cost code modal$/ do
  SdcHistory.modals.change_cost_code.save.click
end

Then /^select new cost code on change cost code modal (.*)$/ do |str|
  new_cost_code = SdcHistory.modals.change_cost_code.new_cost_code
  unless new_cost_code.text_field.text_value.include?(str)
    new_cost_code.drop_down.click
    new_cost_code.selection(str)
    new_cost_code.drop_down.click unless selection_obj.present?
    selection_obj.scroll_into_view unless selection_obj.present?
    selection_obj.click if selection_obj.present?
  end
  step "expect new cost code on return label modal is #{str}"
end

Then /^expect new cost code on return label modal is (.*)$/ do |str|
  expect(SdcHistory.modals.change_cost_code.new_cost_code.text_field.text_value).to eql(str)
end

#container label
Then /^expect container label modal on history is present$/ do
  expect(SdcHistory.modals.container_label.title).to be_present
end

Then /^close container label modal on history$/ do
  SdcHistory.modals.container_label.x_btn.click
end

Then /^click print label on container label modal$/ do
  SdcHistory.modals.container_label.print_label.click
  step 'expect ready to print modal on history is present'
end

Then /^click cancel on container label modal$/ do
  SdcHistory.modals.container_label.cancel.click
end

Then /^set number of containers on container label modal to (.+)$/ do |val|
  number = SdcHistory.modals.container_label.number_containers
  iterations = val.to_i - number.text_value.to_i
  iterations.abs.times do number.increment.click end if iterations > 0
  iterations.abs.times do number.decrement.click end if iterations < 0
  step "expect number of containers on container label modal is #{val}"
end

Then /^expect number of containers on container label modal is (.+)$/ do |val|
  expect(SdcHistory.modals.container_label.number_containers.text_value).to eql(val)
end

#container label ready to print
Then /^expect ready to print modal on history is present$/ do
  expect(SdcHistory.modals.ready_to_print.title).to be_present
end

Then /^expect ready to print modal on history is not present$/ do
  expect(SdcHistory.modals.ready_to_print.title).not_to be_present
end

Then /^click print button on ready to print modal$/ do
  SdcHistory.modals.ready_to_print.print.click
  step 'wait while loading history filters grid'
  begin
    SdcPage.browser.wait_until(timeout: 30) { container_label.selected? }
  rescue
    # ignore
  end
  step 'expect your container label modal on history is present'
end

#your container label
Then /^expect your container label modal on history is present$/ do
  expect(SdcHistory.modals.your_container_label.title).to be_present
end

Then /^expect your container label modal on history is not present$/ do
  expect(SdcHistory.modals.your_container_label.title).not_to be_present
end

Then /^close your container label modal on history$/ do
  SdcHistory.modals.your_container_label.x_btn.click
  step 'expect your container label modal on history is not present'
end

Then /^click close button on your container label modal$/ do
  SdcHistory.modals.your_container_label.close.click
end

Then /^click reprint button on your container label modal$/ do
  SdcHistory.modals.your_container_label.reprint.click
  step 'expect reprint modal on history is present'
end

#reprint container label
Then /^expect reprint modal on history is present$/ do
  expect(SdcHistory.modals.reprint.title).to be_present
end

Then /^expect reprint modal on history is not present$/ do
  expect(SdcHistory.modals.reprint.title).not_to be_present
end

Then /^click reprint button on reprint modal$/ do
  SdcHistory.modals.reprint.reprint.click
  step 'expect your container label modal on history is present'
end

#welcome modal
Then /^expect welcome modal on history is present$/ do
  expect(SdcHistory.modals.welcome.title).to be_present
end

Then /^expect welcome modal on history is not present$/ do
  expect(SdcHistory.modals.welcome.title).not_to be_present
end

Then /^close welcome modal on history$/ do
  welcome = SdcHistory.modals.welcome
  begin
    welcome.x_btn.click if welcome.title.present?
  rescue
    # ignore
  end
  step 'expect welcome modal on history is not present'
end

Then /^click next button on welcome modal$/ do
  SdcHistory.modals.welcome.next.click
end

Then /^click close button on welcome modal$/ do
  SdcHistory.modals.welcome.close.click
end

Then /^click through tutorial modal on history$/ do
  3.times do
    step 'click next button on welcome modal'
  end
  step 'click close button on welcome modal'
end

