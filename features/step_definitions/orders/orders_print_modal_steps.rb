

Then /^[Ii]n [Pp]rint [Mm]odal, click [Pp]rint button Incomplete Order$/ do
  pending
  # @incomplete_order_modal = stamps.orders.orders_toolbar.toolbar_print.click
  # unless @incomplete_order_modal.instance_of? Orders::Toolbar::PrintIncompleteOrderError
  #   expect("Incomplete Order Modal did not open").to eql "click print modal print button Incomplete Order"
  # end
end

Then /^[Cc]lick Orders Toolbar Print button expecting incomplete order$/ do
  pending
  #  @incomplete_order_modal = stamps.orders.orders_toolbar.toolbar_print.click #this needs to change
  # expect("Incomplete Order Modal did not open").to eql "click print modal print button Incomplete Order" unless @incomplete_order_modal.instance_of? Orders::Toolbar::PrintIncompleteOrderError
end

Then /^[Ee]xpect [Pp]rint [Mm]odal Incomplete Order Error Message (.*)$/ do |expectation|
  # expect(@incomplete_order_modal.error_message).to include(expectation)
end

Then /^in print modal, click close button$/ do
  SdcOrders.modals.print.close.click
end

Then /^[Ss]et [Pp]rint [Mm]odal [Pp]rinter to \"(.*)\"$/ do |printer|
  pending
  #step "orders print modal printer dropdown is present"
  # stamps.orders.modals.orders_print_modal.printer.select(printer)
end

Then /^set orders print modal printer ?(?:|(.*))$/ do |str|
  step "expect orders print modal is present"
  step "orders print modal printer dropdown is present"
  expect(TestData.hash[:printer] = (str.nil?) ? TestSession.env.printer : str).to_not be_nil, "PRINTER parameter is not defined. Printing tests must define PRINTER value either in cucumber.yml file or in Jenkins."
  if TestData.hash[:printer].include?('\\') #validate printer format
    expect(TestData.hash[:printer]).to match(/\\.+\.*/)
    TestData.hash[:printer] = /\\\\(.+)\\/.match(TestData.hash[:printer])[1]
  end
  printer = SdcOrders.modals.print.printer
  printer.selection_element(value: TestData.hash[:printer])
  printer.drop_down.click unless printer.selection.present?
  printer.selection.click
  expect(printer.text_field.text_value).to include(TestData.hash[:printer]), "Unable to select printer \"#{TestData.hash[:printer]}\". \nMake sure \"#{TestData.hash[:printer]}\" is configured for host #{SdcEnv.hostname}. \nUSR: #{TestData.hash[:username]}, #{SdcGlobal.web_app.to_s.capitalize}(#{TestSession.env.url.upcase})"
end

Then /^orders print modal printer dropdown is present$/ do
  expect(SdcOrders.modals.print.printer.drop_down).to be_present, "StampsConnect is not connected. You might need to re-login to this PC: #{SdcEnv.hostname}"
end

Then /^[Cc]lick [Pp]rint [Mm]odal [Pp]rint [Bb]utton$/ do
  SdcWebsite.orders.modals.print.print.click
end

Then /^[Cc]lick [Pp]rint [Mm]odal [Pp]rint [Bb]utton for SAS$/ do
  pending
  #  expect(stamps.orders.modals.orders_print_modal.print_fci_sas).to eql("Your GlobalPost Label"), "Your GlobalPost Label window is not present"
end

Then /^[Ee]xpect [Oo]rders [Pp]rint [Mm]odal is [Pp]resent$/ do
  expect(SdcOrders.modals.print.title).to be_present, "Orders Print modal is NOT present"
end

Then /^[Pp]rint [Ss]hipping [Ll]abel for SAS$/ do
  step "click Orders Toolbar Print button"
  step "click print modal print button"
end

Then /^ReIn [Pp]rint modal, Reprint$/ do
  pending
  #stamps.orders.orders_toolbar.reprint.reprint
end

Then /^set print modal ship date to today$/ do
  step 'set print modal ship date to today plus 0'
end

# Then /^set print modal ship date to (?:today|today plus (\d+))$/ do |day|
Then /^set print modal ship date to today plus (\d+)$/ do |day|
  step "expect print modal ship date drop down is present"
  text_field = SdcOrders.modals.print.ship_date.text_field
  date = TestHelper.mail_date_text_field_format(day)
  text_field.set_attribute('value', date)
  step "blur out on print modal ship date 5"
  expect(text_field.value).to eql(date)
end

