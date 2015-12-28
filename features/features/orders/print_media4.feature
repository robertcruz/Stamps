Feature: Print Media - Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"

  Background:
    Given I am signed in to Orders

  @print_media
  Scenario:  Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 2
    Then Open Print Modal
    Then Select Print Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print
    And Sign out

