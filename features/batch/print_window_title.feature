@regression
Feature:  B-01756 I want to be able to print postage for multiple selected orders

  Background:
    * I am signed in as a batch shipper

  @print_window
  Scenario:  Printing
    * Add new order
    * Set Recipient Address to B-01636-1, Order Errors, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Set Phone to 4159833422
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Ounces to 1
    * Set Service to Priority Mail Regional Rate Box A
    * Click Toolbar Print Button
    * Expect Print Window title to be "You have 1 label ready to print"
    * Add a second order
    * Set Recipient Address to B-01636-2, Order Errors, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Set Phone to 4159833422
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Ounces to 1
    * Edit row 1 in the order grid
    * Edit row 2 in the order grid
    * Click Toolbar Print Button
    * Expect Print Window title to be "You have 2 labels ready to print"
    * Sign out
