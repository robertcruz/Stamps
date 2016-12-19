Feature: Sudan Internal Transaction Number Required

  Background:
    Given I am signed in to Orders

      # Sudan Internal Transaction Number Required
  @international_rogue_countries @rules_international
  Scenario: Sudan Internal Transaction Number Required
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Sudan    | random  | random  |

    Then Details: Set Ounces to 5
    Then Details: Select Service Priority Mail International Flat Rate Envelope

    #Then Details: Select Service First-Class Mail International Large Envelope/Flat
    Then Details: Edit Customs Form
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Required

    Then Customs: Add Item 1, Description random, Qty 1, Price 3000, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set ITN Number to "random"
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Sign out
