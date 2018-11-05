
@mail_print_roll_4_1_8_x_6_1_4_pm_envelope_package
Feature: Mail Roll - 4 ⅛” x 6 ¼” - PM Envelope PACKAGE

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4_1_8_x_6_1_4_pm_package
  Scenario: Roll - 4 ⅛” x 6 ¼” - PM Package

   #mail_print_roll_4_1_8_x_6_1_4_pm_large/thick_envelope
    Then select print on Roll 418x614
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Large/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

   #mail_print_roll_4_1_8_x_6_1_4_pm_package
    Then select print on Roll 418x614
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Package
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

   #mail_print_roll_4_1_8_x_6_1_4_pm_large_package
    Then select print on Roll 418x614
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Large Package
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

  @mail_print_roll_4_1_8_x_6_1_4_pm_envelope
  Scenario: Roll - 4 ⅛” x 6 ¼” - PM Envelope

    #mail_print_roll_4_1_8_x_6_1_4_pm_fr_envelope
    Then select print on Roll 418x614
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

   #mail_print_roll_4_1_8_x_6_1_4_pm_pfr_envelope
    Then select print on Roll 418x614
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Padded Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

   #mail_print_roll_4_1_8_x_6_1_4_pm_lfr_envelope
    Then select print on Roll 418x614
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Legal Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer ZDesigner
    Then click print button on mail print modal

    Then sign out