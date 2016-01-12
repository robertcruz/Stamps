
Feature: As a batch shipper, I want to be able to filter orders by status [B-01621]

  Background:
    Given I am signed in to Orders

   @filters
  Scenario: User Changes filters

    When Expect system displays expanded filters panel

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to United States
    Then Set Order Details Ship-To address to
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 1

    Then Filter Awaiting Shipment
    And Expect system selects Awaiting Shipment Filter and deselects the previous filter

    And Expect Order Details Order ID equals Grid order ID
    Then Expect Grid Recipient to be James Test
    Then Expect Grid Company to be Domestic Company
    Then Expect Grid Address to be 600 Front St Apt 220
    Then Expect Grid City to be San Diego
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 92101
    Then Expect Grid Phone to be 8885551212
    Then Expect Grid Email to be test@stamps.com

    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Print

    Then Filter Shipped
    And Expect system selects Shipped Filter and deselects the previous filter

    Then Expect Grid Recipient to be James Test
    Then Expect Grid Company to be Domestic Company
    Then Expect Grid Address to be 600 Front St Apt 220
    Then Expect Grid City to be San Diego
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 92101
    Then Expect Grid Phone to be 8885551212
    Then Expect Grid Email to be test@stamps.com


    When I Add a new order
    And Expect system selects Awaiting Shipment Filter and deselects the previous filter


    Then Sign out

