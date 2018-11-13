
@mail_print_shipping_label_5x8_fcm_psg
Feature: Mail Shipping Label - 5 ½” x 8 ½” - FCM PSG

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_5x8_fcm
  Scenario: Shipping Label - 5 ½” x 8 ½” - FCM

    #mail_print_shipping_label_5x8_fcm_large_envelope
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_5x8_fcm_package
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Package/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

  @mail_print_shipping_label_5x8_psg
  Scenario: Shipping Label - 5 ½” x 8 ½” - PSG

   #mail_print_shipping_label_5x8_psg_large_package
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PSG Large Package
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_5x8_psg_oversized_package
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PSG Oversized Package
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_5x8_psg_package
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PSG Package/Flat/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    Then sign out