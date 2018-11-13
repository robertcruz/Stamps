
@mail_print_shipping_label_sdc1200_with_receipt
Feature: Mail Shipping Label - SDC-1200 with receipt

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_sdc1200
  Scenario: Shipping Label - sdc1200 regular

   #mail_print_shipping_label_sdc1200_regular
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then show advanced options
    Then check advanced options print receipt
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_sdc1200_fpo
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to to address FPO Label, random company, UNIT 100100 BOX 4 120, FPO, AP 96691
    Then set print form ounces to 1
    Then select print form service FCM Package/Thick Envelope
    Then click print form edit customs form button
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then show advanced options
    Then check advanced options print receipt
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    #mail_print_shipping_label_sdc1200_cn22
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | cn22   | random  | random           | random            | random | random   | 12366      | India  | random |
    Then set print form ounces to 1
    Then select print form service FCMI Package/Thick Envelope
    Then click print form edit customs form button
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then show advanced options
    Then check advanced options print receipt
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

     #mail_print_shipping_label_sdc1200_cn72
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | cn72   | random  | random           | random            | random | random   | 78954      | India  | random  |
    Then set print form ounces to 1
    Then select print form service PMI Package/Flat/Thick Envelope
    Then click print form edit customs form button
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then show advanced options
    Then check advanced options print receipt
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    Then sign out