Feature: Advanced Options BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_advanced_options
  Scenario: Advanced Options BVT

    # Shipping Labels Advanced Options
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then show Advanced Options

    Then set Advanced Options Mail Date to 03/24/2017
    Then set Advanced Options Mail Date to today
    Then set Advanced Options Mail Date to tomorrow
    Then set Advanced Options Mail Date to today plus 1
    Then set Advanced Options Mail Date to today plus 2
    Then set Advanced Options Mail Date to today plus 3
    Then set Advanced Options Mail Date to asdfasdf

    Then expect Advanced Options Mail Date field is present
    Then expect Advanced Options Mail Date is correct
    Then expect Advanced Options Mail Date is 03/24/2017
    Then expect Advanced Options Mail Date is today
    Then expect Advanced Options Mail Date is today plus 1














    Then expect Advanced Options Extra Services Button is visible

    Then expect Advanced Options Mail Date field is present

    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # Stamps Advanced Options
    Then select Print On Stamps
    Then show Advanced Options

    Then expect Advanced Options Extra Services Button is visible

    Then expect Advanced Options Calculate Postage Amount radio button is present
    Then select Advanced Options Calculate Postage Amount
    Then expect Advanced Options Calculate Postage Amount is selected

    Then expect Advanced Options Specify Postage Amount radio button is present
    Then select Advanced Options Specify Postage Amount
    Then expect Advanced Options Specify Postage Amount is selected

    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    Then Sign out

