
Feature: Printing

  Background:
    Given I am signed in as a batch shipper ff

  @print @print1 @regression
  Scenario:  Print Priority Mail Package
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order sorm Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"
    Then Print

  @print @print_test @regression
  Scenario:  B-01624 Print Priority Mail Express Medium Flat Rate Box
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order sorm Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Service to "Priority Mail Express Medium Flat Rate Box"
    Then Print

  @print @print_test @regression
  Scenario:  Print Priority Mail Express Package
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order sorm Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Service to "Priority Mail Express Package"
    Then Print

  @print @regression
  Scenario:  Print Priority Mail Flat Rate Envelope
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order sorm Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    Then Print

  @print @regression
  Scenario:  Print Priority Mail Regional Rate Box A
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order sorm Ship-To address to random
    Then Set single-order form Service to "Priority Mail Regional Rate Box A"
    Then Print
