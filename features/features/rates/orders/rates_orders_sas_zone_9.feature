Feature: January 2017 Rates for SAS User in Zone 9

  Background:
    Given Login and add order domestic

  @rates_orders_sas_zone_9
  Scenario: FCM Package
    Then set order details ship-to to random address in zone 9
    Then set order details service to FCM Large Envelope/Flat
    Then expect order details service cost is 3.62
    Then set order details weight to 0 lb 13 oz
    Then expect Order Details Total Ship Cost is 3.62
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: First-Class Mail Package/Thick Envelope
    Then set order details ship-to to random address in zone 9
    Then set order details service to First-Class Mail Package/Thick Envelope
    Then set order details weight to 0 lb 10 oz
    Then expect order details service cost is 3.35
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 3.35
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Large/Thick Envelope
    Then set order details ship-to to random address in zone 9
    Then set order details service to PM Large/Thick Envelope
    Then set order details weight to 26 lb 0 oz
    Then expect order details service cost is 63.49
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 63.49
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Package
    Then set order details ship-to to random address in zone 9
    Then set order details service to PM Package
    Then set order details weight to 18 lb 0 oz
    Then expect order details service cost is 52.31
    Then set order details tracking to USPS Tracking
    Then set order details length to 8
    Then set order details width to 16
    Then set order details height to 9
    Then expect Order Details Total Ship Cost is 52.31
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Large Package
    Then set order details ship-to to random address in zone 9
    Then set order details service to PM Large Package
    Then set order details weight to 32 lb 0 oz
    Then expect order details service cost is 78.80
    Then set order details tracking to USPS Tracking
    Then set order details length to 30
    Then set order details width to 15
    Then set order details height to 15
    Then expect Order Details Total Ship Cost is 78.80
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Flat Rate Envelope
    Then set order details ship-to to random address in zone 9
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 53 lb 3 oz
    Then expect order details service cost is 5.75
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.75
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set order details ship-to to random address in zone 9
    Then set order details service to PM Padded Flat Rate Envelope
    Then set order details weight to 25 lb 0 oz
    Then expect order details service cost is 6.10
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.10
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set order details ship-to to random address in zone 9
    Then set order details service to PM Legal Flat Rate Envelope
    Then set order details weight to 37 lb 0 oz
    Then expect order details service cost is 5.75
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.75
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Small Flat Rate Box
    Then set order details ship-to to random address in zone 9
    Then set order details service to PM Small Flat Rate Box
    Then set order details weight to 61 lb 0 oz
    Then expect order details service cost is 6.10
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.10
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Medium Flat Rate Box
    Then set order details ship-to to random address in zone 9
    Then set order details service to PM Medium Flat Rate Box
    Then set order details weight to 40 lb 0 oz
    Then expect order details service cost is 11.95
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 11.95
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Large Flat Rate Box
    Then set order details ship-to to random address in zone 9
    Then set order details service to PM Large Flat Rate Box
    Then set order details weight to 35 lb 0 oz
    Then expect order details service cost is 16.35
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 16.35
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: PME Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 9
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details weight to 56 lb 0 oz
    Then expect order details service cost is 274.05
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 274.05
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: PME Flat Rate Envelope
    Then set order details ship-to to random address in zone 9
    Then set order details service to PME Flat Rate Envelope
    Then set order details weight to 4 lb 0 oz
    Then expect order details service cost is 20.66
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.66
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: PME Padded Flat Rate Envelope
    Then set order details ship-to to random address in zone 9
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details weight to 21 lb 0 oz
    Then expect order details service cost is 20.66
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.66
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: PME Legal Flat Rate Envelope
    Then set order details ship-to to random address in zone 9
    Then set order details service to PME Legal Flat Rate Envelope
    Then set order details weight to 70 lb 0 oz
    Then expect order details service cost is 20.66
    # Then set order details tracking to Signature Required
    Then expect Order Details Total Ship Cost is 20.66
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: MM Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 9
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details weight to 39 lb 0 oz
    Then expect order details service cost is 21.72
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.72
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 9
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details weight to 12 lb 0 oz
    Then expect order details service cost is 40.14
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 40.14
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 9
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details weight to 24 lb 0 oz
    Then expect order details service cost is 60.47
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 60.47
    Then sign out

  @rates_orders_sas_zone_9
  Scenario: Parcel Select Ground Oversized Package
    Then set order details ship-to to random address in zone 9
    Then set order details service to PSG Oversized Package
    Then set order details weight to 7 lb 0 oz
    Then expect order details service cost is 169.87
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 169.87
    Then sign out
