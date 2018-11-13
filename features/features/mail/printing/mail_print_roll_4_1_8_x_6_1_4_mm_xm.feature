
@mail_print_roll_4_1_8_x_6_1_4_mm_xm
Feature: Mail Roll - 4 ⅛” x 6 ¼” - MM_XM

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4_1_8_x_6_1_4_mm
  Scenario: Print On: Roll - 4 ⅛” x 6 ¼” - MM

    Then select print on Roll 418x614
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service MM Package/Flat/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

  @mail_print_roll_4_1_8_x_6_1_4_xm_envelope
  Scenario: Print On: Roll - 4 ⅛” x 6 ¼” - XM Envelope

   #mail_print_roll_4_1_8_x_6_1_4_xm_fr_envelope
    Then select print on Roll 418x614
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PME Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

   #mail_print_roll_4_1_8_x_6_1_4_xm_lfr_envelope
    Then select print on Roll 418x614
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PME Legal Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

    #mail_print_roll_4_1_8_x_6_1_4_xm_pfr_envelope
    Then select print on Roll 418x614
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PME Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

  @mail_print_roll_4_1_8_x_6_1_4_xm_package
  Scenario: Print On: Roll - 4 ⅛” x 6 ¼” - XM Package

    Then select print on Roll 418x614
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PME Package/Flat/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

    Then sign out