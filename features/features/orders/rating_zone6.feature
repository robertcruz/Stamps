Feature: Local Rating test for zone 6

  Background:
    Given I am signed in to Orders

  @local_rating
  @local_rating6
  Scenario:  All Services
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lbs 12 oz
    Then Details: Expect Total to be $3.40

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 5 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $2.60

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 34 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $52.60

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 11 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Set Length to 10
    Then Details: Set Width to 10
    Then Details: Set Height to 10
    Then Details: Expect Total to be $26.21

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 42 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Set Length to 20
    Then Details: Set Width to 10
    Then Details: Set Height to 30
    Then Details: Expect Total to be $62.85

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 32 lbs 3 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $5.75

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 23 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $6.10

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 33 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $5.75

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 55 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $6.10

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 46 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $11.95

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 31 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $16.35

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Express Package/Flat/Thick Envelope
    Then Details: Set Weight to 23 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $116.24

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 19 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $20.66

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 57 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $20.66

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 40 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $20.66

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 66 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $35.22

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 38 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $58.37

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Parcel Select Ground Large Package
    Then Details: Set Weight to 59 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $75.58

    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 48 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $123.37

    Then Sign out