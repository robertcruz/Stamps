
Feature: As a batch shipper, I want to be able to Filter Panel - orders by status [B-01621]

  Background:
    Given I am signed in to Orders

   @filters
  Scenario: User Changes filters

    When Expect system displays expanded filters panel

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To address to
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Ounces to 1

    Then Filter: Select Awaiting Shipment
    Then Expect system selects Awaiting Shipment Filter Panel - and deselects the previous filter

    Then Details: Expect Order ID equals Grid order ID
    Then Grid: Expect Recipient to be James Test
    Then Grid: Expect Company to be Domestic Company
    Then Grid: Expect Address to be 600 Front St Apt 220
    Then Grid: Expect City to be San Diego
    Then Grid: Expect State to be CA
    Then Grid: Expect Zip to be 92101
    Then Grid: Expect Phone to be 8885551212
    Then Grid: Expect Email to be test@stamps.com

    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Toolbar: Print

    Then Filter: Select Shipped
    Then Expect system selects Shipped Filter Panel - and deselects the previous filter

    Then Grid: Expect Recipient to be James Test
    Then Grid: Expect Company to be Domestic Company
    Then Grid: Expect Address to be 600 Front St Apt 220
    Then Grid: Expect City to be San Diego
    Then Grid: Expect State to be CA
    Then Grid: Expect Zip to be 92101
    Then Grid: Expect Phone to be 8885551212
    Then Grid: Expect Email to be test@stamps.com


    Then Add New Order
    Then Expect system selects Awaiting Shipment Filter Panel - and deselects the previous filter


    Then Sign out

