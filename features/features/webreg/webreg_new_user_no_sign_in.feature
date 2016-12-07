Feature: WebReg
  Background:
    Given I launched default browser

  @webreg_pam_no_sign_in
  Scenario:
    Then WebReg Profile: Load Registration Page
    Then WebReg Profile: Set User ID and Email to random
    Then WebReg Profile: Send username to standard out
    Then WebReg Profile: Set Password to pass111
    Then WebReg Profile: Set Re-Type password to pass111
    Then WebReg Profile: Set How will you use Stamps.com to Both Mailing and Shipping
    Then WebReg Profile: Set Referrer Name to Already used in office
    Then WebReg Profile: Set 1st Question to What is your mother's maiden name
    Then WebReg Profile: Set 1st Answer to stamps
    Then WebReg Profile: Set 2nd Question to What was your high school mascot
    Then WebReg Profile: Set 2nd Answer to stamps

    Then WebReg Profile: Continue to Mailing Information Page
    Then WebReg Membership: Set First Name to random
    Then WebReg Membership: Set Last Name to random
    Then WebReg Membership: Set Company to random
    Then WebReg Membership: Set Address to 1990 East Grand Avenue
    Then WebReg Membership: Set City to El Segundo
    Then WebReg Membership: Set State to California
    Then WebReg Membership: Set Zip Code to 90245
    Then WebReg Membership: Set Phone to random
    Then WebReg Membership: Set Extenion to random

    Then WebReg Membership: Set Cardholder name to random
    Then WebReg Membership: Set Card number to 4111111111111111
    Then WebReg Membership: Set Expiration Month to February
    Then WebReg Membership: Set Expiration Year to 2019
    Then WebReg Membership: Set Billing address same as mailing address to Checked
    Then WebReg Membership: Set Terms & Conditions to Checked

    Then WebReg Membership: Submit
    Then WebReg: Save credentials to file webreg_pam_no_sign_in.txt
    Then WebReg Profile: Send username to standard out

    Then Pause for 4 seconds

    Then Refresh Browser
    Then Pause for 1 second
    Then Refresh Browser
    Then Pause for 4 seconds

    # PAM STEPS
    Then PAM: Load PAM Page
    Then PAM: Load Customer Search Page
    Then PAM Customer Search: Set username to random
    Then PAM Customer Search: Set 5.2 or lower
    Then PAM Customer Search: Click Search button

    Then PAM Customer Profile: Click Change Meter Limit link
    Then PAM Change Meter Limit: Set New Meter Limit to $100000
    Then PAM Change Meter Limit: Set USPS approval to Checked
    Then PAM Change Meter Limit: Click Submit

    Then PAM Customer Profile: Click ACH Credit link
    Then PAM ACH Purchase: Set Amount to $100000.00

    Then PAM Customer Profile: Click  AppCap Overrides link
    Then PAM AppCap Overrides: Set Internet Mail Printing to Always On
    Then PAM AppCap Overrides: Set Netstamps Printing to Always On
    Then PAM AppCap Overrides: Set Shipping Label Printing to Always On
    Then PAM AppCap Overrides: Set International Shipping to Always On
    Then PAM AppCap Overrides: Set Allow High Risk Countries to Always On
    Then PAM AppCap Overrides: Submit
    Then WebReg: Save credentials to file webreg_pam_no_sign_in.txt
    Then Pause for 4 seconds