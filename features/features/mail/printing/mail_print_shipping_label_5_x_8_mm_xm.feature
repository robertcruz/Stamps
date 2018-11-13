
@mail_print_shipping_label_5x8_mm_xm
Feature: Mail Shipping Label - 5 ½” x 8 ½” - MM XM

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_5x8_mm
  Scenario: Shipping Label - 5 ½” x 8 ½” - MM

    #mail_print_shipping_label_5x8_mm_package
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service MM Package/Flat/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

  @mail_print_shipping_label_5x8_xm
  Scenario: Shipping Label - 5 ½” x 8 ½” - XM

   #mail_print_shipping_label_5x8_xm_fr_envelope
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PME Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_5x8_xm_lfr_envelope
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PME Legal Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_5x8_xm_package
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PME Package/Flat/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_5x8_xm_pfr_envelope
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PME Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    Then sign out