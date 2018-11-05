
@mail_stamps_series_a_b_c_k_l_ml
Feature: Stamps Series #A, #B, #C, #K, #L, #ML

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_stamps_series_a
   Scenario: Stamps Regression Series #A
   #mail_print_stamps_a_series_calculate
    Then select print on Stamps
    Then set print form serial number to A12345
    Then select advanced options calculate postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    #mail_print_stamps_a_series_specify
    Then select print on Stamps
    Then set print form serial number to A12345
    Then select advanced options specify postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set print form stamp amount 0.15
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

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
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_stamps_b_series_specify
    Then select print on Stamps
    Then set print form serial number to B12345
    Then select advanced options specify postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set print form stamp amount 0.15
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

  @mail_stamps_series_c
  Scenario: Stamps Regression Series #C
   #mail_print_stamps_c_series_calculate
    Then select print on Stamps
    Then set print form serial number to C12345
    Then select advanced options calculate postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_stamps_c_series_specify
    Then select print on Stamps
    Then set print form serial number to C12345
    Then select advanced options specify postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set print form stamp amount 0.15
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

  @mail_stamps_series_k
  Scenario: Stamps Regression Series #K
   #mail_print_stamps_k_series_calculate
    Then select print on Stamps
    Then set print form serial number to K12345
    Then select advanced options calculate postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_stamps_k_series_specify
    Then select print on Stamps
    Then set print form serial number to K12345
    Then select advanced options specify postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set print form stamp amount 0.15
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

  @mail_stamps_series_l
  Scenario: Stamps Regression Series #L
   #mail_print_stamps_l_series_calculate
    Then select print on Stamps
    Then set print form serial number to L12345
    Then select advanced options calculate postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_stamps_l_series_specify
    Then select print on Stamps
    Then set print form serial number to L12345
    Then select advanced options specify postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set print form stamp amount 0.15
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

  @mail_stamps_series_ml
  Scenario: Stamps Regression Series #ML
   #mail_print_stamps_ml_series_calculate
    Then select print on Stamps
    Then set print form serial number to ML1234
    Then select advanced options calculate postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_stamps_ml_series_specify
    Then select print on Stamps
    Then set print form serial number to ML1234
    Then select advanced options specify postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set print form stamp amount 0.15
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    Then sign out