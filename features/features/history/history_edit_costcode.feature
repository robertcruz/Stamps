Feature:  History : Verify "Cost code" edit works

  Background:
    Given Start test driver

  @history_change_costcode
  Scenario: Container label return address is user selected
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form weight to lbs 0 oz 1
    Then select print form service PM Large/Thick Envelope
    Then click mail toolbar print label
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then set search prints to newly added tracking number on history filter panel
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then click cost codes button on history toolbar
    Then click change cost codes button on history toolbar cost codes
    Then expect change cost code modal on history is present
    Then select new cost code on change cost code modal to existing
    Then click save button on change cost code modal
    Then expect history grid cost code column at row 1 is correct
    Then expect value of cost code in history print details panel is correct
    Then sign out
