Then /^Save Shipping Costs Data$/ do
  log.info "Step: Save Shipping Costs Data"
  @service_cost = orders.details.service_cost
  @insurance_cost = orders.details.insurance_cost
  @tracking_cost = orders.details.tracking_cost
  @total_amount = orders.details.total
  @old_balance = orders.navigation_bar.balance.amount
end

Then /^Expect Total amount equals Service Cost, Insurance Cost and Tracking Cost$/ do
  log.info "Step: Expect Total amount equals Service Cost, Insurance Cost and Tracking Cost"
  @total_amount = orders.details.total
  @service_cost = orders.details.service_cost
  @tracking_cost = orders.details.tracking_cost
  @insurance_cost = orders.details.insurance_cost
  total_amount_correct = @total_amount.to_f.round(2) == (@service_cost.to_f + @insurance_cost.to_f + @tracking_cost.to_f).round(2)
  log.info "Total Amount:  #{(total_amount_correct)?'Passed':'Failed'}.  #{@total_amount} == #{@service_cost} + #{@insurance_cost} + #{@tracking_cost}"
  expect(total_amount_correct).to be true
end

Then /^Expect Ship Cost equals Total amount$/ do
  log.info "Step: Expect Ship Cost equals Total amount"
  total_amount = orders.details.total
  ship_cost = orders.grid.ship_cost.data @order_id
  10.times {
    begin
      sleep(1)
      break if ship_cost.eql? total_amount
      total_amount = orders.details.total
      ship_cost = orders.grid.ship_cost.data @order_id
    rescue
      #ignore
    end
  }
  log.info "Test #{(ship_cost==total_amount)?"Passed":"Failed"}"
  ship_cost.should eql total_amount
end

Then /^Expect \$([0-9.]*) is deducted from customer balance if printing is successful$/ do |expected|
  log.info "Step: Expect \$#{expected} is deducted from customer balance if printing is successful"
  log.info "Old Balance: #{@old_balance}"
  if @printing_error
    @new_balance = orders.navigation_bar.balance.amount
    test_result = @old_balance.to_f == @new_balance.to_f
    log.info "Printing error detected."
    log.info "Account balance should be the same.  Old balance: #{@old_balance}, New balance: #{@new_balance} ##{(test_result)?"Passed":"Failed"}"
    expect(test_result).to be true
  else
    @new_balance = orders.navigation_bar.balance.amount
    test_result = @old_balance.to_f == @new_balance.to_f + expected.to_f
    log.info "Account balance should be the same.  Old balance: #{@old_balance}, New balance: #{@new_balance} ##{(test_result)?"Passed":"Failed"}"
    expect(test_result).to be true
  end
end

Then /^Expect Printing cost is deducted from customer balance if there were no printing errors$/ do
  log.info "Step: Expect Printing cost is deducted from customer balance if there were no printing errors"
  log.info "Printing Error:  #{@printing_error}"
  log.info "Old Balance: #{@old_balance}"
  if @printing_error.length > 0
    @new_balance = orders.navigation_bar.balance.amount
    balance_deduction = @old_balance.to_f == @new_balance.to_f
    log.info "Printing error detected."
    log.info "Account balance should be the same.  Old balance: #{@old_balance}, New balance: #{@new_balance} ##{(balance_deduction)?"Passed":"Failed"}"
    balance_deduction.should be true
  else
    @new_balance = orders.navigation_bar.balance.new_balance(@old_balance)
    postage_total_calculation = @total_amount.to_f.round(2) == (@service_cost.to_f + @insurance_cost.to_f + @tracking_cost.to_f).round(2)
    log.info "Postage total Calculation:  #{(postage_total_calculation)?'Passed':'Failed'}.  #{@total_amount} == #{@service_cost} + #{@insurance_cost} + #{@tracking_cost}"
    postage_total_calculation.should be true
    new = @new_balance.to_f.round(2)
    calculated = (@old_balance.to_f - (@service_cost.to_f + @tracking_cost.to_f)).round(2)
    balance_deduction = new == calculated
    log.info "Customer Balance:  #{(balance_deduction)?'Passed':'Failed'}.  (New Balance)#{@new_balance} == (Old balance) #{@old_balance} - ((Service) #{@service_cost} + (Tracking) #{@tracking_cost})"
    balance_deduction.should be true
  end
end

Then /^Print: Expect Total Cost to be \$([0-9.]*)$/ do |expectation|
  log.info "Step: Print: Expect Total Cost to be #{expectation}"
  begin
    print_window = orders.toolbar.print
    actual_value = print_window.total_cost
    10.times { |counter|
      #log_expectation_eql "#{counter}. Print Window Total Cost", expectation, actual_value
      break if actual_value.eql? expectation
      actual_value = print_window.total_cost
    }
    print_window.close
    actual_value.should eql expectation
  end unless expectation.length == 0
end