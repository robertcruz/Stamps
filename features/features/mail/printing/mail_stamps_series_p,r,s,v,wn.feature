
@mail_stamps_series_p_r_s_v_wn
Feature: Stamps Series #P, #R, #S, #V, #WN

  Background:
    Given a valid user is signed in to Web Apps
  @mail_stamps_series_r
  Scenario: Stamps Regression Series #R
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to R12345
    Then select advanced options calculate postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then pause for 1 second
    Then click print button on mail print modal

   #mail_print_stamps_r_series_specify
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to R12345
    Then select advanced options specify postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set print form stamp amount 0.15
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then click print button on mail print modal
    Then sign out

  @mail_stamps_series_s
  Scenario: Stamps Regression Series #S
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to S12345
    Then select advanced options calculate postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then pause for 1 second
    Then click print button on mail print modal

   #mail_print_stamps_s_series_specify
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to S12345
    Then select advanced options specify postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set print form stamp amount 0.15
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then click print button on mail print modal
    Then sign out

  @mail_stamps_series_p
  Scenario: Stamps Regression Series #P
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to P12345
    Then select advanced options calculate postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then pause for 1 second
    Then click print button on mail print modal

   #mail_print_stamps_p_series_specify
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to P12345
    Then select advanced options specify postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set print form stamp amount 0.15
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then click print button on mail print modal
    Then sign out

  @mail_stamps_series_wn
  Scenario: Stamps Regression Series #WN
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to WN1234
    Then select advanced options specify postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then select print form service First Class
    Then set print form stamp amount 0.15
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then pause for 1 second
    Then click print button on mail print modal

   #mail_print_stamps_wn_series_calculate
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to WN1234
    Then select advanced options calculate postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then click print button on mail print modal
    Then sign out

  @mail_stamps_series_v
  Scenario: Stamps Regression Series #V
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to V12345
    Then select advanced options calculate postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then pause for 1 second
    Then click print button on mail print modal

   #mail_print_stamps_v_series_specify
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to V12345
    Then select advanced options specify postage amount
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set print form stamp amount 0.15
    Then set print form advanced options cost code None
    Then click mail statusbar print
    Then click print button on mail print modal
    Then sign out
