
Feature: Stamps print media bugs

  Background:
    Given a valid user is signed in to Web Apps

  @bugs_stamps_print
  Scenario: ORDERSAUTO-3349 Legacy WEBAPPS-7032 Thermal Label only partially printed if printed directly after 8 1/2 x 11 Shipping Label print with Receipt

    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then show advanced options
    Then check advanced options hide label value
    Then select print on Envelope - 10
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    #mail_print_roll_4x6_fcm_large_envelope
    Then select print on Roll 4x6
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then click mail statusbar print
    Then click print button on mail print modal

    Then sign out

  @bugs_stamps_print
  Scenario: Web Client L Series NetStamps | Media Mail | Unable To Get Rates

  #mail_print_stamps_l_series_calculate
    Then select print on Stamps
    Then set print form serial number to L12345
    Then select advanced options calculate postage amount
    Then expect Print form service Media Mail is not present in dropdown list

  @bugs_stamps_print
  Scenario: Web Client ML Series NetStamps | Media Mail | Unable To Get Rates

   #mail_print_stamps_ml_series_calculate
    Then select print on Stamps
    Then set print form serial number to ML1234
    Then select advanced options calculate postage amount
    Then expect Print form service Media Mail is not present in dropdown list

  @bugs_stamps_print
  Scenario: E-mail field error validation - "Email is required." when printing Envelopes

    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select print on Envelope - 10
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then expect mail Print modal is present
    Then set Mail Print modal Printer
    Then click print button on mail print modal





