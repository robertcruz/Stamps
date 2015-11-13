
  Feature: Domestic USPS service used to fulfill an order.

  Background:
    Given I am signed in as a batch shipper

  @service_control
  Scenario:  Inline Rates
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    And Edit row 1 on the order grid

    Then Set Order Details Form Ship-To address to random
    And Hide Order Details Form Ship-To fields

    Then Set Order Details Form Service to "Priority Mail Large/Thick Envelope"
    Then Expect Order Details Form Service to be "Priority Mail Large/Thick Envelope"

    Then Set Order Details Form Service to "Priority Mail Package"
    Then Expect Order Details Form Service to be "Priority Mail Package"

    Then Set Order Details Form Service to "Priority Mail Large Package"
    Then Expect Order Details Form Service to be "Priority Mail Large Package"

    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    Then Expect Order Details Form Service to be "Priority Mail Flat Rate Envelope"

    Then Set Order Details Form Service to "Priority Mail Padded Flat Rate Envelope"
    Then Expect Order Details Form Service to be "Priority Mail Padded Flat Rate Envelope"

    Then Set Order Details Form Service to "Priority Mail Legal Flat Rate Envelope"
    Then Expect Order Details Form Service to be "Priority Mail Legal Flat Rate Envelope"

    Then Set Order Details Form Service to "Priority Mail Regional Rate Box A"
    Then Expect Order Details Form Service to be "Priority Mail Regional Rate Box A"

    Then Set Order Details Form Service to "Priority Mail Regional Rate Box B"
    Then Expect Order Details Form Service to be "Priority Mail Regional Rate Box B"

    Then Set Order Details Form Service to "Priority Mail Regional Rate Box C"
    Then Expect Order Details Form Service to be "Priority Mail Regional Rate Box C"

    Then Set Order Details Form Service to "Priority Mail Express Package"
    Then Expect Order Details Form Service to be "Priority Mail Express Package"

    Then Set Order Details Form Service to "Priority Mail Express Flat Rate Envelope"
    Then Expect Order Details Form Service to be "Priority Mail Express Flat Rate Envelope"

    Then Set Order Details Form Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Expect Order Details Form Service to be "Priority Mail Express Padded Flat Rate Envelope"

    Then Set Order Details Form Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Expect Order Details Form Service to be "Priority Mail Express Legal Flat Rate Envelope"

    And Sign out
