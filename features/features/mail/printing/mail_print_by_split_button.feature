
@mail_print_by_split_button
Feature: New Sprint 12/6/17 WEBAPPS-6803 Add Print Split button to Mail Page. Print Stamps, Labels, Envelopes, Certified Mails using split button

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label
  Scenario: Shipping Label using split button

    #mail_print_shipping_label_5x8_fcm_large_envelope
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then Print label using split button
    Then Expect mail Print modal is present
    Then close mail Print modal

    Then sign out

  @mail_print_envelope_6
  Scenario: Print On: Envelope #6

    Then select print on Envelope - 6
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then click mail statusbar print using split button
    Then Expect mail Print modal is present
    Then close mail Print modal

  Scenario: Print On: Envelope #11
    Then select print on Envelope - 11
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then click mail statusbar print using split button
    Then Expect mail Print modal is present
    Then close mail Print modal
    Then sign out

  @mail_print_SDC_3930
  Scenario: Print SDC 3930 (with hidden postage)
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Package
    Then click mail statusbar print using split button
    Then Expect mail Print modal is present
    Then close mail Print modal
    Then sign out

  @mail_print_roll_4_1_8_x_6_1_4_fcm
  Scenario: Print on: Roll - 4 ⅛” x 6 ¼” - FCM
  #mail_print_roll_4_1_8_x_6_1_4_fcm_large_envelope
    Then select print on Roll 418x614
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then click mail statusbar print using split button
    Then Expect mail Print modal is present
    Then close mail Print modal
   #mail_print_roll_4x6_fcm_large_envelope
    Then select print on Roll 4x6
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then click mail statusbar print using split button
    Then Expect mail Print modal is present
    Then close mail Print modal
    Then sign out

  @mail_stamps_series_b
  Scenario: Stamps Regression Series #B
   #mail_print_stamps_b_series_calculate
    Then select print on Stamps
    Then set print form serial number to B12345
    Then select advanced options calculate postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set print form advanced options cost code None
    Then click mail statusbar print using split button
    Then Expect mail Print modal is present
    Then close mail Print modal

   #mail_print_stamps_b_series_specify
    Then select print on Stamps
    Then set print form serial number to B12345
    Then select advanced options specify postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set print form stamp amount 0.15
    Then set print form advanced options cost code None
    Then click mail statusbar print using split button
    Then Expect mail Print modal is present
    Then close mail Print modal
    Then sign out
