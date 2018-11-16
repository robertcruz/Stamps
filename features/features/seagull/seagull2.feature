Feature: Marketing Manager maintains the photo set

  Background:
    Given an automotive enthusiast has accessed the microsite

  @marketing_manager_
  Scenario: User accesses views
    When the enthusiast asks to see views of the car
    Then he is shown all the available photographs
