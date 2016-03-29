Feature: Multiple Reprints

  Background:
    Given I am signed in to Orders

  @multiple_reprint
  Scenario: Multiple reprints in 24 hour period

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then Details: Set Service to "Media Mail Package"
    Then Details: Set Ounces to 1
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Toolbar: Print
    Then Filter: Select Shipped
    Then Grid: Set New Order ID to check
    Then Open Reprint Modal
    Then RePrint: Reprint
    Then Filter: Select Shipped
    Then Grid: Set New Order ID to check
    Then Open Reprint Modal
    Then RePrint: Reprint

    Then Sign out