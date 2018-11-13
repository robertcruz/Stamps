Feature: Manage Print Options

  Background:
    Given Start test driver

  @mail_manage_printing_options
  Scenario: Manage Print Options
    Then sign-in to mail
    Then select print on Manage Printing Options...
    Then expect manage print options modal is present
    Then check Stamps in manage print options
    Then check Shipping Label - 8 ½" x 11" Paper in manage print options
    Then check Shipping Label - SDC-1200, 4 ¼" x 6 ¾" in manage print options
    Then check Shipping Label - 5 ½" x 8 ½" in manage print options
    Then check Envelope - #10, 4 ⅛" x 9 ½" in manage print options
    Then check Envelope - #9, 3 ⅞" x 8 ⅞" in manage print options
    Then check Envelope - #A9, 5 ¾" x 8 ¾" in manage print options
    Then check Envelope - #6, 3 ⅝" x 6 ½" in manage print options
    Then check Envelope - #A2, 4 ⅜" x 5 ¾" in manage print options
    Then check Envelope - #7, 3 ⅞" x 7 ½" in manage print options
    Then check Envelope - #11, 4 ½" x 10 ⅜" in manage print options
    Then check Envelope - #12, 4 ¾" x 11" in manage print options
    Then check Certified Mail Label - SDC-3610 in manage print options
    Then check Certified Mail Label - SDC-3710 in manage print options
    Then check Certified Mail Label - SDC-3910 in manage print options
    Then check Certified Mail Label - SDC-3930 in manage print options
    Then check Certified Mail #11 Envelope - SDC-3810 in manage print options
    Then check Certified Mail #11 Envelope - SDC-3830 in manage print options
    Then check Roll - 4" x 6" Shipping Label in manage print options
    Then check Roll - 4 ⅛" x 6 ¼" Shipping Label in manage print options
    Then click save in manage print options
    Then sign out



    # ------------------------------------------------------------ Stamps Advanced Options
  @mail_advanced_options_stamps
  Scenario: Advanced Options for Stamps
    Then sign-in to mail
    Then select print on Stamps
    Then show advanced options
    Then expect advanced options calculate postage amount radio button is present
    Then select advanced options calculate postage amount
    Then expect advanced options calculate postage amount is selected
    Then expect advanced options specify postage amount radio button is present
    Then select advanced options specify postage amount
    Then expect advanced options specify postage amount is selected
    Then set print form serial number to random C series
    Then select advanced options calculate postage amount
    Then set print form mail-to country to United States
    Then select print form service FCM Letter
    Then set print form stamp quantity 1
    Then set print form advanced options cost code None
    Then expect print form advanced options reference number field is present
    Then set print form advanced options reference number to random string
    Then expect print form advanced options reference number is correct
    Then expect advanced options cost code field is present
    Then set print form advanced options cost code None
    Then expect print form advanced options cost code is None
    Then sign out

        # ------------------------------------------------------------ Rolls Advanced Options
  @mail_advanced_options_rolls
  Scenario: Advanced Options for Roll 4x6
    Then sign-in to mail
    Then select print on Roll - 4" x 6" Shipping Label
#    Then set Advanced Options Mail Date to today
#    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then select print form service PM Package
    Then show advanced options
    Then expect print form advanced options extra services button is present
    Then expect advanced options hide label value is present
    Then check advanced options hide label value
    Then expect advanced options hide label value is checked
    Then uncheck advanced options hide label value
    Then expect advanced options hide label value is unchecked
    Then expect advanced options print reference # is present
    Then check advanced options print reference #
    Then expect advanced options print reference # is checked
    Then uncheck advanced options print reference #
    Then expect advanced options print reference # is unchecked
    Then expect print form advanced options reference number field is present
    Then set print form advanced options reference number to random string
    Then expect print form advanced options reference number is correct
    Then expect advanced options cost code field is present
    Then set print form advanced options cost code None
    Then expect print form advanced options cost code is None

    # ------------------------------------------------------------ Envelopes Advanced Options
  @mail_advanced_options_envelope
  Scenario: Advanced Options for Envelope - 10
    Then sign-in to mail
    Then select print on Envelope - #10, 4 ⅛" x 9 ½"
