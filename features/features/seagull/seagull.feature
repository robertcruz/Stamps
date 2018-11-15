Feature: A potential customer browses the microsite

  Background:
    Given an automotive enthusiast has accessed the microsite

  @microsite
  Scenario: User accesses views
    When the enthusiast asks to see views of the car
    Then he is shown all the available photographs