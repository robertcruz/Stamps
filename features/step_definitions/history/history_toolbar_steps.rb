#
Then /^expect refund button on history toolbar is enabled$/ do
  expect(SdcHistory.toolbar.refund.class_disabled?).to be_falsy
end

Then /^click refund button on history toolbar$/ do
  SdcHistory.toolbar.refund.link.click
  #todo - do we need to add expectation of refund modal??
end

Then /^click schedule pickup button on history toolbar$/ do
  SdcHistory.toolbar.schedule_pickup.link.click
end

Then /^click create scan form button on history toolbar$/ do
  create_scan_form = SdcHistory.toolbar.create_scan_form
  create_scan_form.link.click
  if create_scan_form.tooltip.present?
    create_scan_form.tooltip.hover
    create_scan_form.link.click if create_scan_form.tooltip.present?
    create_scan_form.link.click
  end
end

Then /^hover on create scan form button tooltip on history toolbar$/ do
  SdcHistory.toolbar.create_scan_form.tooltip.hover if SdcHistory.toolbar.create_scan_form.tooltip.present?
end

Then /^click create return label button on history toolbar$/ do
  SdcHistory.toolbar.create_return_label.link.click
end

Then /^click cost codes button on history toolbar$/ do
  cost_codes = SdcHistory.toolbar.cost_codes
  cost_codes.link.click
  if cost_codes.tooltip.present?
    cost_codes.tooltip.hover
    cost_codes.link.click if cost_codes.tooltip.present?
    cost_codes.link.click
  end
end

Then /^hover on cost codes button on history toolbar$/ do
  SdcHistory.toolbar.cost_codes.link.hover
end

Then /^hover on cost codes button tooltip on history toolbar$/ do
  SdcHistory.toolbar.cost_codes.tooltip.hover if SdcHistory.toolbar.cost_codes.tooltip.present?
end


Then /^click create container label on history toolbar$/ do
  create_container_label = SdcHistory.toolbar.create_container_label
  create_container_label.link.click
  create_container_label.tooltip.safe_wait_until_present(timeout: 3)
  if create_container_label.tooltip.present?
    create_container_label.link.click
    create_container_label.tooltip.safe_wait_until_present(timeout: 2)
    create_container_label.link.click
  end
end

Then /^hover on create container label tooltip on history toolbar$/ do
  SdcHistory.toolbar.create_container_label.tooltip.hover if SdcHistory.toolbar.create_container_label.tooltip.present?
end

#schedule pickup
Then /^click all eligible packages button on history toolbar schedule pickup$/ do
  SdcHistory.toolbar.schedule_pickup.all_eligible_packages.click
end

Then /^expect selected packages button on history toolbar schedule pickup is enabled$/ do
  expect(SdcHistory.toolbar.schedule_pickup.selected_packages.class_disabled?).to be_falsy
end

Then /^click selected packages button on history toolbar schedule pickup$/ do
  SdcHistory.toolbar.schedule_pickup.selected_packages.click
end

Then /^click manage pickups button on history toolbar schedule pickup$/ do
  SdcHistory.toolbar.schedule_pickup.manage_pickups.click
end

#create scan form
Then /^click all eligible packages button on history toolbar create scan form$/ do
  SdcHistory.toolbar.create_scan_form.all_eligible_packages.click
end

Then /^expect selected packages button on history toolbar create scan form is enabled$/ do
  expect(SdcHistory.toolbar.create_scan_form.selected_packages.class_disabled?).to be_falsy
end

Then /^click selected packages button on history toolbar create scan form$/ do
  SdcHistory.toolbar.create_scan_form.selected_packages.click
end

Then /^click reprint scan form button on history toolbar create scan form$/ do
  SdcHistory.toolbar.create_scan_form.reprint_scan_form.click
end

#cost code
Then /^expect change cost codes button on history toolbar cost codes is enabled$/ do
  expect(SdcHistory.toolbar.cost_codes.change_cost_code.class_disabled?).to be_falsy
end

Then /^click change cost codes button on history toolbar cost codes$/ do
  SdcHistory.toolbar.cost_codes.change_cost_code.click
end

Then /^click add\/edit cost codes button on history toolbar cost codes$/ do
  SdcHistory.toolbar.cost_codes.add_edit_cost_codes.click
end

#container label
Then /^click all eligible packages button on history toolbar create container label$/ do
  SdcHistory.toolbar.create_container_label.all_eligible_packages.click
  # expect modal step ''
end

Then /^expect selected packages button on history toolbar create container label is enabled$/ do
  expect(SdcHistory.toolbar.create_container_label.selected_packages.class_disabled?).to be_falsy
end

Then /^click selected packages on history toolbar create container label$/ do
  step 'expect selected packages button on history toolbar create container label is enabled'
  SdcHistory.toolbar.create_container_label.selected_packages.click
  step 'expect container label modal on history is present'
end

Then /^expect reprint last label on history toolbar create container label is enabled$/ do
  expect(SdcHistory.toolbar.create_container_label.reprint_last_label.class_disabled?).to be_falsy
end

Then /^click reprint last label button on history toolbar create container label$/ do
  SdcHistory.toolbar.create_container_label.reprint_last_label.click
  # expect modal step ''
end


