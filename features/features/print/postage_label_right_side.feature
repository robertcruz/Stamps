Feature: Postage Shipping Label - Right Side



  Background:
    Given I am signed in as a postage shipper


  @wp_label_right_side
  Scenario: Right Side Shipping Label - 8 ½” x 11” Paper

    Then Postage: Select Shipping Label 8 x 11

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Select Service Priority Mail Package
    Then Shipping Labels: Select right side starting label
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_label_right_side
  Scenario: Right Side Shipping Label -  5 ½” x 8 ½”

    Then Postage: Select Shipping Label 5 x 8

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Select Service Priority Mail Package
    Then Shipping Labels: Select right side starting label
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_label_right_side
  Scenario: Right Side Shipping Label -  SDC-1200

    Then Postage: Select Shipping Label 4 x 6

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Set Service to "Priority Mail Package"
    Then Shipping Labels: Select right side starting label
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out