#    Then set Advanced Options Mail Date to today
#    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 2
    Then select print form service FCM Letter
    Then show advanced options
    Then expect print form advanced options extra services button is present
    Then expect advanced options include return address is present
    Then check advanced options include return address
    Then expect advanced options include return address is checked
    Then uncheck advanced options include return address
    Then expect advanced options include return address is unchecked
    Then expect advanced options include delivery address is present
    Then check advanced options include delivery address
    Then expect advanced options include delivery address is checked
    Then uncheck advanced options include delivery address
    Then expect advanced options include delivery address is unchecked
    Then expect advanced options include postage is present
    Then check advanced options include postage
    Then expect advanced options include postage is checked
    Then uncheck advanced options include postage
    Then expect advanced options include postage is unchecked
    Then expect print form advanced options reference number field is present
    Then set print form advanced options reference number to random string
    Then expect print form advanced options reference number is correct
    Then expect advanced options cost code field is present
    Then set print form advanced options cost code None
    Then expect print form advanced options cost code is None
    Then sign out

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3710
  @mail_advanced_options_cm3710
  Scenario: Advanced Options for Certified Mail Label - SDC-3710
    Then sign-in to mail
    Then select print on Certified Mail Label - SDC-3710
    Then show advanced options
    Then expect extra services return receipt is not present
    Then expect restricted delivery on extra services modal is is present
    Then check restricted delivery on extra services modal
    Then expect restricted delivery on extra services modal is checked
    Then uncheck restricted delivery on extra services modal
    Then expect restricted delivery on extra services modal is unchecked
    Then expect print form advanced options mail date is present
    Then expect print form advanced options reference number field is present
    Then set print form advanced options reference number to random string
    Then expect print form advanced options reference number is correct
    Then expect advanced options cost code field is present
    Then set print form advanced options cost code None
    Then expect print form advanced options cost code is None
    Then sign out

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3610
  @mail_advanced_options_cm3610
  Scenario: Advanced Options for Certified Mail Label - SDC-3610
    Then sign-in to mail
    Then select print on Certified Mail Label - SDC-3610
#    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then select print form service PM Package
    Then show advanced options
    Then expect extra services return receipt is not present
    Then expect extra services electronic return receipt is present

    Then expect extra services electronic return receipt is checked

    Then expect extra services electronic return receipt is unchecked
    Then expect restricted delivery on extra services modal is is present
    Then check restricted delivery on extra services modal
    Then expect restricted delivery on extra services modal is checked
    Then uncheck restricted delivery on extra services modal
    Then expect restricted delivery on extra services modal is unchecked
    Then expect print form advanced options mail date is present
    Then expect print form advanced options reference number field is present
    Then set print form advanced options reference number to random string
    Then expect print form advanced options reference number is correct
    Then expect advanced options cost code field is present
    Then set print form advanced options cost code None
    Then expect print form advanced options cost code is None
    Then sign out

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3910
  @mail_advanced_options_cm3910
  Scenario: Advanced Options for Certified Mail Label - SDC-3910
    Then sign-in to mail
    Then select print on Certified Mail Label - SDC-3910
    Then expect extra services return receipt is present
    Then check return receipt on extra services modal
    Then expect extra services return receipt is checked
    Then uncheck return receipt on extra services modal
    Then expect extra services return receipt is unchecked
    Then expect extra services electronic return receipt is present

    Then expect extra services electronic return receipt is checked

    Then expect extra services electronic return receipt is unchecked
    Then expect restricted delivery on extra services modal is is present
    Then check restricted delivery on extra services modal
    Then expect restricted delivery on extra services modal is checked
    Then uncheck restricted delivery on extra services modal
    Then expect restricted delivery on extra services modal is unchecked
    Then expect print form advanced options mail date is present
    Then expect print form advanced options reference number field is present
    Then set print form advanced options reference number to random string
    Then expect print form advanced options reference number is correct
    Then expect advanced options cost code field is present
    Then set print form advanced options cost code None
    Then expect print form advanced options cost code is None
    Then sign out

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3930
  @mail_advanced_options_3930
  Scenario: Advanced Options for Certified Mail Label - SDC-3930
    Then sign-in to mail
    Then select print on Certified Mail Label - SDC-3930
    Then expect extra services return receipt is present
    Then check return receipt on extra services modal
    Then expect extra services return receipt is checked
    Then uncheck return receipt on extra services modal
    Then expect extra services return receipt is unchecked
    Then expect restricted delivery on extra services modal is is present
    Then check restricted delivery on extra services modal
    Then expect restricted delivery on extra services modal is checked
    Then uncheck restricted delivery on extra services modal
    Then expect restricted delivery on extra services modal is unchecked
    Then expect print form advanced options mail date is present
    Then expect print form advanced options reference number field is present
    Then set print form advanced options reference number to random string
    Then expect print form advanced options reference number is correct
    Then expect advanced options cost code field is present
    Then set print form advanced options cost code None
    Then expect print form advanced options cost code is None
    Then sign out

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3810
  @mail_advanced_options_3810
  Scenario: Advanced Options for Certified Mail Label - SDC-3810
    Then sign-in to mail
    Then select print on Certified Mail #11 Envelope - SDC-3810
    Then expect extra services return receipt is present
    Then expect extra services return receipt is checked
    Then expect restricted delivery on extra services modal is is present
    Then check restricted delivery on extra services modal
    Then expect restricted delivery on extra services modal is checked
    Then uncheck restricted delivery on extra services modal
    Then expect restricted delivery on extra services modal is unchecked
    Then expect print form advanced options mail date is present
    Then expect print form advanced options reference number field is present
    Then set print form advanced options reference number to random string
    Then expect print form advanced options reference number is correct
    Then expect advanced options cost code field is present
    Then set print form advanced options cost code None
    Then expect print form advanced options cost code is None
    Then sign out

  @mail_contacts_comm_error
  Scenario: Communication error in FF durint navigation between Mail and Contacts pages
    Then sign-in to mail
    Then navigate to Contacts
    Then expect mail server error is not present
    Then in contacts grid check row 1
    Then click print postage button on contacts toolbar
    Then expect mail server error is not present
    Then sign out