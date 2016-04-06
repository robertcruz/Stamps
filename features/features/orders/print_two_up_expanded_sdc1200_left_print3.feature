Feature: User Prints 3 Domestic labels on SDC-1200 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_sdc1200_left_print3
  Scenario: User Prints 3 Domestic labels on SDC-1200 - left side
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PM Med FR Box, SDC-1200, 530 K Street Unit 504, San Diego CA 92101-7060
    Then Details: Set Service to "Priority Mail Medium Flat Rate Box"
    Then Details: Set Ounces to 1
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PM Lg FR Box, SDC-1200, 7065 N Ingram Ave, Fresno CA 93650-1083
    Then Details: Set Service to "Priority Mail Large Flat Rate Box"
    Then Details: Set Ounces to 1
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PM RR Box A, SDC-1200, 4937 79th St., Sacramento CA 95820-6213
    Then Details: Set Service to "Priority Mail Regional Rate Box A"
    Then Details: Set Ounces to 1
    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Grid: Check row 3
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Print: Print Sample
    Then Toolbar: Print
    Then Pause for 6 seconds

    Then Sign out
