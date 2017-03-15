Feature: Mail Roll - 4" x 6" - PM PFR Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_roll_4x6_pm_pfr_envelope
  Scenario: Roll - 4" x 6" - PM PFR Envelope


    Then select Print On Roll - 4" x 6" Shipping Label

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4


    Then set Print form Ounces to 1
    Then select Print form service PM Padded Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button
    Then Sign out