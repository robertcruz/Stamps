Feature: Auto-Calculate Customs Form Weight

  Background:
    Given a valid user is signed in to Web Apps

  @customs_form_auto_calculate_weight
  Scenario: Auto-Calculate Customs Form Weight
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details ounces to 4

    Then on order details form, add item 1
    Then set Order Details Qty to 2
    Then set Order Details ID to random
    Then set Order Details Description to random

    Then on order details form, add item 2
    Then set Order Details Qty to 2
    Then set Order Details ID to random
    Then set Order Details Description to random

    Then click order details form customs form button

    Then add customs associated item 1
    Then set Customs Associated Item 1 Description to item 1
    Then set Customs Associated Item 1 Qty to 2
    Then set Customs Associated Item 1 Unit Price to 1
    Then set Customs Associated Item 1 Made In is Country to United States
    Then set Customs Associated Item 1 Tarriff to 5

    Then add customs associated item 2
    Then set Customs Associated Item 2 Description to item 2
    Then set Customs Associated Item 2 Qty to 2
    Then set Customs Associated Item 2 Unit Price to 1
    Then set Customs Associated Item 2 Made In is Country to United States
    Then set Customs Associated Item 2 Tarriff to 10
    Then check customs form i agree to the usps privacy act statement

    Then close customs information form

    Then expect orders grid weight is 0 lb. 4 oz.
    Then expect Orders Grid Weight(lb) is 0
    Then expect Orders Grid Weight(oz) is 4

    Then sign out
