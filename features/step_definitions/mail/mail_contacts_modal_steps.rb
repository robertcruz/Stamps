
Then /^expect search contacts modal is present$/ do
  expect(SdcMail.modals.search_contacts.title).to be_present
end

Then /^expect search contacts modal is not present$/ do
  expect(SdcMail.modals.search_contacts.title).not_to be_present
end

Then /^close search contacts modal$/ do
  SdcMail.modals.search_contacts.x_btn.click
  step 'expect search contacts modal is not present'
end


Then /^click mail-to link on print form$/ do
  mail_to = SdcMail.print_form.mail_to
  search_contacts = SdcMail.modals.search_contacts
  mail_to.link.wait_until_present(timeout: 5)
  expect(mail_to.link.text).to eql 'Mail To:'
  mail_to.link.click
  search_contacts.window.wait_until_present(timeout: 5)
  expect(search_contacts.window.present?).to be(true)
  expect(search_contacts.title.text).to eql 'Search Contacts'
end

Then /^check search contacts grid name (.+)$/ do |str|
  grid = SdcMail.modals.search_contacts.grid
  row = grid.row_number_for_name(str)
  checkbox = grid.checkbox_for_row(row)
  checkbox.check
  expect(checkbox.checked?).to be(true)
end

Then /^set search contacts grid name (.+)$/ do |str|
  search_filter = SdcMail.modals.search_contacts
  search_filter.search_text.set(str)
end

Then /^click search icon on search contacts modal$/ do
  search_contact_modal = SdcMail.modals.search_contacts
  search_contact_modal.search_icon.click
end


Then /^check search contacts grid row (\d+)$/ do |row|
  grid = SdcMail.modals.search_contacts.grid
  checkbox = grid.checkbox_for_row(row)
  checkbox.check
  expect(checkbox.checked?).to be(true)
end

Then /^expect search contacts filter panel selected count is (.+)$/ do |str|
  filter_panel = SdcMail.modals.search_contacts.filter_panel
  filter_panel.selected_count.wait_until_present(timeout: 5)
  if str.include? ' '
    opt = str.split(' ')[0]
    case opt
    when '>'
      expect(filter_panel.selected_count.text.to_i).to be > str.to_i
    when '<'
      expect(filter_panel.selected_count.text.to_i).to be < str.to_i
    end
  else
    expect(filter_panel.selected_count.text.to_i).to eql str.to_i
  end
end

Then /^expect search contacts filter panel all contacts count is (.+)$/ do |str|
  filter_panel = SdcMail.modals.search_contacts.filter_panel
  filter_panel.all_contacts_count.wait_until_present(timeout: 5)
  if str.include? ' '
    opt = str.split(' ')[0]
    case opt
    when '>'
      expect(filter_panel.all_contacts_count.text.to_i).to be > str.to_i
    when '<'
      expect(filter_panel.all_contacts_count.text.to_i).to be < str.to_i
    end
  else
    expect(filter_panel.all_contacts_count.text.to_i).to eql str.to_i
  end
end

Then /^expect select button count on search contacts toolbar is (.+)$/ do |str|

end

Then /^click selected tab on search contacts modal$/ do

end

Then /^click select button on search contacts modal$/ do
  search_contacts = SdcMail.modals.search_contacts
  toolbar = search_contacts.toolbar
  toolbar.select.click
  search_contacts.window.wait_while_present(timeout: 5)
  expect(search_contacts.window.present?).to be(false)
end

