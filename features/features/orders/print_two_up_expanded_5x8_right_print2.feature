Feature: Print 2 Domestic labels on 5.5x8.5 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_5x8_right_print2
  Scenario: Print 2 Domestic labels on 5.5x8.5 - right side
    # 2 Domestic labels 5 ½" x 8 ½" right side
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then Details: Set Service to "Media Mail Package"
    Then Details: Set Ounces to 1
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PM Large Package, 5.5x8.5 Right Side 1, 26930 NE 152nd St., Duvall WA 98019-8316
    Then Details: Set Service to "Priority Mail Large Package"
    Then Details: Set Ounces to 1
    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Select right-side label
    Then Expect Print Modal right-side label selected
    Then Toolbar: Print
    Then Sign out


