
Then /^[Oo]n [Oo]rder [Dd]etails form, Delete Ship-From address (\w+)$/ do |address|
  # not implemented
end

Then /^[Oo]n Manage Shipping Address modal, delete all addresses$/ do
  #test_config.logger.step "on Manage Shipping Address modal, delete all addresses"
  # stamps.orders.order_details.single_ship_from.select("Manage Shipping Addresses").delete_all.close_window
  stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses')
  stamps.orders.modals.manage_shipping_addresses.delete_all
  stamps.orders.modals.manage_shipping_addresses.close_window
end

Then /^[Oo]n Manage Shipping Address modal, delete Row (\d+) from Manage Shipping Addresses Modal/ do |row|
  stamps.orders.order_details.single_ship_from.select("Manage Shipping Addresses").delete_row(row)
end

Then /^[Oo]n Manage Shipping Address modal, edit address for name=\"(.*)\", company=\"(.*)\" and city=\"(.*)\" to;$/ do |name, company, city, new_address|
  ship_address_modal=stamps.orders.order_details.single_ship_from.select "Manage Shipping Addresses"
  add_shipping_address=ship_address_modal.select_address(name, company, city)
  add_shipping_address.ship_from_address new_address.hashes.first
end

Then /^[Aa]dd random Ship-from address from (.*)$/ do |address|
  test_param[:ship_from_address]=helper.address_helper_zone(address)

  stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses').add.ship_from_address(test_param[:ship_from_address])
end

Then /^[Oo]n Manage Shipping Address modal, add address$/ do |ship_from|
  test_param[:ship_from_address]=ship_from.hashes.first
  test_param[:ship_from_zip]=test_param[:ship_from_address]['ship_from_zip']
  #step "On Manage Shipping Address Modal, add from zip #{test_param[:ship_from_address]['ship_from_zip']}"
  test_param[:full_name]=test_param[:ship_from_address][:full_name]
  test_param[:company]=test_param[:ship_from_address]['company']
  test_param[:street_address]=test_param[:ship_from_address]['street_address']
  test_param[:street_address2]=test_param[:ship_from_address]['street_address2']
  test_param[:city]=test_param[:ship_from_address]['city']
  test_param[:state]=test_param[:ship_from_address]['state']
  test_param[:zip]=test_param[:ship_from_address]['zip']
  test_param[:phone]=test_param[:ship_from_address][:phone]
  #stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses').add.ship_from_address(test_param[:ship_from_address])
  stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses')
  stamps.orders.modals.manage_shipping_addresses.add
  stamps.orders.modals.add_shipping_address.ship_from_address(test_param[:ship_from_address])
  stamps.orders.modals.manage_shipping_addresses.close_window
end

# Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress [Mm]odal, add from zip (\d+)$/ do zip_code
#   test_param[:ship_from_zip]=zip_code
# end

Then /^[Oo]n Manage Shipping Address modal, add address (\w+)$/ do |address|
  test_param[:ship_from_address]=(address.include? 'random ship from zone 1 through 4')?(test_helper.rand_ship_from_zone_1_4):address
  stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses').add(test_param[:ship_from_address])
end

Then /^[Oo]n Manage Shipping Address modal, set Manage Shipping Addresses to$/ do
  stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses').add table.hashes.first
end

Then /^[Oo]n Manage Shipping Address modal, expect selection has (.*)$/ do |address|
  step "blur out on Order Details form"
  #stamps.orders.order_details.single_ship_from.select("Manage Shipping Addresses").address_located?(test_data[:ship_from_address])).to be(true)
end