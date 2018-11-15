
Feature:  History Details Addresses displayed in Ship to Field

  Background:
    Given Start test driver

  @transaction_address_4lines
  Scenario: History: Transaction Details displays Outgoing Address of Four Lines
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    #Then set print form mail-to to a random address in zone 1
    Then set print form mail-to to address random name, random company, 3217 Shasta Circle S., Los Angeles, CA 90065
    Then select print form service PM Large/Thick Envelope
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then pause for 10 seconds
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then set search prints to newly added tracking number on history filter panel
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect address shipped to in transaction details displays saved address
    Then expect address shipped to contains 4 lines
    Then sign out

  @transaction_address_5lines
  Scenario: History: Transaction Details displays Outgoing Address of Five Lines
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    #Then set print form mail-to to a random address in zone 1
    Then set print form mail-to to address  random name, random company, Attn RMA Department, 3345 Point Pleasant Road, Hebron, KY 41048-9711
    Then select print form service PM Large/Thick Envelope
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then pause for 10 seconds
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then set search prints to newly added tracking number on history filter panel
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect address shipped to in transaction details displays saved address
    Then expect address shipped to contains 5 lines
    Then sign out