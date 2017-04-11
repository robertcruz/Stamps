Feature: PM Comm Base Rates

  Background:
    Given excel rate sheet is loaded

  @rates_pm_comm_base
  Scenario: PM Comm Base
    And user is signed in to Web Apps
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo, CA
    Then run rate test PM Comm Base in Zone 1
    Then run rate test PM Comm Base in Zone 2
    Then run rate test PM Comm Base in Zone 3
    Then run rate test PM Comm Base in Zone 4
    Then run rate test PM Comm Base in Zone 5
    Then run rate test PM Comm Base in Zone 6
    Then run rate test PM Comm Base in Zone 7
    Then run rate test PM Comm Base in Zone 8
    Then run rate test PM Comm Base in Zone 9
    Then Rates: Number of failed test should be less than 1
    Then Sign out
