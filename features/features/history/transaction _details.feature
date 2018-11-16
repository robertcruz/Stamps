
Feature:  History Details

  Background:
    Given Start test driver

   @view_transaction_details
  Scenario: History: View Transaction Details page
     Then sign-in to mail
    #if there are no records in the History grid, use below featur
#    Then select print on Shipping Label - 5 ½" x 8 ½"
#    #Print Label 1
#     Then set print form mail-to to address random name, random company, Attn RMA Department, 3345 Point Pleasant Road, Hebron, KY 41048-9711
#     Then select print form service PM Large/Thick Envelope
#     Then set print form weight to lbs 0 oz 1
#     Then click print label
#     Then pause for 10 seconds
#     Then click continue on confirm print modal
#     Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
#     Then save tracking number of print1 on print form message panel
#    #Print Lable 2
#     Then set print form mail-to to address random name, random company, Attn RMA Department, 3345 Point Pleasant Road, Hebron, KY 41048-9711
#     Then select print form service PM Large/Thick Envelope
#     Then set print form weight to lbs 0 oz 1
#     Then click print label
#     Then pause for 10 seconds
#     Then click continue on confirm print modal
#     Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
#     Then save tracking number of print2 on print form message panel
       # if there are records in the history gird follow below stps
     Then navigate to History
     Then check row 1 on history grid
     Then expect transaction details for single print is available
     Then expect printed status is present on transaction details
     Then check row 2 on history grid
     Then expect transaction details for multiple print is available
     Then expect printed status is not present on transaction details
     Then sign out
