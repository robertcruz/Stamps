Feature: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side

  Background:
    Given I am signed in to Orders

  @print_layout_cn22_5x8_continuation
  Scenario: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to International Address
      | name      | company            | street_address_1 | street_address_2 | city   | province| postal_code | country     | phone   |  email  |
      | PMEI PFTE |  5.5x8.5 Left Side | random           | random           | random | random  | random      | Philippines | random  | random  |
    Then Details: Select Service PMEI Package
    Then Details: Set Weight to 2 lb 0 oz

    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to Gift
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then Customs: Add Item 2, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then Customs: Add Item 3, Description random, Qty 1, Price 1, Origin United States, Tariff 3
    Then Customs: Add Item 4, Description random, Qty 1, Price 2, Origin United States, Tariff 4
    Then Customs: Add Item 5, Description random, Qty 1, Price 3, Origin United States, Tariff 5
    Then Customs: Add Item 6, Description random, Qty 1, Price 1, Origin United States, Tariff 6
    Then Customs: Add Item 7, Description random, Qty 1, Price 2, Origin United States, Tariff 7
    Then Customs: Add Item 8, Description random, Qty 1, Price 1, Origin United States, Tariff 8
    Then Customs: Add Item 9, Description random, Qty 1, Price 1, Origin United States, Tariff 9
    Then Customs: Add Item 10, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then Customs: Add Item 11, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then Customs: Add Item 12, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then Customs: Add Item 13, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then Customs: Add Item 14, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then Customs: Add Item 15, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then Customs: Add Item 16, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then Customs: Add Item 17, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then Customs: Add Item 18, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then Customs: Add Item 19, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then Customs: Add Item 20, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then Customs: Add Item 21, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then Customs: Add Item 22, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then Customs: Add Item 23, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then Customs: Add Item 24, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then Customs: Add Item 25, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then Customs: Add Item 26, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then Customs: Add Item 27, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then Customs: Add Item 28, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then Customs: Add Item 29, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then Customs: Add Item 30, Description random, Qty 1, Price 3, Origin United States, Tariff 3
    Then Customs: Add Item 31, Description random, Qty 1, Price 3, Origin United States, Tariff 3
    Then Customs: Add Item 32, Description random, Qty 1, Price 3, Origin United States, Tariff 3
    Then Pause for 4 seconds
    Then Customs: Set ITN Number to "random"
    Then Pause for 4 seconds
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Pause for 2 seconds
    Then Customs: Close Modal

    Then Pause for 2 seconds
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Print: Expect left-side label selected
    Then Print: Print

    Then Sign out
