Feature: Mail Roll - 4 ⅛” x 6 ¼” - PM Envelope PACKAGE

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4_1_8_x_6_1_4_pm_envelope_package
  Scenario: Roll - 4 ⅛” x 6 ¼” - PM Envelope Package

   #mail_print_roll_4_1_8_x_6_1_4_pm_large/thick_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to El Segundo
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Large/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to El Segundo
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_large_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to El Segundo
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Large Package
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

    #mail_print_roll_4_1_8_x_6_1_4_pm_fr_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to El Segundo
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_pfr_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to El Segundo
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Padded Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_lfr_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to El Segundo
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Legal Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

    Then Sign out