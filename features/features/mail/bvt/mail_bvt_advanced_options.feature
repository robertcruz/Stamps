
@mail_bvt_advanced_options
Feature: Advanced Options BVT

  Background:
    Given a valid user is signed in to Web Apps

    # ------------------------------------------------------------ Stamps Advanced Options

  Scenario: Advanced Options for Stamps
    Then select Print On Stamps
    Then show Advanced Options
    # Calculate Postage
    Then expect Advanced Options Calculate Postage Amount radio button is present
    Then select Advanced Options Calculate Postage Amount
    Then expect Advanced Options Calculate Postage Amount is selected
    # Specify Postage
    Then expect Advanced Options Specify Postage Amount radio button is present
    Then select Advanced Options Specify Postage Amount
    Then expect Advanced Options Specify Postage Amount is selected
    # Populate Stamps form
    Then set Print form Serial Number to random C series
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service FCM Letter
    Then set Print form Quantity to 1
    Then set Advanced Options Cost Code to None
    # Extra Services
    Then expect Advanced Options Extra Services Button is visible
    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct
    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Rolls Advanced Options
  Scenario: Advanced Options for Roll 4x6
    Then select Print On Roll 4x6
    Then set Advanced Options Mail Date to today
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then select Print form service PM Package
    Then show Advanced Options

    # Extra Services
    Then expect Advanced Options Extra Services Button is visible

    # Mail Date Picker
    Then expect Advanced Options Mail Date field is present
    Then set Advanced Options Mail Date to date 04/04/2017
    Then expect Advanced Options Mail Date is 04/04/2017
    Then set Advanced Options Mail Date to today
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to tomorrow
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 0
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 1
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 2
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 3
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 4
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 5
    Then expect Advanced Options Mail Date is correct

    # Hide Label Value CheckBox
    Then expect Advanced Options Hide Label Value is present
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then uncheck Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is unchecked

    # Reference # CheckBox
    Then expect Advanced Options Print Reference # is present
    Then check Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is checked
    Then uncheck Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is unchecked

    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Envelopes Advanced Options
  Scenario: Advanced Options for Envelope - 10
    Then select Print On Envelope - 10

    Then set Advanced Options Mail Date to today
    # Populate Envelope form
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 2
    Then select Print form service FCM Letter

    Then show Advanced Options

    # Extra Services
    Then expect Advanced Options Extra Services Button is visible

    # Mail Date Picker
    Then expect Advanced Options Mail Date field is present
    Then set Advanced Options Mail Date to date 04/04/2017
    Then expect Advanced Options Mail Date is 04/04/2017
    Then set Advanced Options Mail Date to today
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to tomorrow
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 0
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 1
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 2
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 3
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 4
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 5
    Then expect Advanced Options Mail Date is correct

    # include Return Address CheckBox
    Then expect Advanced Options include Return Address is present
    Then check Advanced Options include Return Address
    Then expect Advanced Options include Return Address is checked
    Then uncheck Advanced Options include Return Address
    Then expect Advanced Options include Return Address is unchecked

    # include Delivery Address CheckBox
    Then expect Advanced Options include Delivery Address is present
    Then check Advanced Options include Delivery Address
    Then expect Advanced Options include Delivery Address is checked
    Then uncheck Advanced Options include Delivery Address
    Then expect Advanced Options include Delivery Address is unchecked

    # include Postage CheckBox
    Then expect Advanced Options include Postage is present
    Then check Advanced Options include Postage
    Then expect Advanced Options include Postage is checked
    Then uncheck Advanced Options include Postage
    Then expect Advanced Options include Postage is unchecked

    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3710
  Scenario: Advanced Options for Certified Mail Label - SDC-3710
    Then select Print On Certified Mail Label - SDC-3710

    Then show Advanced Options

    Then expect Print Form Certified Mail is checked
    Then expect Print Form Certified Mail is visible
    Then expect Print Form Certified Mail is disabled

    Then expect Print Form Return Receipt is not visible

    Then expect Print Form Electronic Return Receipt is present
    Then check Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is checked
    Then uncheck Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is unchecked

    Then expect Advanced Options Restricted Delivery is present
    Then check Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is checked
    Then uncheck Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is unchecked

    Then expect Advanced Options Mail Date field is present

    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3610
  Scenario: Advanced Options for Certified Mail Label - SDC-3610
    Then select Print On Certified Mail Label - SDC-3610

    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then select Print form service PM Package

    Then show Advanced Options

    Then expect Print Form Certified Mail is checked
    Then expect Print Form Certified Mail is visible
    Then expect Print Form Certified Mail is disabled

    Then expect Print Form Return Receipt is not visible

    Then expect Print Form Electronic Return Receipt is present
    Then check Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is checked
    Then uncheck Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is unchecked

    Then expect Advanced Options Restricted Delivery is present
    Then check Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is checked
    Then uncheck Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is unchecked

    Then expect Advanced Options Mail Date field is present

    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3910
  Scenario: Advanced Options for Certified Mail Label - SDC-3910
    Then select Print On Certified Mail Label - SDC-3910

    Then expect Print Form Certified Mail is checked
    Then expect Print Form Certified Mail is visible
    Then expect Print Form Certified Mail is disabled

    Then expect Print Form Return Receipt is present
    Then check Print Form Return Receipt
    Then expect Print Form Return Receipt is checked
    Then uncheck Print Form Return Receipt
    Then expect Print Form Return Receipt is unchecked

    Then expect Print Form Electronic Return Receipt is present
    Then check Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is checked
    Then uncheck Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is unchecked

    Then expect Advanced Options Restricted Delivery is present
    Then check Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is checked
    Then uncheck Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is unchecked

    Then expect Advanced Options Mail Date field is present

    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3930
  Scenario: Advanced Options for Certified Mail Label - SDC-3930
    Then select Print On Certified Mail Label - SDC-3930

    Then expect Print Form Certified Mail is checked
    Then expect Print Form Certified Mail is visible
    Then expect Print Form Certified Mail is disabled

    Then expect Print Form Return Receipt is present
    Then check Print Form Return Receipt
    Then expect Print Form Return Receipt is checked
    Then uncheck Print Form Return Receipt
    Then expect Print Form Return Receipt is unchecked

    Then expect Print Form Electronic Return Receipt is present
    Then check Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is checked
    Then uncheck Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is unchecked

    Then expect Advanced Options Restricted Delivery is present
    Then check Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is checked
    Then uncheck Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is unchecked

    Then expect Advanced Options Mail Date field is present

    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3810
  Scenario: Advanced Options for Certified Mail Label - SDC-3810
    Then select Print On Certified Mail Label - SDC-3810

    Then expect Print Form Certified Mail is checked
    Then expect Print Form Certified Mail is visible
    Then expect Print Form Certified Mail is disabled

    Then expect Print Form Return Receipt is visible
    Then expect Print Form Return Receipt is disabled
    Then expect Print Form Return Receipt is checked

    Then expect Print Form Electronic Return Receipt is present
    Then check Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is checked
    Then uncheck Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is unchecked

    Then expect Advanced Options Restricted Delivery is present
    Then check Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is checked
    Then uncheck Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is unchecked

    Then expect Advanced Options Mail Date field is present

    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Shipping Labels Advanced Options
  Scenario: Advanced Options for Shipping Label - Paper
    Then select Print On Shipping Label - Paper

    Then set Advanced Options Mail Date to today
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then select Print form service PM Package
    Then show Advanced Options

    # Extra Services
    Then expect Advanced Options Extra Services Button is visible

    # Mail Date Picker
    Then expect Advanced Options Mail Date field is present
    Then set Advanced Options Mail Date to today
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to tomorrow
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 0
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 1
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 2
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 3
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 4
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 5
    Then expect Advanced Options Mail Date is correct

    # Hide Label Value CheckBox
    Then expect Advanced Options Hide Label Value is present
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then uncheck Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is unchecked

    # Print Receipt CheckBox
    Then expect Advanced Options Print Receipt is present
    Then check Advanced Options Print Receipt
    Then expect Advanced Options Print Receipt is checked
    Then uncheck Advanced Options Print Receipt
    Then expect Advanced Options Print Receipt is unchecked

    # Reference # CheckBox
    Then expect Advanced Options Print Reference # is present
    Then check Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is checked
    Then uncheck Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is unchecked

    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    Then Sign out

