Then /^[Ss]et Multi Order Details Form Ship From to (.+)$/ do |value|
  stamps.orders.multi_order.ship_from_multi.select(value)
 # step "On Multi Order Details form, blur out"
 # step "Save Multi Order Details data"
end

Then /^[Ss]et Multi Order Details Form Pounds to (\d+)$/ do |value|
  parameter[:pounds] = value
  stamps.orders.multi_order.weight.lb.set parameter[:pounds]
  #step "On Order Details form, blur out"
  #step "Save Order Details data"
end

Then /^[Ss]et Multi Order Details form Ounces to (\d+)$/ do |value|
  parameter[:ounces] = value
  stamps.orders.multi_order.weight.oz.set parameter[:ounces]
  #step "On Order Details form, blur out"
  #step "Save Order Details data"
end

Then /^[Ss]et Multi Order Details Form Domestic service to (.*)$/ do |service|
  stamps.orders.multi_order.domestic_service.select(service)
end

Then /^[Ss]et Multi Order Details form International service to (.*)$/ do |service|
  stamps.orders.multi_order.int_service.select(service)
end

Then /^[Ss]et Multi Order Details Form Insurance to (.+)$/ do |value|
  stamps.orders.multi_order.insurance.select(value)
  #step "On Order Details form, blur out"
  #step "Save Order Details data"
end

Then /^[Ss]et Multi Order Details Form Insure Amount to (.+)$/ do |value|
  stamps.orders.multi_order.insurance.select(value)
  #step "On Order Details form, blur out"
  #step "Save Order Details data"
end

Then /^[Ss]et Multi Order Details Form tracking to (.+)$/ do |value|
  #step "set Order Details form Tracking to \"USPS Tracking\""
end

Then /^[Ss]et Multi Order Details form Dimensions to Length (\d+) Width (\d+) Height (\d+)$/ do |length, width, height|
  stamps.orders.multi_order.dimensions.length.set length
  stamps.orders.multi_order.dimensions.width.set width
  stamps.orders.multi_order.dimensions.height.set height
  #step "Save Order Details data"
end

Then /^(?:I|i)n Multi Order Form, click Update Orders button$/ do
  stamps.orders.multi_order.buttons.update_orders
end

Then /^(?:I|i)n Multi Order Form, click Save as Present$/ do

end