
@mail_print_roll_4_x_6_fcm_psg
Feature: Mail Roll - 4" x 6" - FCM PSG

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4_x_6_fcm
  Scenario: Roll - 4" x 6" - FCM

    #mail_print_roll_4x6_fcm_large_envelope
    Then select print on Roll 4x6
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

   #mail_print_roll_4x6_fcm_package
    Then select print on Roll 4x6
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Package/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

  @mail_print_roll_4_x_6_psg
  Scenario: Roll - 4" x 6" - PSG

   #mail_print_roll_4x6_psg_large_package
    Then select print on Roll 4x6
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PSG Large Package
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

   #mail_print_roll_4x6_psg_oversized_package
    Then select print on Roll 4x6
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PSG Oversized Package
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

   #mail_print_roll_4x6_psg_package
    Then select print on Roll 4x6
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PSG Package/Flat/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

    Then sign out