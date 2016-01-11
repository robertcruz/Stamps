
Feature: Change the starting label position I will print from

  Background:
    Given I am signed in to Orders

  @print_labels
  Scenario:  Print Label - Left Side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    And Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    And Print

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Expect Print Modal left-side label selected
    And Print

    And Sign out
