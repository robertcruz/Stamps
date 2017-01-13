# encoding: utf-8
Feature: 25 orders

  Background:
    Given I am signed in to Orders

  @orders_25 @jenkins_orders
  Scenario:  25 orders

    # International
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Set Ounces to 2
    Then Details: Set Pounds to 2
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 100.50, Origin United States, Tariff 100
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Details: Select Service FCMI Large Envelope

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to International Address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Set Ounces to 2
    Then Details: Set Pounds to 2
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 100.50, Origin United States, Tariff 100
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Details: Select Service PMI Flat Rate Envelope

    # First Class Mail
    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service FCM Large Envelope
    Then Details: Set Insure-For to $15.00
    Then Details: Set Tracking to "None"
    Then Grid: Check row 1

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 2
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Insure-For to $45.00
    Then Details: Set Tracking to USPS Tracking
    Then Grid: Check row 1

    #Priority Mail
    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Grid: Check row 1
    Then Details: Set Ounces to 3
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PM Large Envelope
    Then Details: Set Tracking to USPS Tracking

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 4
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PM Package
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 5
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PM Large Package
    Then Details: Set Insure-For to $145.00
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 6
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PM Flat Rate Envelope
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 7
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PM Padded Flat Rate Envelope
    Then Details: Set Insure-For to $98.00
    Then Details: Set Tracking to USPS Tracking

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 8
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PM Legal Flat Rate Envelope
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 9
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PM Small Flat Rate Box
    Then Details: Set Insure-For to $30.00
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 10
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PM Medium Flat Rate Box
    Then Details: Set Insure-For to $45.00
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 11
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PM Large Flat Rate Box
    Then Details: Set Insure-For to $239.00
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 12
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PM Regional Rate Box A
    Then Details: Set Insure-For to $105.00
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 13
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PM Regional Rate Box B
    Then Details: Set Insure-For to $205.00
    Then Details: Set Tracking to USPS Tracking

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 14
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Insure-For to $305.00
    Then Details: Set Tracking to Signature Required

    # Priority Mail Express
    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 15
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PME Package
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 16
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PME Flat Rate Envelope
    Then Details: Set Tracking to USPS Tracking

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 17
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PME Padded Flat Rate Envelope
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 18
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PME Legal Flat Rate Envelope
    Then Details: Set Tracking to USPS Tracking

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 19
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PME Padded Flat Rate Envelope
    Then Details: Set Tracking to Signature Required

    # Media Mail
    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 20
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service MM Package
    Then Details: Set Insure-For to $56.00
    Then Details: Set Tracking to Signature Required

    # Parcel Select
    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 21
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PSG Package
    Then Details: Set Insure-For to $345.00
    Then Details: Set Tracking to USPS Tracking

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 22
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PSG Package
    Then Details: Set Insure-For to $456.00
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 23
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Select Service PSG Oversized Package
    Then Details: Set Insure-For to $567.00
    Then Details: Set Tracking to Signature Required
    Then Sign out
