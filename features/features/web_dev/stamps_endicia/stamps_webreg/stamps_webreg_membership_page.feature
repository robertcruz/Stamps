Feature: Stamps WebReg: Membership Page

  Background:
    Given Start test driver

  @sdcwr_membership_page_ui_validation
  Scenario: Membership Page Validation

    # Profile Page
    Then WL: navigates to default registration page for stamps with the following source id 100-TES-WB001
    Then WL: set profile page email to random value
    Then WL: set profile page username to random value
    Then WL: set profile page password to random value
    Then WL: set profile page re-type password to same as previous password
    Then WL: set profile page survey question to Business Use - Both mailing and shipping
    Then WL: set profile page how did you hear about us? to Received Mailer
    Then WL: set profile page promo code to PR33-NH77

    Then WL: click profile page continue button

    # Membership Page
    # Membership Page Validate Help block tooltips
    Then WL: expect membership page billing address same as mailing address is checked
    Then WL: uncheck membership page billing address same as mailing address
    Then WL: click membership page submit button

    Then WL: expect membership page first name tooltip to be This field is required
    Then WL: expect membership page last name tooltip to be This field is required
    Then WL: expect membership page address tooltip to be This field is required
    Then WL: expect membership page city tooltip to be This field is required
    Then WL: expect membership page state tooltip to be This field is required
    Then WL: expect membership page phone tooltip to be This field is required
    Then WL: expect membership page cardholder's name tooltip to be This field is required
    Then WL: expect membership page credit card number tooltip to be This field is required
    Then WL: expect membership page month tooltip to be This field is required
    Then WL: expect membership page year tooltip to be This field is required

    # Membership Page Billing Address Help block tooltips
    Then WL: expect membership page billing address tooltip to be This field is required
    Then WL: expect membership page billing city tooltip to be This field is required
    Then WL: expect membership page billing state tooltip to be This field is required
    Then WL: expect membership page billing zip tooltip to be This field is required

    #Membership Page Terms & Conditions
    Then WL: expect membership page terms & conditions tooltip to be You must agree to the Terms & Conditions to proceed.

    # Membership Page tooltips with In-valid inputs
    Then pause for 1 second
    Then WL: set membership page first name to 1
    Then WL: set membership page last name to 2
    Then WL: set membership page phone to 128889
    Then WL: set membership page credit card number to 1234
    Then WL: click membership page submit button
    Then WL: expect membership page first name tooltip to be Invalid character in name
    Then WL: expect membership page last name tooltip to be Invalid character in name
    Then WL: expect membership page credit card number tooltip to be Invalid credit card number

    # Membership Page Valid Inputs
    Then pause for 1 second
    Then WL: set membership page first name to random value
    Then WL: expect membership page first name is correct

    Then WL: set membership page last name to random value
    Then WL: expect membership page last name is correct

    Then WL: set membership page company to random value
    Then WL: expect membership page company is correct

    Then WL: set membership page address to 1350 Market Street Apt 2901
    Then WL: expect membership page address is correct

    Then WL: set membership page city to San Francisco
    Then WL: expect membership page city is correct

    Then WL: select membership page state CA
    Then WL: expect membership page state is correct

    Then WL: set membership page zip to 94102
    Then WL: expect membership page zip is correct

    Then WL: set membership page phone to random value
    Then WL: expect membership page phone is correct

    Then WL: set membership page cardholder's name to random value
    Then WL: expect membership page cardholder's name is correct

    Then WL: set membership page credit card number to default value
    Then WL: expect membership page credit card number is correct

    Then WL: select membership page credit card month Dec (12)
    Then WL: select membership page credit card month Nov (11)
    Then WL: select membership page credit card month Oct (10)
    Then WL: select membership page credit card month Sep (09)
    Then WL: select membership page credit card month Aug (08)
    Then WL: select membership page credit card month Jul (07)
    Then WL: select membership page credit card month Jun (06)
    Then WL: select membership page credit card month May (05)
    Then WL: select membership page credit card month Apr (04)
    Then WL: select membership page credit card month Mar (03)
    Then WL: select membership page credit card month Feb (02)
    Then WL: select membership page credit card month Jan (01)

    Then WL: expect membership page month is correct

    Then WL: set membership page credit card year to this year plus 1
    Then WL: set membership page credit card year to this year plus 2
    Then WL: select membership page credit card year 2026
    Then WL: expect membership page credit card year is correct

    # Verify Billing Address present and Validate fields
    Then uncheck Membership page Billing address same as mailing address
    Then expect Membership page Billing address same as mailing address is unchecked
    Then expect Billing Address form is present

    Then check Membership page Billing address same as mailing address
    Then expect Membership page Billing address same as mailing address is checked
    Then expect Billing Address form is not present

    Then uncheck Membership page Billing address same as mailing address

    Then set Membership page Billing Address to 1350 Market Street Apt 2901
    Then expect Membership page Billing Address is correct
    Then set Membership page Billing City to San Francisco
    Then expect Membership page Billing City is correct
    Then select Membership page Billing State CA
    Then expect Membership page Billing State is correct
    Then set Membership page Billing Zip to 94102
    Then expect Membership page Billing Zip is correct

    Then check Membership page Billing address same as mailing address
    Then check Membership page Terms & Conditions
    Then expect Membership page Terms & Conditions is checked

    # Verify Physical Address Zone wise
    Then set Membership page member address to random address between zone 1 and 4
    Then expect Membership page Address is correct
    Then expect Membership page City is correct
    Then expect Membership page State is correct
    Then expect Membership page Zip is correct

    Then set Membership page member address to random address between zone 5 and 8
    Then expect Membership page Address is correct
    Then expect Membership page City is correct
    Then expect Membership page State is correct
    Then expect Membership page Zip is correct

    Then pause for 1 second
    Then set Membership page member address to random address between zone 1
    Then expect Membership page Address is correct
    Then expect Membership page City is correct
    Then expect Membership page State is correct
    Then expect Membership page Zip is correct

    Then set Membership page member address to random address between zone 2
    Then expect Membership page Address is correct
    Then expect Membership page City is correct
    Then expect Membership page State is correct
    Then expect Membership page Zip is correct

    Then set Membership page member address to random address between zone 3
    Then expect Membership page Address is correct
    Then expect Membership page City is correct
    Then expect Membership page State is correct
    Then expect Membership page Zip is correct

    Then set Membership page member address to random address between zone 4
    Then expect Membership page Address is correct
    Then expect Membership page City is correct
    Then expect Membership page State is correct
    Then expect Membership page Zip is correct

    Then pause for 1 second
    Then set Membership page member address to random address between zone 5
    Then expect Membership page Address is correct
    Then expect Membership page City is correct
    Then expect Membership page State is correct
    Then expect Membership page Zip is correct

    Then set Membership page member address to random address between zone 6
    Then expect Membership page Address is correct
    Then expect Membership page City is correct
    Then expect Membership page State is correct
    Then expect Membership page Zip is correct

    Then set Membership page member address to random address between zone 7
    Then expect Membership page Address is correct
    Then expect Membership page City is correct
    Then expect Membership page State is correct
    Then expect Membership page Zip is correct

    Then set Membership page member address to random address between zone 8
    Then expect Membership page Address is correct
    Then expect Membership page City is correct
    Then expect Membership page State is correct
    Then expect Membership page Zip is correct

    Then uncheck Membership page Terms & Conditions
    Then expect Membership page Terms & Conditions is unchecked

    Then check Membership page Terms & Conditions