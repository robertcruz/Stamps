
Then /^navigate to (.+)$/ do |str|
  nav_element = SdcNavigation.nav_element(str)
  nav_element.wait_until_present(timeout: 20)
  expect(nav_element).to be_present
  nav_element.click
  case(str.downcase.to_sym)
  when :mail
    SdcMail.print_on.label.wait_until_present(timeout: 15)
  when :orders
    step 'click through tutorial modal'
    SdcOrders.loading_orders.safe_wait_until_present(timeout: 7)
    SdcOrders.loading_orders.safe_wait_while_present(timeout: 10)
    OrdersGrid.body.wait_until_present(timeout: 20)
  when :contacts
    step 'click through tutorial modal'
    SdcContacts.loading_contacts.safe_wait_until_present(timeout: 20)
    SdcContacts.loading_contacts.safe_wait_while_present(timeout: 45)
    SdcContacts::Grid.body.safe_wait_until_present(timeout: 20)
  when :history
    step 'close welcome modal on history'
    step 'wait while loading history grid'
  when :reports
    step 'close welcome modal on reports'
    step 'wait while loading reports grid'
  when :products
    step 'click through tutorial modal'
    SdcOrders.loading_orders.safe_wait_until_present(timeout: 7)
    SdcOrders.loading_orders.safe_wait_while_present(timeout: 10)
  when :supplies
  end
end

Then /^wait while loading history grid$/ do
  SdcHistory.loading.safe_wait_until_present(timeout: 8)
  SdcHistory.loading.wait_while_present(timeout: 240)
end

Then /^hover on navigation history then select (.+)$/ do |str|
  nav_element = SdcNavigation.nav_element('History')
  nav_element.wait_until_present(timeout: 20)
  nav_element.hover
  SdcNavigation.history_selection(str).click
end

Then /^save balance amount$/ do
  TestData.hash[:old_balance] = SdcWebsite.navigation.balance.amount.text_value.parse_digits.to_f
end

Then /^on add funds modal, purchase 10$/ do
  SdcWebsite.navigation.balance.add_funds.buy_10.select
end

Then /^on add funds modal, purchase 25$/ do
  pending
  SdcWebsite.navigation.balance.add_funds.buy_25.select
end

Then /^on add funds modal, purchase 50$/ do
  pending
  SdcWebsite.navigation.balance.add_funds.buy_50.select
end

Then /^on add funds modal, purchase 100$/ do
  pending
  SdcWebsite.navigation.balance.add_funds.buy_100.select
end

Then /^on add funds modal, purchase other amount (\d+)$/ do |amount|
  pending
  SdcWebsite.navigation.balance.add_funds.buy_other.select
  SdcWebsite.navigation.balance.add_funds.buy_other_amount.set(amount)
end

Then /^on add funds modal, click purchase button$/ do
  SdcWebsite.navigation.balance.add_funds.purchase.click
  expect(SdcWebsite.navigation.balance.confirm_transaction.title).to be_present
end

Then /^buy mail confirm transction: click confirm button$/ do
  pending
  SdcWebsite.navigation.balance.confirm_transaction.confirm.click
  SdcWebsite.navigation.balance.processing_purchase.title.wait_while_present(timeout: 15)
  expect(SdcWebsite.navigation.balance.transaction_complete.title).to be_present
end

Then /^buy mail confirm purchase: expect text area contains, please confirm your \$(.*) postage purchase.$/ do |amount|
  str = "Please confirm that you wish to add $#{amount} to your account balance"
  result = SdcWebsite.navigation.balance.confirm_transaction.body.text_value
  expect(result).to include(str)
end

Then /^buy mail purchase approved: expect text area contains, your fund request for \$(.*) has been approved.$/ do |amount|
  str = "Your fund request for $#{amount} has been approved."
  result = SdcWebsite.navigation.balance.transaction_complete.body.text_value
  expect(result).to eql(str)
end

Then /^buy mail purchase approved: click ok button$/ do
  SdcWebsite.navigation.balance.transaction_complete.ok_btn.click
  expect(SdcWebsite.navigation.balance.transaction_complete.title).not_to be_present
end

Then /^buy mail: expect customer balance increased by \$(\d+)$/ do |str|
  str = str.to_f.round(2)
  value = SdcWebsite.navigation.balance.amount.text_value.parse_digits.to_f
  result = (value - TestData.hash[:old_balance].to_f).round(2)
  expect(result).to eql(str)
end