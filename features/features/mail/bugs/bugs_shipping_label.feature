Feature: Shipping Label bugs

  Background:
    Given a valid user is signed in to Web Apps

  @bugs_shipping_label
  Scenario: WEBAPPS-6783 Reset Button Resets Starting Label Position after Print
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope

    Then select on Print Preview Panel, left side starting label
    Then expect on Print Preview Panel, left side label is selected
    Then select on Print Preview Panel, right side starting label
    Then expect on Print Preview Panel, right side label is selected

    Then reset all fields
    Then expect on Print Preview Panel, right side label is selected
    Then select on Print Preview Panel, left side starting label

    Then reset all fields
    Then expect on Print Preview Panel, left side label is selected