Then /^[Ss]elect [Pp]rint [Mm]odal [Ss]hip [Dd]ate [Dd]atepicker to (?:today|today plus (\d+))$/ do |day|
  date = TestHelper.parse_date(TestHelper.shipdate_today_plus(day))
  ship_date = SdcOrders.modals.print.ship_date
  ship_date.drop_down.click
  expect(ship_date.datepicker.head_link).to be_present, "Datepicker is not present"
  step "select month and year on month picker #{date[:month]} #{date[:year]}"
  expect(ship_date.datepicker.head_link.text_value).to include(date[:month]), "Correct month is not selected on the datepicker"
  expect(ship_date.datepicker.head_link.text_value).to include(date[:year]), "Correct year is not selected on the datepicker"
  ship_date.datepicker.selection_day(date[:day])
  ship_date.datepicker.day.click unless ship_date.datepicker.day.class_disabled?
end

Then /^[Ss]elect [Mm]onth and [Yy]ear on [Mm]onth [Pp]icker ([a-zA-Z]+) (\d{4})$/ do |month, year|
  datepicker = SdcOrders.modals.print.ship_date.datepicker
  expect(datepicker.head_link).to be_present, "Datepicker is not present"
  unless datepicker.head_link.text_value.include?(month) && datepicker.head_link.text_value.include?(year)
    datepicker.head_link.safe_click
    expect(datepicker.month_picker).to be_present, "Print Modal Ship Date Month Picker is not present"
    datepicker.month_picker.selection_month(month[0..2])
    datepicker.month_picker.month.safe_click if datepicker.month_picker.month.present?
    datepicker.month_picker.selection_year(year)
    datepicker.month_picker.year.safe_click if datepicker.month_picker.year.present?
    datepicker.month_picker.ok.safe_click
  end
end


Then /^[Cc]lear [Pp]rint [Mm]odal [Ss]hip [Dd]ate$/ do
  10.times do
    SdcOrders.modals.print.ship_date.text_field.clear
    sleep(0.2)
    break if SdcOrders.modals.print.ship_date.text_field.text_value.eql?("")
  end
  step "blur out on print modal ship date 10"
end

Then /^blur out on print modal ship date (\d+)$/ do |count|
  count.times do
    SdcOrders.modals.print.total.safe_click
    SdcOrders.modals.print.total.safe_double_click
    sleep(0.2)
  end
end

Then /^set print modal ship date calendar to (?:today|today plus (\d+))$/ do |day|
  step "expect print modal ship date drop down is present"
  stamps.orders.modals.orders_print_modal.ship_date.date_picker.today_plus(day.nil? ? '0' : day)  #If print date is today, set day increase to zero, otherwise set to 'day' value
  step "expect print modal ship date is #{day} days from today"
end

Then /^expect print modal ship date is (\d+) (?:day|days) from today$/ do |day|
  step 'expect print modal ship date drop down is present'
  expectation = TestHelper.mail_date_text_field_format(day)
  ship_date = SdcOrders.modals.print.ship_date
  begin
    SdcPage.browser.wait_until(timeout: 3) do
      ship_date.text_field.text_value.eql? expectation
    end
  rescue
    # ignore
  end
  result = ship_date.text_field.text_value
  expect(result).to eql(expectation)
end

Then /^expect print modal ship date drop down is present$/ do

  expect(SdcOrders.modals.print.ship_date.drop_down).to be_present
end

Then /^[Ii]n [Pp]rint modal, check Hide Mail Value$/ do
  #expect(stamps.orders.modals.orders_print_modal.print_options.hide_postage_value).to
end

Then /^[Ii]n [Pp]rint modal, uncheck Hide Mail Value$/ do
  pending
  #stamps.orders.modals.orders_print_modal.print_options.hide_postage_value.uncheck
end

Then /^[Ee]xpect [Pp]rint [Mm]odal Hide Mail Value CheckBox is checked$/ do
  pending
  #  # 30.times do
  #   stamps.orders.modals.orders_print_modal.click
  #   break if stamps.orders.modals.orders_print_modal.print_options.hide_postage_value.checked?
  # end
  # expect(stamps.orders.modals.orders_print_modal.print_options.hide_postage_value.checked?).to be(true)
end

Then /^[Ii]n [Pp]rint modal, check Email Tracking Details to Recipients$/ do
  pending
  #stamps.orders.modals.orders_print_modal.print_options.email_tracking.check
end

Then /^[Ii]n [Pp]rint modal, uncheck Email Tracking Details to Recipients$/ do
  pending
  #stamps.orders.modals.orders_print_modal.print_options.email_tracking.uncheck
end

Then /^[Ii]n [Pp]rint modal, uncheck [Pp]rint Reference # on Shipping Label$/ do
  pending
  #stamps.orders.modals.orders_print_modal.print_options.print_reference_no.uncheck
end

Then /^[Ii]n [Pp]rint modal, check [Pp]rint Reference # on Shipping Label$/ do
  pending
  #stamps.orders.modals.orders_print_modal.print_options.print_reference_no.check
end

