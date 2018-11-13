Feature:  History : Verify "Cost code" edit works

  Background:
    Given Start test driver

  @history_change_costcode
  Scenario: Container label return address is user selected
    Then sign-in to mail
#    Then select print on Shipping Label - 8 ½" x 11" Paper
#    Then set print form mail-from to default
#    Then set print form ship-to to international address
#      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
#      | random | random  | random           | random            | random | random   | random      | Italy | random  |
#    Then set print form weight to lbs 0 oz 1
#    Then select print form service PMI Flat Rate Envelope
#    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
#    Then save tracking number on print form message panel
    Then navigate to History
   # search for traking number
    Then click cost codes button on history toolbar
    #Then expect change cost codes button on history toolbar cost codes is disabled
    Then check row 1 on history grid
    Then click cost codes button on history toolbar
    #Then expect change cost codes button on history toolbar cost codes is enabled
    Then click change cost codes button on history toolbar cost codes
    Then expect change cost code modal on history is present
    Then select new cost code on change cost code modal to random
   # Change to a random value
    Then sign out
