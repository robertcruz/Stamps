Then /^expect clear contacts pop up box is displayed$/ do
  clear_contacts = SdcContacts.details.clear_contacts
  clear_contacts.title.safe_wait_until_present(timeout: 15)
  expect(clear_contacts.title.present?).to be(true)
end

Then /^fetch the body text of clear contacts pop up window$/ do
  clear_contacts = SdcContacts.details.clear_contacts
  clear_contacts.window_text.safe_wait_until_present(timeout: 15)
  SdcContacts.info clear_contacts.window_text.text_value  
end

Then /^click on close button of clear contacts pop up window$/ do
  clear_contacts = SdcContacts.details.clear_contacts
  clear_contacts.close_icon.safe_wait_until_present(timeout: 15)
  clear_contacts.close_icon.click
end

Then /^click on yes button of clear contacts pop up window$/ do
  clear_contacts = SdcContacts.details.clear_contacts
  clear_contacts.yes_button.safe_wait_until_present(timeout: 15)
  clear_contacts.yes_button.click
end

Then /^click on no button of clear contacts pop up window$/ do
  clear_contacts = SdcContacts.details.clear_contacts
  clear_contacts.no_button.safe_wait_until_present(timeout: 15)
  clear_contacts.no_button.click
end