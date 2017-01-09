Feature: Parcel Select Ground Rates

  Background:
    Given Rates: Load Rate File

  @rates_parcel_select_ground
  Scenario: Parcel Select Ground
    And I am signed in to Orders
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Rates: Test Parcel Select Ground in Zone 1
    Then Rates: Test PM Comm Plus in Zone 2
    Then Rates: Test PM Comm Plus in Zone 3
    Then Rates: Test PM Comm Plus in Zone 4
    Then Rates: Test PM Comm Plus in Zone 5
    Then Rates: Test PM Comm Plus in Zone 6
    Then Rates: Test PM Comm Plus in Zone 7
    Then Rates: Test PM Comm Plus in Zone 8
    Then Rates: Test PM Comm Plus in Zone 9
    Then Rates: Number of failed test should be less than 1
    Then Sign out
