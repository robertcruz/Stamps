
Then /^Print (?:[Pp]ostage|[Ll]abel|[Ss]tamps|[Ee]nvelope) using [Ss]plit [Bb]utton$/ do
  pending #stamps.mail.toolbar_menu.print_button.click
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ii]ncomplete [Ff]ields [Dd]ialog is [Pp]resent$/ do
  pending
  #expect(stamps.mail.mail_toolbar.print_postage_expecting_error).to eql('Incomplete Fields')
end


Then /^[Ee]xpect [Pp]rint [Ff]orm [Ww]arning [Mm]essage is (.*)/ do |str|
  pending
  # step "expect Print form Incomplete Fields dialog is present"
  # expect(stamps.mail.mail_modals.incomplete_fields.warning_message.text).to include(str)
end

Then /^click print button on mail print modal$/ do
  SdcMail.modals.print.button.click
  step 'expect print modal on mail is not present'
end

Then /^set mail print modal printer ?(?:|(.*))$/ do |str|
  #step "expect orders print modal is present"
  #step "orders print modal printer dropdown is present"
  expect(TestData.hash[:printer] = (str.nil?) ? TestSession.env.printer : str).to_not be_nil, "PRINTER parameter is not defined. Printing tests must define PRINTER value either in cucumber.yml file or in Jenkins."
  if TestData.hash[:printer].include?('\\') #validate printer format
    expect(TestData.hash[:printer]).to match(/\\.+\.*/)
    TestData.hash[:printer] = /\\\\(.+)\\/.match(TestData.hash[:printer])[1]
  end
  printer = SdcMail.modals.print.printer
  printer.selection_element(value: TestData.hash[:printer])
  printer.drop_down.click unless printer.selection.present?
  printer.selection.click
  expect(printer.text_field.text_value).to include(TestData.hash[:printer]), "Unable to select printer \"#{TestData.hash[:printer]}\". \nMake sure \"#{TestData.hash[:printer]}\" is configured for host #{SdcEnv.hostname}. \nUSR: #{TestData.hash[:username]}, #{SdcGlobal.web_app.to_s.capitalize}(#{TestSession.env.url.upcase})"
end

Then /^[Cc]lose [Mm]ail [Pp]rint [Mm]odal$/ do
  pending
  # stamps.mail.mail_toolbar.mail_print_modal.x_button.click #todo-Rob refactor Print Modal to stamps.mail.modals.mail_print_modal
end

Then /^[Ee]xpect [Mm]ail [Pp]rint modal is present$/ do
  pending
  # stamps.mail.mail_toolbar.print_postage.wait_until_present(5)
  # expect(stamps.mail.mail_toolbar.print_postage).to be_present, "Mail Print modal is NOT present"
end

When /^Mail: Print International Postage$/ do
  pending
  # stamps.mail.mail_toolbar.print_international
end

#todo-Rob fix code smells
When /^[Cc]lick Print button on [Mm]ail [Pp]rint modal Sample$/ do
  pending
  # mail_print_modal = stamps.mail.mail_toolbar.print_sample
  # @printer = mail_print_modal.printer.textbox.text
  # @paper_tray = mail_print_modal.paper_tray.textbox.text
  # @printing_error = mail_print_modal.print
end

Then /^Mail: in Print modal, Close$/ do
  pending
  # stamps.mail.mail_toolbar.mail_print_modal.x_button.click
end

Then /^expect print modal on mail is not present$/ do
  expect(SdcMail.modals.print.title).not_to be_present
end