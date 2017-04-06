Then /^Print (?:Postage|Label|Stamps|Envelope)$/ do
  stamps.mail.mail_toolbar.print_postage
end

When /^[Cc]lick Mail Print modal Print button$/ do
  stamps.mail.mail_toolbar.print_postage.print
end

Then /^[Ss]et Mail Print modal Printer to (.*)$/ do |printer|
  test_parameter[:printer] = printer
  stamps.mail.mail_toolbar.print_postage.printer.select(test_parameter[:printer])
end

When /^Mail: Print International Postage$/ do
  stamps.mail.mail_toolbar.print_international
end

When /^[Cc]lick Print button on Mail Print modal Sample$/ do
  mail_print_modal = stamps.mail.mail_toolbar.print_sample
  @printer = mail_print_modal.printer.text_box.text
  @paper_tray = mail_print_modal.paper_tray.text_box.text
  @printing_error = mail_print_modal.print
end

Then /^Mail: in Print modal, Close$/ do
  stamps.mail.stamps.mail.close
end





