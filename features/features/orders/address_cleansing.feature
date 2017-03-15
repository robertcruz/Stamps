
Feature: Address Cleansing

  Background:
    Given a valid user is signed in to Web Apps

  @address_cleansing
  Scenario: Address Cleansing
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to Domestic Address
      | name              | company | street_address   | street_address_2 | city       | state | zip | country       |
      | Address Cleansing | No Zip  | 1990 E Grand Ave |                  | El Segundo | CA    |     | United States |
    Then on Order Details form, select service PM Package
    Then set Order Details form Ounces to 1
    Then set Order Details form Pounds to 1
    Then Pause for 2 seconds
    Then expect Orders Grid Zip is 90245
    Then expect Orders Grid Recipient is Address Cleansing
    Then expect Orders Grid Company is No Zip
    Then expect Orders Grid City is El Segundo
    Then expect Orders Grid State is CA

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Package
    Then Sign out
