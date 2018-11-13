Then /^click mail toolbar reset button|reset all fields$/ do
  SdcMail.toolbar.reset.click
end

Then /^click mail toolbar feedback$/ do
  SdcMail.toolbar.feedback.click
  step 'expect feedback modal is present'
end

Then /^click mail toolbar settings$/ do
  SdcMail.toolbar.settings.click
  step 'expect settings modal is present'
end

Then /^click print stamps$/ do
  SdcMail.toolbar.print_label.click
end

Then /^click print label$/ do
  step 'blur out on print form'
  sleep 2
  SdcMail.toolbar.print_label.click
end

Then /^click continue on confirm print modal$/ do
  SdcMail.modals.incomplete_fields
  comfirm_print = SdcMail.modals.comfirm_print
  comfirm_print.continue.safe_wait_until_present(timeout: 2)
  if comfirm_print.continue.present?
    3.times do
      comfirm_print.continue.safe_click
      break unless comfirm_print.continue.present?
    end
  end
  expect(comfirm_print.continue.present?).to be(false)
end

Then /^expect postage message panel tracking label is (.+)$/ do |str|
  message_panel = SdcMail.print_form.message_panel
  message_panel.tracking_label.wait_until_present(timeout: 40)
  expect(message_panel.tracking_label.text.strip).to include str
end

Then /^save tracking number on print form message panel$/ do
  message_panel = SdcMail.print_form.message_panel
  message_panel.tracking_number.wait_until_present(timeout: 40)
  TestData.hash[:tracking_number] = message_panel.tracking_number.text.strip
  expect(TestData.hash[:tracking_number].size).to be > 12
end

Then /^click print label expecting no errors$/ do
  step 'click print label'
  step 'click continue on confirm print modal'
  step 'expect incomplete fields modal is not present'
end

Then /^click mail toolbar print$/ do
  step 'expect mail toolbar print is present'
  SdcMail.toolbar.print.click
end

Then /^expect mail toolbar print button label is (.+)$/ do |str|
  toolbar = SdcMail.toolbar
  begin
    SdcPage.browser.wait_until(timeout: 3) do
      toolbar.print_button.text.eql? str
    end
  rescue
    # ignore
  end
  expect(toolbar.print_button.text).to eql str
end

Then /^expect mail toolbar print is present$/ do
  expect(SdcMail.toolbar.print).to be_present
end

Then /^hover on mail toolbar print dropdown$/ do
  SdcMail.toolbar.print_dropdown.hover
end

Then /^click mail toolbar print dropdown$/ do
  SdcMail.toolbar.print_dropdown.click
end

Then /^expect mail toolbar print dropdown tooltip is present$/ do
  step 'wait for mail toolbar print dropdown tooltip'
  expect(SdcMail.toolbar.print_dropdown_tooltip).to be_present
end

Then /^expect mail toolbar print dropdown tooltip is not present$/ do
  step 'wait for mail toolbar print dropdown tooltip'
  expect(SdcMail.toolbar.print_dropdown_tooltip).not_to be_present
end

Then /^wait for mail toolbar print dropdown tooltip$/ do
  SdcMail.toolbar.print_dropdown_tooltip.wait_until_present
end

Then /^hover on mail toolbar print dropdown tooltip$/ do
  SdcMail.toolbar.print_dropwown_tooltip.hover if SdcMail.toolbar.print_dropwown_tooltip.present?
end

Then /^click mail toolbar print (?:postage|label|stamps|envelope)$/ do
  SdcMail.toolbar.print_label.click
end

Then /^click mail toolbar print sample$/ do
  SdcMail.toolbar.print_sample.click
end

Then /^expect mail toolbar print (?:postage|label|stamps|envelope) is present$/ do
  expect(SdcMail.toolbar.print).to be_present, "Toolbar Print button is not present"
end
Then /^expect mail toolbar print sample is present$/ do
  expect(SdcMail.toolbar.print).to be_present, "Toolbar Print button is not present"
end

Then /^click mail toolbar favorites$/ do
  step 'expect mail toolbar favorites is present'
  SdcMail.toolbar.favorites.click
  step 'hover on mail toolbar favorites tooltip'
end

Then /^hover on mail toolbar favorites tooltip$/ do
  SdcMail.toolbar.favorites_tooltip.hover if SdcMail.toolbar.favorites_tooltip.present?
end

Then /^expect mail toolbar favorites is present$/ do
  expect(SdcMail.toolbar.favorites).to be_present, "Toolbar Favorites button is not present"
end

Then /^click mail toolbar save as favorite$/ do
  step 'expect mail toolbar save as favorite is present'
  SdcMail.toolbar.save_as_favorite.click
  step 'expect save as favorite modal is present'
end

Then /^click mail toolbar manage favorites$/ do
  SdcMail.toolbar.manage_favorites.click
  step 'expect manage favorites modal is present'
end

Then /^expect mail toolbar save as favorite is present$/ do
  expect(SdcMail.toolbar.save_as_favorite).to be_present, "Toolbar Save as favorite is not present"
end
Then /^expect mail toolbar manage favorites is present$/ do
  expect(SdcMail.toolbar.manage_favorites).to be_present, "Toolbar Manage favorites is not present"
end