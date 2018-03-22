Then /^View Print On option (.*) tooltip$/ do |label|
  #SdcTest.log.step "View Print On option #{label} tooltip"
  tooltip=stamps.orders.modals.orders_print_modal.print_on_tooltip label
end

#Shipping Label 5.5 x 8.5
#Use these letter-sized label sheets with two 5 �� x 8 �� labels per sheet to mail mail, addresses, and tracking barcode.
#Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination.
#Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783
Then /^[Ee]xpect (.*) tool-tip to contain \"(.*)\"$/ do |label, tooltip_message|
  #SdcTest.log.step "Expect #{label} tool-tip to contain #{tooltip_message}"
  SdcTest.log.step label
  SdcTest.log.step tooltip_message
end



Then /^[Ss]elect new option \"(.*)\"$/ do |label|
  #StampsTest.log.step "Select new option #{label}"
  stamps.orders.orders_toolbar.toolbar_print.click
end

Then /^[Ee]xpect saves settings to \"(.*)\"$/ do |label|

end

Then /^[Ee]xpect a print of \"(.*)\"$/ do |label|
  #StampsTest.log.step "Expect a mail of #{label}"
  stamps.orders.orders_toolbar.toolbar_print.click
end


Then /^[Ee]xpect a print Sample of \"(.*)\"$/ do |label|
  #StampsTest.log.step "Expect a mail Sample of #{label}"
  stamps.orders.modals.orders_print_modal.print_sample
end


Then /^[Ee]xpect system will only print first order$/ do |label|
  #StampsTest.log.step "Expect system will only mail first order"
  stamps.orders.orders_toolbar.toolbar_print.click
end

