When /^I Add a new order$/ do
  log "I Add a new order"
  @old_balance = batch.navigation_bar.balance
  @single_order_form = batch.toolbar.add
  @order_id = @single_order_form.order_id
end

When /^Add a second order$/ do
  log "Add a second order"
  first_row_order_id = batch.grid.order_id 1
  5.times{
    @order_id_2 = batch.toolbar.add_shipping_address_window
    if first_row_order_id.include? @order_id
      sleep(3)
    end
    break unless first_row_order_id.include? @order_id_2
  }
  log "Second Order Id:  #{@order_id_2}"
  batch.grid.edit_order @order_id_2
end

Then /^Open Settings Modal$/ do

  batch.toolbar.open_settings

end