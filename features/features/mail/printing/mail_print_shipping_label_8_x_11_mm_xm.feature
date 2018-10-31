
@mail_print_shipping_label_8_x_11_mm_xm
Feature: Mail Shipping Label - 8 ½” x 11” MM XM Paper

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_8_x_11_mm
  Scenario: Shipping Label - 8 ½” x 11” MM Paper

    #mail_print_shipping_label_8x11_mm_package
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 1
    Then select print form service MM Package/Flat/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

  @mail_print_shipping_label_8_x_11_xm
  Scenario: Shipping Label - 8 ½” x 11” XM Paper

   #mail_print_shipping_label_8x11_xm_fr_envelope
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 1
    Then select print form service PME Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_8x11_xm_lfr_envelope
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 1
    Then select print form service PME Legal Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_8x11_xm_package
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 1
    Then select print form service PME Package/Flat/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_8x11_xm_pfr_envelope
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 1
    Then select print form service PME Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    Then sign out