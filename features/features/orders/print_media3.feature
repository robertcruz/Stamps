Feature: Print Media - Shipping Label: 5 ½" x 8 ½"

  Background:
    Given I am signed in to Orders

  @print_media
  Scenario:  Shipping Label: 5 ½" x 8 ½"
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Pounds to 1
    Then Pause for 2 seconds
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Set Printer to "factory"
    Then Toolbar: Print
    And Sign out

