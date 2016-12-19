
Feature: Address Cleansing

  Background:
    Given I am signed in to Orders

  @address_cleansing
  Scenario: Address Cleansing
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Domestic Address
      | name              | company | street_address   | street_address_2 | city       | state | zip | country       |
      | Address Cleansing | No Zip  | 1990 E Grand Ave |                  | El Segundo | CA    |     | United States |

    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 1
    Then Details: Set Pounds to 1
    Then Details: Set Insure-For to $200
    Then Pause for 2 seconds
    Then Grid: Expect Zip is 90245
    Then Grid: Expect Recipient is Address Cleansing
    Then Grid: Expect Company is No Zip
    Then Grid: Expect City is El Segundo
    Then Grid: Expect State is CA

    Then Toolbar: Add
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Sign out