When /^[Ss]elect [Pp]rint [Mm]odal left-side label$/ do
  pending
  #stamps.orders.modals.orders_print_modal.starting_label.select_left_label
end

When /^[Ss]elect [Pp]rint [Mm]odal right-side label$/ do
  pending
  #stamps.orders.modals.orders_print_modal.starting_label.select_right_label
end

Then /^[Ee]xpect [Pp]rint [Mm]odal right-side label is selected$/ do
  pending
  #expect(stamps.orders.modals.orders_print_modal.starting_label.right_selected?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Mm]odal left-side label is selected$/ do
  pending
  #expect(stamps.orders.modals.orders_print_modal.starting_label.left_selected?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Mm]odal [Pp]review [Ll]abel is displayed$/ do
  pending
  #expect(stamps.orders.modals.orders_print_modal.starting_label.label_displayed?).to be(true), "Label Preview Image is not Displayed"
end

Then /^set print modal print-on to (.*)$/ do |str|
  print_on = SdcOrders.modals.print.print_on
  print_on.selection(str)
  print_on.drop_down.click unless print_on.selection_obj.present?
  print_on.selection_obj.safe_click unless print_on.selection_obj.class_disabled?
  expect(print_on.text_field.text_value).to eql(str)
end

Then /^[Ee]xpect [Pp]rint [Mm]odal [Pp]rinting On Label is (.*)$/ do |expectation|
  pending
  #expect(stamps.orders.modals.orders_print_modal.printing_on.label.text).to eql expectation
end

Then /^[Ss]elect [Pp]rinter \"(.*)\"$/ do |printer|
  # step "orders print modal printer dropdown is present"
  pending
    #stamps.orders.modals.orders_print_modal.printer.select(printer)
end

Then /^close print modal$/ do
  SdcOrders.modals.print.close.click
end

Then /^Close Reprint Modal$/ do
  stamps.orders.orders_toolbar.reprint.close
end

Then /^[\w]lose Label Unavailable Modal$/ do
  pending
  #stamps.orders.orders_toolbar.ok.close
end


#todo-Rob Rework print_expecting_error
Then /^Print Order expecting error (.*)$/ do |error_message|
  pending
  #modal = stamps.orders.orders_toolbar.toolbar_print.print_expecting_error  #updated reference for printer_expecting_error
  # error_message = error_message.gsub("\\n","\n") #reformatting newline character to match actual character in modal
  # actual = modal.error_message
  # modal.ok
  # expect(actual).to include error_message
end

Then /^[Pp]rint expecting (.*) selected orders have errors and cannot be printed. To print the remaining orders, click Continue.$/ do |error_message|
  pending
  #modal = stamps.orders.modals.orders_print_modal.print_expecting_error
  # actual = modal.error_message
  # modal.continue.print
  # expect(actual).to eql "#{error_message} selected orders have errors and cannot be printed.\nTo mail the remaining orders, click Continue."
end

Then /^[Pp]rint expecting invalid address error$/ do
  pending
  #stamps.orders.modals.orders_print_modal.print_invalid_address.close
end

When /^[Pp]rint expecting rating error$/ do
  pending
  #modal = stamps.orders.modals.orders_print_modal.print_expecting_rating_error
  # actual = modal.error_message
  # modal.close
  # expect(actual).to include "An error occurred while attempting to rate your mail"
end

When /^[Pp]rint expecting some orders can not be printed$/ do
  pending
  #modal = stamps.orders.modals.orders_print_modal.print_expecting_error
  # actual = modal.error_message
  # modal.continue.print
  # expect(actual).to include "To mail the remaining orders, click Continue"
end

Then /^[Ee]xpect [Pp]rint [Mm]odal Title is \"You have (.*) label\(s\) ready to print\"$/ do |expectation|
  pending
  #actual = stamps.orders.modals.orders_print_modal.label_count
  # stamps.orders.modals.orders_print_modal.close
  # expect("You have #{actual} label(s) ready to mail").to eql("You have #{expectation} label(s) ready to mail")
end

Then /^[Ee]xpect [Pp]rint [Mm]odal number of required label sheets is (\d+)$/ do |sheets|
  pending
  #expect(stamps.orders.modals.orders_print_modal.label_count).to eql(sheets.to_i)
end

Then /^[Pp]rint raises a [Pp]rinting Error/ do
  pending
  #expect(stamps.orders.print.print_sample_expecting_error).to raise_error(PrintingError)
end

Then /^[Ii]n [Pp]rint modal, click [Pp]rint button Sample$/ do
  pending
  #stamps.orders.modals.orders_print_modal.print_sample
end

Then /^[Ii]n [Pp]rint modal, click [Pp]rint button Sample raises a [Pp]rinting Error/ do
  pending
  #expect(stamps.orders.modals.orders_print_modal.print_sample_expecting_error).to raise_error(PrintingError)
end
