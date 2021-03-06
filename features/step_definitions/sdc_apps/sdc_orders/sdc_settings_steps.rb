Then /^set orders settings general postdate to (now [+-]\d+ hours|\d{1,2}:\d\d [ap].m.)$/ do |time|
  time = TestHelper.now_plus_hh(/[+-]\d+/.match(time).to_s.to_i) unless /^\d{1,2}:\d\d [ap].m.$/.match(time)
  settings = SdcOrders.modals.settings.general_settings
  3.times do
    selection = settings.selection(time)
    settings.postdate_drop_down.click
    selection.scroll_into_view
    selection.click
    break if settings.postdate_text_field.text_value.include?(time)
  end
  expect(settings.postdate_text_field.text_value).to include(time)
end

Then /^[Oo]pen [Oo]rders [Ss]ettings [Mm]odal$/ do
  SdcOrders.toolbar.settings.click
  SdcOrders.modals.settings.title.wait_until_present(timeout: 5)
  # step 'Wait until Orders Settings Modal present 40, 3'
  expect(SdcOrders.modals.settings.title).to be_present
end

Then /^[Ww]ait [Uu]ntil [Oo]rders [Ss]ettings [Mm]odal [Pp]resent(?: (\d+), (.+)|)$/ do |iteration, delay|
  (iteration.zero? ? 20 : iteration).times do
    break if SdcOrders.modals.settings.title.present?
    sleep(delay.to_f.zero? ? 0.2 : delay.to_f / 10)
  end
end

Then /^open orders settings general settings$/ do
  step 'Open Orders settings modal'
  SdcOrders.modals.settings.general.click
  SdcOrders.modals.settings.general_settings.title.wait_until_present(timeout: 40, interval: 0.2)
  expect(SdcOrders.modals.settings.general_settings.title.text).to eql 'General Settings'
end

Then /^close orders settings modal$/ do
  SdcOrders.modals.settings.close.click
  SdcOrders.modals.settings.close.wait_while_present(timeout: 50, interval: 0.2)
  expect(SdcOrders.modals.settings.general_settings.title).not_to be_present, "Order Settings modal present"
end

#OK
Then /^set mail settings postdate to (now [+-]\d+ hours|\d{1,2}:\d\d [ap].m.)$/ do |time|
  time = TestHelper.now_plus_hh(/[+-]\d+/.match(time).to_s.to_i) unless /^\d{1,2}:\d\d [ap].m.$/.match(time)
  settings = SdcMail.modals.settings
  settings.selection(time)
  settings.postdate_drop_down.click
  settings.selection_obj.scroll_into_view.click
  expect(settings.postdate_text_field.text_value).to include(time), "Postdate was not selected"
end

#FIX
Then /^open mail settings modal$/ do
  SdcMail.toolbar.settings.click
  SdcMail.modals.settings.title.wait_until_present(timeout: 5)
  # step 'Wait until Orders Settings Modal present 40, 3'
  expect(SdcMail.modals.settings.title).to be_present, "Mail Settings modal is not present"
end

#FIX
Then /^wait until mail settings modal present(?: (\d+), (.+)|)$/ do |iteration, delay|
  (iteration.zero? ? 20 : iteration).times do
    break if SdcMail.modals.settings.title.present?
    sleep(delay.to_f.zero? ? 0.2 : delay.to_f / 10)
  end
end

#FIX
Then /^close mail settings modal$/ do
  SdcMail.modals.settings.close.click
  SdcMail.modals.settings.close.wait_while_present(timeout: 50, interval: 0.2)
  expect(SdcMail.modals.settings.title).not_to be_present, "Mail Settings modal present"
end


# general_settings = SdcOrders.modals.settings.general_settings
# general_settings.close.click
# general_settings.title.wait_while_present(timeout: 50, interval: 0.2)
# expect(general_settings.title).not_to be_present, "Order Settings modal present"
