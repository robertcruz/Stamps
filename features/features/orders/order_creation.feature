Feature: 10 orders

  Background:
    Given I am signed in to Orders

  @orders_10 @order_creation
  Scenario:  Order Creation

    # First Class Mail
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Insure For to $15.00

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Insure For to $45.00
    Then Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Large Package"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Regional Rate Box A"
    Then Details: Set Insure For to $105.00
    Then Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Express Package"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 11
    Then Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Details: Set Tracking to "Signature Required"

    # Media Mail

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 3
    Then Details: Set Service to "Media Mail Package"
    Then Details: Set Insure For to $56.00
    Then Details: Set Tracking to "Signature Required"

    # Parcel Select

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 10
    Then Details: Set Service to "Parcel Select Ground Large Package"
    Then Details: Set Insure For to $235.00
    Then Details: Set Tracking to "USPS Tracking"

    Then Sign out

  @orders_20 @order_creation
  Scenario:  Order Creation

    # First Class Mail

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Insure For to $15.00

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Insure For to $45.00
    Then Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Large Package"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Regional Rate Box A"
    Then Details: Set Insure For to $105.00
    Then Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Express Package"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 11
    Then Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Details: Set Tracking to "Signature Required"

    # Media Mail

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 3
    Then Details: Set Service to "Media Mail Package"
    Then Details: Set Insure For to $56.00
    Then Details: Set Tracking to "Signature Required"

    # Parcel Select

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 10
    Then Details: Set Service to "Parcel Select Ground Large Package"
    Then Details: Set Insure For to $235.00
    Then Details: Set Tracking to "USPS Tracking"


    # First Class Mail

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Insure For to $15.00

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Insure For to $45.00
    Then Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Large Package"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Regional Rate Box A"
    Then Details: Set Insure For to $105.00
    Then Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Express Package"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 11
    Then Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Details: Set Tracking to "Signature Required"

    # Media Mail

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 3
    Then Details: Set Service to "Media Mail Package"
    Then Details: Set Insure For to $56.00
    Then Details: Set Tracking to "Signature Required"

    # Parcel Select

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 10
    Then Details: Set Service to "Parcel Select Ground Large Package"
    Then Details: Set Insure For to $235.00
    Then Details: Set Tracking to "USPS Tracking"


