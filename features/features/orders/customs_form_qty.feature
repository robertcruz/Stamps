Feature: Customs Form Qty
  Customs: Qty > 99 is not saved correctly

  Background:
    Given I am signed in to Orders

  @customs_form_qty
  Scenario: Customs Form Qty
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then Details: Set Service to "Priority Mail Express International Legal Flat Rate Envelope"
    Then Details: Set Ounces to 1

    Then Details: Add Item 1
    Then Details: Set Qty to 1
    Then Details: Set ID to random
    Then Details: Set Description to random

    Then Details: Add Item 2
    Then Details: Set Qty to 2
    Then Details: Set ID to random
    Then Details: Set Description to random

    Then Open Customs Form

    Then Customs: Add Item 1
    Then Customs: Set Item Description to item 1
    Then Customs: Set Item Qty to 100
    Then Customs: Set Item Unit Price to 11.11
    Then Customs: Set Item Pounds to 1
    Then Customs: Set Item Ounces to 1
    Then Customs: Set Item Origin Country to United States
    Then Customs: Set Item Tarriff to 100

    Then Customs: Add Item 2
    Then Customs: Set Item Description to item 2
    Then Customs: Set Item Qty to 99
    Then Customs: Set Item Unit Price to 22.22
    Then Customs: Set Item Pounds to 2
    Then Customs: Set Item Ounces to 2
    Then Customs: Set Item Origin Country to United States
    Then Customs: Set Item Tarriff to 200

    Then Close Customs Form

    Then Open Customs Form
    Then Pause for 2 seconds
    Then Customs: Expect Item 1 Description to be item 1
    Then Customs: Expect Item 1 Quantity to be 100
    Then Customs: Expect Item 1 Unit Price to be 11.11
    Then Customs: Expect Item 1 Pounds to be 1
    Then Customs: Expect Item 1 Ounces to be 1
    Then Customs: Expect Item 1 Origin Country to be United States
    Then Customs: Expect Item 1 Tariff to be 100

    Then Customs: Expect Item 2 Description to be item 2
    Then Customs: Expect Item 2 Quantity to be 99
    Then Customs: Expect Item 2 Unit Price to be 22.22
    Then Customs: Expect Item 2 Pounds to be 2
    Then Customs: Expect Item 2 Ounces to be 2
    Then Customs: Expect Item 2 Origin Country to be United States
    Then Customs: Expect Item 2 Tariff to be 200

    Then Close Customs Form

    Then Sign out
