
@details_order
Feature: All details tests for order

  Background:
    Given a valid user is signed in to Web Apps

  @details_dimensions_hidden_pm_large_package
  Scenario: Priority Mail and Large Dimensions
    Then add new order
    Then set order details ship-to domestic address to
      | full_name   | company      | street_address1    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |

    Then set order details length to 20
    Then set order details width to 35
    Then set order details height to 20
    Then set order details ounces to 2
    Then set order details pounds to 1
    Then pause for 2 seconds
    Then expect Order Details service Textbox is enabled
    Then pause for 1 second
    Then pause for 1 second
    Then expect Order Details service "PM Package" is enabled
    Then pause for 1 second
    Then set order details service to PM Package
    Then pause for 2 seconds
    Then expect order details length is 0
    Then expect order details height is 0
    Then expect order details width is 0
    Then sign out


  @details_edit_order
  Scenario: User edits an order

    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address in zone 8
    Then set order details service to PM Package
    Then set order details ounces to 3
    Then set order details pounds to 2
    Then set order details insure-for to 100.00
    Then expect Order Details Insure-For Cost is greater than $1
    Then expect order details insure-for is 100
    Then set order details height to 1
    Then expect order details height is 1
    Then set order details length to 1
    Then expect order details length is 1
    Then set order details width to 1
    Then expect order details width is 1

    Then set order details service to PM Package
    Then set order details ounces to 2
    Then expect order details ounces is 2
    Then set order details pounds to 1
    Then expect order details pounds is 1
    Then set order details insure-for to 150
    Then expect Order Details Insure-For Cost is greater than $1
    Then expect order details insure-for is 150
    Then set order details height to 2
    Then set order details length to 3
    Then set order details width to 4

    Then sign out


  @details_flat_rate_no_weight_domestic
  Scenario:  Domestic Flat
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address in zone 1

  # Priority Mail Flat Rate Envelope
    Then set order details service to PM Flat Rate Envelope
    Then expect Order Details service is PM Flat Rate Envelope
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # Priority Mail Padded Flat Rate Envelope
    Then set order details service to PM Padded Flat Rate Envelope
    Then expect Order Details service is PM Padded Flat Rate Envelope
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # Priority Mail Legal Flat Rate Envelope
    Then set order details service to PM Legal Flat Rate Envelope
    Then expect Order Details service is PM Legal Flat Rate Envelope
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # Priority Mail Small Flat Rate Box
    Then set order details service to PM Small Flat Rate Box
    Then expect Order Details service is PM Small Flat Rate Box
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # Priority Mail Medium Flat Rate Box
    Then set order details service to PM Medium Flat Rate Box
    Then expect Order Details service is PM Medium Flat Rate Box
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # Priority Mail Large Flat Rate Box
    Then set order details service to PM Large Flat Rate Box
    Then expect Order Details service is PM Large Flat Rate Box
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # Priority Mail Regional Rate Box A
    Then set order details service to PM Regional Rate Box A
    Then expect Order Details service is PM Regional Rate Box A
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # Priority Mail Regional Rate Box B
    Then set order details service to PM Regional Rate Box B
    Then expect Order Details service is PM Regional Rate Box B
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # PME Flat Rate Envelope
    Then set order details service to PME Flat Rate Envelope
    Then expect Order Details service is PME Flat Rate Envelope
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # PME Padded Flat Rate Envelope
    Then set order details service to PME Padded Flat Rate Envelope
    Then expect Order Details service is PME Padded Flat Rate Envelope
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # PME Legal Flat Rate Envelope
    Then set order details service to PME Legal Flat Rate Envelope
    Then expect Order Details service is PME Legal Flat Rate Envelope
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

    Then sign out


  @details_flat_rate_no_weight_international
  Scenario:  International Flat
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | France  | random  | random  |

  # Priority Mail International Flat Rate Envelope
    Then set order details service to PMI Flat Rate Envelope
    Then expect Order Details service is PMI Flat Rate Envelope
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 1, Made In United States, Tariff 0
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # Priority Mail International Padded Flat Rate Envelope
    Then set order details service to PMI Padded Flat Rate Envelope
    Then expect Order Details service is PMI Padded Flat Rate Envelope
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 1, Made In United States, Tariff 0
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # Priority Mail International Legal Flat Rate Envelope
    Then set order details service to PMI Legal Flat Rate Envelope
    Then expect Order Details service is PMI Legal Flat Rate Envelope
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 1, Made In United States, Tariff 0
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # Priority Mail International Small Flat Rate Box
    Then set order details service to PMI Small Flat Rate Box
    Then expect Order Details service is PMI Small Flat Rate Box
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 1, Made In United States, Tariff 0
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # Priority Mail International Medium Flat Rate Box
    Then set order details service to PMI Medium Flat Rate Box
    Then expect Order Details service is PMI Medium Flat Rate Box
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 1, Made In United States, Tariff 0
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # Priority Mail International Large Flat Rate Box
    Then set order details service to PMI Large Flat Rate Box
    Then expect Order Details service is PMI Large Flat Rate Box
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 1, Made In United States, Tariff 0
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # PME International Flat Rate Envelope
    Then set order details service to PMEI Flat Rate Envelope
    Then expect Order Details service is PMEI Flat Rate Envelope
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 1, Made In United States, Tariff 0
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # PME International Padded Flat Rate Envelope
    Then set order details service to PMEI Padded Flat Rate Envelope
    Then expect Order Details service is PMEI Padded Flat Rate Envelope
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 1, Made In United States, Tariff 0
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

  # PME International Legal Flat Rate Envelope
    Then set order details service to PMEI Legal Flat Rate Envelope
    Then expect Order Details service is PMEI Legal Flat Rate Envelope
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 1, Made In United States, Tariff 0
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then expect order details pounds is 0
    Then expect order details ounces is 0
    Then expect orders grid service is correct
    Then click orders toolbar print button
    Then in print modal, click close button

    Then sign out


  @details_large_dimensions_pm
  Scenario: Priority Mail and Large Dimensions
    Then add new order
    Then expect Order Details service is an empty string
    Then set order details ship-to to random address in zone 8
    Then set order details ounces to 2
    Then set order details pounds to 1
    Then set order details service to PM Package
    Then expect Order Details service is PM Package
    Then set order details length to 20
    Then set order details width to 35
    Then set order details height to 20
    Then blur out on order details form
    Then blur out on order details form
    Then expect Order Details Dimensions are hidden
    Then set order details service to PM Package
    Then blur out on order details form
    Then set order details length to 1
    Then set order details width to 1
    Then set order details height to 1
    Then pause for 2 seconds
    Then expect Order Details service Textbox is enabled
    Then pause for 1 second
    Then expect Order Details service is PM Package
    Then pause for 1 second
    Then expect Order Details service "PM Package" is enabled
    Then pause for 1 second
    Then set order details service to PM Package
    Then pause for 2 seconds
    Then expect order details length is 1
    Then expect order details height is 1
    Then expect order details width is 1
    Then sign out


  @details_non_integer_lb
  Scenario: User edits an order

    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address in zone 8
    Then set order details service to PM Flat Rate Envelope
    Then set order details pounds to 3.5
    Then expect order details pounds is 3
    Then set order details pounds to 2.0
    Then expect order details pounds is 2
    Then set order details ounces to 6.0
    Then expect order details ounces is 6.0
    Then sign out


  @details_panel
  Scenario: B-01995 When Details Panel is Collapsed, Add Button Should Expand it
    Then add new order
    #Then on Order Details form, Collapse Panel
    Then add new order
    Then expect Order Details Panel is present

    Then add new order
    Then on Order Details form, Collapse Panel
    Then on Order Details form, Expand panel
    Then expect Order Details Panel is present

  @details_reference_no
  Scenario: Reference Number
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Large/Thick Envelope
    Then set order details ounces to 2

    Then set order details reference number to random
    Then expect order details reference number is correct

    Then set order details reference number to details_reference_no
    Then expect order details reference number is details_reference_no

    Then click orders toolbar print button
    Then in Print modal, uncheck Print Reference # on Shipping Label
    Then in Print modal, check Print Reference # on Shipping Label
    Then in Print modal, check Print Reference # on Shipping Label
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then click print modal print button
    Then sign out


  @details_services
  @details_services_dom
  Scenario: service Selections for Domestic Orders
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address in zone 1
    Then set order details ounces to 1

    Then set order details service to FCM Large Envelope/Flat
    Then expect Order Details service is FCM Large Envelope/Flat

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PM Large/Thick Envelope
    Then expect Order Details service is PM Large/Thick Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PM Package
    Then expect Order Details service is PM Package

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PM Large Package
    Then expect Order Details service is PM Large Package

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PM Flat Rate Envelope
    Then expect Order Details service is PM Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PM Padded Flat Rate Envelope
    Then expect Order Details service is PM Padded Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PM Legal Flat Rate Envelope
    Then expect Order Details service is PM Legal Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PM Small Flat Rate Box
    Then expect Order Details service is PM Small Flat Rate Box

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PM Medium Flat Rate Box
    Then expect Order Details service is PM Medium Flat Rate Box

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PM Large Flat Rate Box
    Then expect Order Details service is PM Large Flat Rate Box

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PM Regional Rate Box A
    Then expect Order Details service is PM Regional Rate Box A

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PM Regional Rate Box B
    Then expect Order Details service is PM Regional Rate Box B

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PME Package/Flat/Thick Envelope
    Then expect Order Details service is PME Package/Flat/Thick Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PME Flat Rate Envelope
    Then expect Order Details service is PME Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PME Flat Rate Envelope
    Then expect Order Details service is PME Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PME Padded Flat Rate Envelope
    Then expect Order Details service is PME Padded Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PME Padded Flat Rate Envelope
    Then expect Order Details service is PME Padded Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PME Legal Flat Rate Envelope
    Then expect Order Details service is PME Legal Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to MM Package/Flat/Thick Envelope
    Then expect Order Details service is MM Package/Flat/Thick Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PSG Package/Flat/Thick Envelope
    Then expect Order Details service is PSG Package/Flat/Thick Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PSG Oversized Package
    Then expect Order Details service is PSG Oversized Package

    Then click orders toolbar print button
    Then in print modal, click close button

  @details_services
  @details_services_int
  Scenario: service Selections for International Orders
    Then add new order
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Brazil  | random  | random  |
    Then set order details ounces to 1
    Then add order details item 1, qty 1, id random, description random
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 1, Made In Brazil, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then set order details service to FCMI Large Envelope/Flat
    Then expect Order Details service is FCMI Large Envelope/Flat

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to FCMI Package/Thick Envelope
    Then expect Order Details service is FCMI Package/Thick Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PMI Package/Flat/Thick Envelope
    Then expect Order Details service is PMI Package/Flat/Thick Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PMI Flat Rate Envelope
    Then expect Order Details service is PMI Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PMI Padded Flat Rate Envelope
    Then expect Order Details service is PMI Padded Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PMI Legal Flat Rate Envelope
    Then expect Order Details service is PMI Legal Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PMI Small Flat Rate Box
    Then expect Order Details service is PMI Small Flat Rate Box

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PMI Medium Flat Rate Box
    Then expect Order Details service is PMI Medium Flat Rate Box

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PMI Large Flat Rate Box
    Then expect Order Details service is PMI Large Flat Rate Box

    Then click orders toolbar print button
    Then in print modal, click close button

    #Then set order details service to PMI Regional Rate Box A
    #Then expect Order Details service is PMI Regional Rate Box A

    #Then set order details service to PMI Regional Rate Box B
    #Then expect Order Details service is PMI Regional Rate Box B

    Then set order details service to PMEI Package/Flat/Thick Envelope
    Then expect Order Details service is PMEI Package/Flat/Thick Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PMEI Flat Rate Envelope
    Then expect Order Details service is PMEI Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PMEI Padded Flat Rate Envelope
    Then expect Order Details service is PMEI Padded Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then set order details service to PMEI Legal Flat Rate Envelope
    Then expect Order Details service is PMEI Legal Flat Rate Envelope

    Then click orders toolbar print button
    Then in print modal, click close button

    Then sign out


  @details_ship_cost_total
  Scenario: Ship Cost Total
    Then add new order
    Then expect Order Details Total label is Total Ship Cost:
    #Then set order details ship-from to Automation - El Segundo, CA
    Then expect order details service cost is 0.00
    Then expect Order Details Insure-For Cost is 0.00
    Then expect order details tracking cost is 0.00
    Then expect Order Details Total Ship Cost is 0.00

    Then set order details ship-to to random address in zone 8
    Then set order details service to PM Package
    Then set order details ounces to 1
    Then set order details pounds to 1
    # Then set order details tracking to Signature Required
    Then set order details length to 1
    Then set order details width to 1
    Then set order details height to 1

    Then expect order details service cost is greater than $1.00
    Then expect order details tracking cost is greater than $1.00
    Then expect Order Details Ship Cost Total is correct

    Then sign out