Feature: Print Media - Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_printing_on_4x6_sdc1200
  Scenario:  Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PM Package
    Then set Order Details Pounds to 1
    Then Pause for 2 seconds
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then click print modal print button
    Then Sign out

