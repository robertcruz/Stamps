

Feature:  Mail BVT

  Background:
    Given Start test driver

  @transaction_address_4lines
  Scenario: WEBAPPAUTO-534	Test Case: ORDERSAUTO-4246 Scenario 1.0: History: Transaction Details displays Outgoing Address of Four Lines
    Then sign-in to mail
#    Then select print on Shipping Label - 5 ½" x 8 ½"
#    #Then set print form mail-to to a random address in zone 1
#    Then set print form mail-to to address random name, random company, 3217 Shasta Circle S., Los Angeles, CA 90065
#    Then select print form service PM Large/Thick Envelope
#    Then set print form weight to lbs 0 oz 1
#    Then click print label
#    Then pause for 10 seconds
#    Then click continue on confirm print modal
#    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
#    Then save tracking number on print form message panel
    Then navigate to History
    Then set search prints to newly added tracking number on history filter panel
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect address shipped to in transaction details displays saved address
    Then expect address shipped to contains 4 lines
    Then sign out

  @transaction_address_5lines
  Scenario: WEBAPPAUTO-536	Test Case: ORDERSAUTO-4248 Scenario 2.0: History: Transaction Details displays Outgoing Address of Five Lines
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

  @transaction_address_6lines
  Scenario: WEBAPPAUTO-538	Test Case: ORDERSAUTO-4250 Scenario 3.0: History: Transaction Details displays Outgoing Address of Six Lines
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    #Then set print form mail-to to a random address in zone 1
    Then set print form mail-to to address John Doe, Director, Human Resources, Applegate Inc., 1925 Florence Ave, Kingman, AZ 86401-4617
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
    Then expect address shipped to contains 6 lines
    Then sign out

  @view_transaction_details
  Scenario: WEBAPPAUTO-545 Test Case: ORDERSAUTO-5211 History: View Transaction Details page
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    #Then set print form mail-to to a random address in zone 1
    Then set print form mail-to to address John Doe, Director, Human Resources, Applegate Inc., 1925 Florence Ave, Kingman, AZ 86401-4617
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
