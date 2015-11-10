Then /^View Print On option (.*) tooltip$/ do |label|
  log "Test: View Print On option #{label} tooltip"
  @print_window = batch.toolbar.print
  tooltip = @print_window.print_on_tooltip label
end

#Shipping Label 5.5 x 8.5
#Use these letter-sized label sheets with two 5 �� x 8 �� labels per sheet to print postage, addresses, and tracking barcode.
#Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination.
#Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783
Then /^Expect (.*) tool-tip to contain \"(.*)\"$/ do |label, tooltip_message|
  log "Test: Expect #{label} tool-tip to contain #{tooltip_message}"
  log label
  log tooltip_message
end



Then /^Select new option \"(.*)\"$/ do |label|
  log "Test: Select new option #{label}"
  @print_window = batch.toolbar.print
end

Then /^Expect saves settings to \"(.*)\"$/ do |label|

end

Then /^Expect a print of \"(.*)\"$/ do |label|
  log "Test: Expect a print of #{label}"
  @print_window = batch.toolbar.print
end


Then /^Expect a print Sample of \"(.*)\"$/ do |label|
  log "Test: Expect a print Sample of #{label}"
  @print_window = batch.toolbar.print
  batch.toolbar.print.print_sample
end


Then /^Expect system will only print first order$/ do |label|
  log "Test: Expect system will only print first order"
  @print_window = batch.toolbar.print
end

