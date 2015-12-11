@bvt
Feature:  Service Selection & Order Grid Values

  Background:
    Given I am signed in to Orders

  @parcel_select
  Scenario:  Rename Parcel Select
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Parcel Select Ground Large Package"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print
    Then Filter Shipped
    Then Expect Grid Service to be Parcel Select Ground
    And Sign out
