Feature:  Mail BVT

  Background:
    Given Start test driver

  @refresh_filter_grid_after_actions
  Scenario: WEBAPPS-11274 Refresh Filter Grid After Performing Actions to Prints
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 1
    Then select print form service PM Package
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then expect history grid column Carrier is USPS for row 1
    Then expect today is selected on history filter panel
    Then expect history grid column Shipment Status is Printed for row 1
    Then expect history grid weight is correct for row 1
    Then expect history grid column Shipment Status is Printed for saved tracking number
    Then check row 1 on history grid
    Then uncheck row 1 on history grid
    Then check row 1 on history grid


    Then sign out
