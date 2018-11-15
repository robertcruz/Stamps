
Feature:  History Details

  Background:
    Given Start test driver

   @view_transaction_details
  Scenario: History: View Transaction Details page
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
   #Then set print form mail-to to a random address in zone 1
    Then set print form mail-to to address random name, random company, Attn RMA Department, 3345 Point Pleasant Road, Hebron, KY 41048-9711
    Then select print form service PM Large/Thick Envelope
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then pause for 10 seconds
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History

     # search for 1nd tracking
    Then set search prints to newly added tracking number on history filter panel
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect transaction details for single print is available
    Then expect printed status present on transaction details Then set search prints to newly added tracking number on history filter panel
     # search for 2nd tracking
     Then click search icon on history filter panel
     Then check row for saved tracking number on history grid
    Then expect transaction details for multiple print is available
    Then expect printed status is not present on transaction details
    Then sign out