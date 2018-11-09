
# common Print form steps for Envelope|Label|Roll|CM

Then /^set print form mail-to (?:|to )(?:|a )(?:|random )address(?: to| in| between|) (.*)$/ do |str|
  address = TestHelper.address_helper(str)
  mail_to = SdcMail.print_form.mail_to
  5.times do
    mail_to.text_area.set(address)
    step 'blur out on print form'
    sleep 1
    break if mail_to.add_button.present?
  end

  step 'blur out on print form'
  TestData.hash[:address] = address
end

Then /^select address from print form mail-to (.+), (.+)$/ do |name, company|
  step 'blur out on print form'
  mail_to = SdcMail.print_form.mail_to
  selection = mail_to.list_of_values(name, company)
  # add
  15.times do
    mail_to.text_area.set(name)
    mail_to.text_area.click
    mail_to.text_area.click
    selection.safe_wait_until_present(timeout: 3)
    selection.safe_click if selection.present?
    #break if mail_to.text_area.text_value.include?(company)
    break if mail_to.add.present?
  end
  expect(mail_to.add.present?).to be(true)
end

Then /^expect invalid contact selected modal is present$/ do
  invalid_contact = SdcMail.modals.invalid_contact_selected
  invalid_contact.window.safe_wait_until_present(timeout: 3)
  expect(invalid_contact.title.text.strip).to eql 'Invalid Contact Selected'
end

Then /^expect error message on invalid contact selected modal is (.*)$/ do |str|
  invalid_contact = SdcMail.modals.invalid_contact_selected
  invalid_contact.window.safe_wait_until_present(timeout: 3)
  expect(invalid_contact.body.text.strip).to eql str
end

Then /^click close button on invalid contact selected modal$/ do
  invalid_contact = SdcMail.modals.invalid_contact_selected
  invalid_contact.window.safe_wait_until_present(timeout: 3)
  10.times do
    if invalid_contact.title.present?
      invalid_contact.close_buttons.each { |button| SdcElement.new(button).safe_click }
    else
      break
    end
  end
end

Then /^expect mail-to add address email is (.*)$/ do |str|
  str ||= TestData.hash[:mail_to_add_address_email]
  add_address = SdcMail.modals.add_address
  expect(add_address.window.present?).to be(true)
  expect(add_address.email.text_value).to eql(str)
end

Then /^click add address button on print form$/ do
  step 'blur out on print form'
  mail_to = SdcMail.print_form.mail_to
  statusbar = SdcMail.statusbar
  add_address = SdcMail.modals.add_address
  5.times do
    mail_to.add_button.safe_click
    statusbar.total.blur_out
    break if add_address.window.present?
  end
  expect(add_address.title.text).to eql('Add Address')
end

Then /^select address from add address modal (.+), (.+)$/ do |name, company|
  add_address = SdcMail.modals.add_address
  invalid_contact = SdcMail.modals.invalid_contact_selected
  5.times do
    add_address.address.set(name)
    add_address.address.click
    add_address.address.click
    selection = add_address.list_of_values(name, company)
    selection.safe_wait_until_present(timeout: 3)
    selection.safe_click if selection.present?
    break if invalid_contact.window.present?
    break if add_address.address.text_value.include?(company)
  end

end

Then /^expect selected contacts count is (.+)$/ do |str|
  add_address = SdcMail.modals.add_address
  add_address.selected_contacts_count.wait_until_present(timeout: 5)
  begin
    SdcPage.browser.wait_until(timeout: 5) do
      add_address.selected_contacts_count.text.parse_digits.to_i.eql? str.to_i
    end
  rescue
    # ignore
  end
  expect(add_address.selected_contacts_count.text.parse_digits.to_i).to eql str.to_i
end

Then /^expect multiple contacts view is displayed$/ do
  multiple_contacts_view = SdcMail.modals.add_address.contacts_view
  expect(multiple_contacts_view.container.present?).to be(true)
end

Then /^expect multiple contacts view is not displayed$/ do
  multiple_contacts_view = SdcMail.modals.add_address.contacts_view
  expect(multiple_contacts_view.container.present?).to be(false)

end

Then /^expect multiple contacts view include (.+)$/ do |str|
  expectations = str.split(',').map(&:strip)
  add_address = SdcMail.modals.add_address
  add_address.contacts_view.container.wait_until_present(timeout: 5)
  contacts = []
  add_address.contacts_view.contacts_list.each { |contact| contacts[contacts.size] = contact.text }
  expectations.each { |contact| expect(contacts).to include contact }
end


Then /^on mail-to text box hover over contact (.*)$/ do |contact|
  contact_name = SdcMail.modals.add_address.contacts_view
  contact_count = contact_name.contacts_list.count
  #SdcLogger.info "Total no of contacts to hover are :#{contact_count}"
  i=0
  while i< contact_count
    if contact_name.contacts_list[i].attribute_value('title').include? contact
      #contact_name.contacts_list[i].flash
      contact_name.contacts_list[i].hover
      break
      #SdcLogger.info "Hover successful for contact ID:#{i}"
    end
    i=i+1
  end
end

