Then /^expect delete contacts modal is displayed$/ do
  message_box = SdcContacts.modals.delete_contact
  message_box.title.safe_wait_until_present(timeout: 10)
end

Then /^click yes button on delete contacts modal$/ do
  message_box = SdcContacts.modals.delete_contact
  message_box.yes_button.safe_wait_until_present(timeout: 10)
  message_box.yes_button.click
  contacts_grid = SdcContacts.grid.body
  contacts_grid.wait_until_present(timeout: 20)
end

Then /^click no button on delete contacts modal$/ do
  message_box = SdcContacts.modals.delete_contact
  message_box.no_button.safe_wait_until_present(timeout: 10)
  message_box.no_button.click
  contacts_grid = SdcContacts.grid.body
  contacts_grid.wait_until_present(timeout: 20)
end

Then /^click close button on delete contacts modal$/ do
  message_box = SdcContacts.modals.delete_contact
  message_box.close.safe_wait_until_present(timeout: 10)
  message_box.close.click
  contacts_grid = SdcContacts.grid.body
  contacts_grid.wait_until_present(timeout: 20)
end
