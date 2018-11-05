
@mail_print_shipping_label_sdc1200_mm_xm
Feature: Mail Shipping Label - SDC-1200 MM XM

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_sdc1200_mm
  Scenario: Shipping Label - SDC-1200 - MM

   #mail_print_shipping_label_sdc1200_mm_xm
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service MM Package/Flat/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

  @mail_print_shipping_label_sdc1200_xm
  Scenario: Shipping Label - SDC-1200 - XM

    #mail_print_shipping_label_sdc1200_xm_fr_envelope
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PME Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_sdc1200_xm_lfr_envelope
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PME Legal Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_sdc1200_xm_package
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PME Package/Flat/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_sdc1200_xm_pfr_envelope
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PME Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    Then sign out