Then /^expect tooltip of contact (.*) is correct$/ do |name|
  contact_name = SdcMail.modals.add_address.contacts_view
  contact_count = contact_name.contacts_list.count
  i=0
  while i< contact_count
    if contact_name.contacts_list[i].attribute_value('title').include? name
      contact_tooltip_data_email = contact_name.contacts_list[i].attribute_value("data-email")
      contact_tooltip_data_contact = contact_name.contacts_list[i].attribute_value("data-contact")
      tooltip = contact_tooltip_data_contact.split("<br>#{name}")
      address = tooltip[1].split("','AddressSummary'")
      concatenated_tooltip = name + address[0] +" " +contact_tooltip_data_email
      #SdcLogger.info "Concatenated tooltip for contact #{i} is " "\n" +" #{concatenated_tooltip}"
      tooltip_to_verify = "#{TestData.hash["#{name}_name"]}" + "<br>" "#{TestData.hash["#{name}_company"]}<br>#{TestData.hash["#{name}_street_address"]}<br>#{TestData.hash["#{name}_city"]}, #{TestData.hash["#{name}_state_abbvr"]} #{TestData.hash["#{name}_zip"]} #{contact_tooltip_data_email}"
      #SdcLogger.info "tooltip to verify for contact #{i} is " "\n" +" #{tooltip_to_verify}"
      expect(tooltip_to_verify).to eql(concatenated_tooltip)
      #SdcLogger.info "Expected and Actual tooltip for contact #{i} are same. Displayed as below : Actual #{concatenated_tooltip} and Expected :#{tooltip_to_verify} "
    end
    i=i+1
  end

end

Then /^expect remove button is available for contact (.*)$/ do |name|
  contact_name = SdcMail.modals.add_address.contacts_view
  contact_count = contact_name.contacts_list.count
  #SdcLogger.info "Total no of contacts to hover are :#{contact_count}"
  i=0
  while i< contact_count
    if contact_name.contacts_list[i].attribute_value("title").include? name
      expect(contact_name.remove_contact_button[i].present?).to be (true)
      break
    end
    i=i+1
  end
end

Then /^click remove button on contact (.*)$/ do |name|
  contact_name = SdcMail.modals.add_address.contacts_view
  contact_count = contact_name.contacts_list.count
  #SdcLogger.info "Total no of contacts to hover are :#{contact_count}"
  i=0
  while i< contact_count
    if contact_name.contacts_list[i].attribute_value("title").include? name
      contact_name.remove_contact_button[i].click
      break
    end
    i=i+1
  end

end

Then /^[Ee]xpect Print form Mail To is disabled$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.enabled?).to be(true), "Print form Mail To is NOT disabled"
end

Then /^click print form mail to link$/ do
  SdcMail.print_form.mail_to.link.click
  step 'expect search contacts modal is present'
end

Then /^set print form email tracking(?:| (.+))$/ do |str|
  str ||= TestHelper.rand_email
  email_tracking = SdcMail.print_form.email_tracking
  email_tracking.text_field.set(str)
  expect(email_tracking.text_field.text_value).to eql(str)
  TestData.hash[:email_tracking] = str
end

Then /^set print form insure for to \$(.+)$/ do |str|
  insure_for = SdcMail.print_form.insure_for
  insure_for.insurance.set(str)
  step 'blur out on print form'
  insure_for.insurance.safe_click
  step 'blur out on print form'
  step 'click through insurance terms and conditions'
  step 'blur out on print form'
  expect(insure_for.insurance.text_value.to_f).to eql(str.to_f)
  TestData.hash[:insure_for] = str
end

Then /^click through insurance terms and conditions$/ do
  # This is a work around, there's a bug in the code where there are more
  # than one Terms and Conditions modal on top of each other.
  insurance_terms = SdcWebsite.modals.insurance_terms
  insurance_terms.window.safe_wait_until_present(timeout: 2)
  5.times do
    if insurance_terms.title.present?
      window_title = 'Stamps.com Insurance Terms and Conditions'
      expect(insurance_terms.title.text).to eql window_title
      insurance_terms.i_agree_btns.each { |button| SdcElement.new(button).safe_click }
    else
      break
    end
  end
end

Then /^expect print form message toolbar is present$/ do
  step 'blur out on print form'
  message_toolbar = SdcMail.print_form.message_toolbar
  message_toolbar.message_label.safe_wait_until_present(timeout: 2)
  10.times do
    step 'blur out on print form'
    message_toolbar.message_label.safe_click
    break if message_toolbar.message_label.present?
  end
  expect(message_toolbar.message_label.present?).to be(true)
end

Then /^expect print form message toolbar reads (.+)$/ do |str|
  step 'blur out on print form'
  message_toolbar = SdcMail.print_form.message_toolbar
  message_toolbar.message_label.safe_wait_until_present(timeout: 2)
  10.times do
    step 'blur out on print form'
    message_toolbar.message_label.safe_click
    break if message_toolbar.message_label.present?
  end
  step 'blur out on print form'
  expect(message_toolbar.message_label.text.strip).to eql str
end

Then /^set print form tracking (.+)$/ do |value|
  step 'wait for js to stop'
  tracking = SdcMail.print_form.tracking
  tracking.tracking_element(name: "selection", value: value)
  tracking.drop_down.click unless tracking.selection.present?
  expect(tracking.selection).to be_present, "#{value} is not present in Tracking list"
  tracking.selection.click
  expect(tracking.text_field.text_value).to include(value)
end