Feature: WebReg
  Background:
    Given I launched default browser

  @webreg_orders
  Scenario:
    Then WebReg Profile: Load Registration Page
    Then WebReg Profile: Set User ID and Email to Random Value
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
    Then WebReg Membership: Set Address to 1990 E Grand Avenue
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
    Then WebReg Membership: Submit and correct errors
    Then WebReg Profile:  Send username to standard out
    Then Registration Choose Supplies: Place Order
    Then Registration Result: Wait for Download Page or Webpostage page to load

    #Then Health Check: Print - Web Batch

    Then Navigation Bar: Orders
    Then Orders: Visit Sign-in page
    #Then Orders: Sign-in as new user random/pass111
    Then Orders: Expect Marketplace modal is present
    Then Orders: Close Marketplace modal
    Then Toolbar: Add
    Then Pause for 3 seconds
    Then Sign out
    Then WebReg Profile:  Send username to standard out

