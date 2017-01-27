
Feature:  Requires x-number of label sheets

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_two_up_x_number_of_labels
  Scenario:  Printing
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Weight to 1 lb 1 oz
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect number of required label sheets is 1
    Then in Print modal, expect Modal Title is "You have 1 label(s) ready to print"
    Then in Print modal, click Close button

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Weight to 1 lb 1 oz
    Then on Order Details form, set Dimensions to Length 1 Width 1 Height 1
    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect number of required label sheets is 1
    Then in Print modal, expect Modal Title is "You have 2 label(s) ready to print"
    Then in Print modal, click Close button

    Then Sign out
