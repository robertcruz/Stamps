@mail_reset
Feature: Resetting mail fields

  Background:
    Given a valid user is signed in to Web Apps

  Scenario: Check if extra services enabled after reset
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to random address in zone 1
    Then set print form ounces to 1
    Then show advanced options
    Then expect print form advanced options extra services button is disabled
    Then select print form service PM Flat Rate Envelope
    Then expect print form advanced options extra services button is enabled
    Then click Mail toolbar menu reset button
    Then expect mail fields are reset
    Then expect print form advanced options extra services button is disabled
    Then set print form mail-to random address in zone 1
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then expect print form advanced options extra services button is enabled
    Then sign out