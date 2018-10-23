Feature: Stamps WebReg: Workflow
  Background:
    Given Start test driver

  @sdcwr_random_workflow
  Scenario: Stamps WebReg: Normal Workflow
   # Profile Page
    Then WL: navigates to default registration page for stamps with the following offer id random value
    Then WL: set profile page email to random value
    Then WL: set profile page username to random value
    Then WL: set profile page password to random value
    Then WL: set profile page re-type password to same as previous password
    Then WL: set profile page survey question to Individual/Home Office
    Then WL: set profile page how did you hear about us? to Television Commercial

    #Security Question before registration
    Then WL: if security question is present before registration then set the values

    Then WL: click profile page continue button

    #Membership Page
    Then WL: set membership page personal info to random info between zone 1 and zone 9
    Then WL: set membership page cardholder's name to random value
    Then WL: set membership page credit card number to default value
    Then WL: select membership page credit card month Dec (12)
    Then WL: set membership page credit card year to this year plus 1
    Then WL: check membership page terms & conditions

    Then WL: click membership page submit button

    #Address Standardized
    Then WL: check if address standardized is present then click continue

    #Postage Meter Address
    Then WL: check if postage meter address is present then set the value

    #Choose Supplies Page
    Then WL: check choose supplies page is present then verify the page and click place order button

    #Security Question after registration
    Then WL: if security question is present after registration then set the values

    Then WL: expect user is navigated to print page for stamps

  @sdcwr_offer_573_workflow
  Scenario: Stamps WebReg: Offer 573 HP Landing Page Workflow
    #Profile Page
    Then WL: navigates to default registration page for stamps with the following offer id 573
    Then WL: set profile page default values
    Then WL: select security questions first security question What is your father's birthplace?
    Then WL: set security questions first security answer to Los Angeles
    Then WL: select security questions second security question What was your high school mascot?
    Then WL: set security questions second security answer to Tigar
    Then WL: click profile page continue button

    #Membership Page
    Then WL: set membership page default values
    Then WL: click membership page submit button

    #Choose Supplies Page
    Then WL: expect choose supplies page header to be Customize your Welcome Kit
    Then WL: expect choose supplies page paragraph index 1 to be
    """
    Thank you for signing up for Stamps.com. Your free Welcome Kit is on its way. Customize your welcome kits with HP specific products by selecting the options below.
    """
    Then WL: click choose supplies page place order button

    #Offer 573 Landing Page
    Then WL: expect offer 573 landing page header to be Congratulations!
    Then WL: expect offer 573 landing page sub header paragraph to be
    """
    You are now ready to print postage with your HP Printer.
    Simply select the Stamps.com App on your printer to get started.
    """
    Then WL: expect offer 573 landing page hp upgrade paragraph to be
    """
    Want to print shipping labels and envelopes? Click here to upgrade to our Complete Plan.
    """
    Then WL: expect offer 573 landing page shipping labels img is present

  @sdcwr_offer_592_workflow
  Scenario: Stamps WebReg: Offer 592 Avery Landing Page Workflow
  #Profile Page
    Then WL: navigates to default registration page for stamps with the following offer id 592
    Then WL: set profile page default values
    Then WL: select security questions first security question What is your father's birthplace?
    Then WL: set security questions first security answer to Los Angeles
    Then WL: select security questions second security question What was your high school mascot?
    Then WL: set security questions second security answer to Tigar
    Then WL: click profile page continue button

  #Membership Page
    Then WL: set membership page default values
    Then WL: click membership page submit button

  #Offer 592 Conformation/Landing Page
    Then WL: expect offer 592 landing page header to be Congratulations on your new account!
    Then WL: expect offer 592 landing page paragraph index 1 to be
    """
    You will receive an email confirmation of your registration.
    """
    Then WL: expect offer 592 landing page paragraph index 2 to be
    """
    Your account is ready to use. Please return to Avery to start printing postage.
    """
    Then WL: click offer 592 landing page continue button

    Then WL: expect offer 592 landing page avery img is present

  @sdcwr_offer_399_workflow
  Scenario: Stamps WebReg: Default Offer Print Landing Page Workflow
    Then WL: navigates to default registration page for stamps with the following offer id 399
    Then WL: set profile page default values
    Then WL: set profile page promo code to PR33-NH77
    Then WL: click profile page continue button
    Then WL: set membership page default values
    Then WL: click membership page submit button

    Then WL: expect choose supplies page header to be Customize your Welcome Kit
    Then WL: expect choose supplies page paragraph index 1 to be
    """
    Thank you for signing up for Stamps.com. Your free Welcome Kit is on its way. Included in the kit is a set of label sheets for printing stamps or shipping labels.
    """
    Then WL: expect choose supplies page paragraph index 3 to be
    """
    If you want to add a free postal scale (just pay S&H) or additional labels or supplies, please select below.
    """
    Then WL: select choose supplies postal scale selection 2
    Then WL: select choose supplies original NetStamps label sheet selection 2
    Then WL: select choose supplies patriotic NetStamps label sheet selection 1
    Then WL: select choose supplies postage, delivery, and return address labels selection 1
    Then WL: click choose supplies page place order button


    Then WL: select security questions first security question What is your pet's name?
    Then WL: set security questions first security answer to random value
    Then WL: select security questions second security question What is the make and model of your first car?
    Then WL: set security questions second security answer to random value
    Then WL: click security questions get started button
    Then WL: expect user is navigated to print page for stamps

  @sdcwr_choose_supplies_page_not_present_workflow
  Scenario: Stamps WebReg: Choose Supplies Page Not Preset Workflow
    Then WL: navigates to default registration page for stamps with the following offer id 391
    Then WL: set profile page default values
    Then WL: select security questions first security question What is your father's birthplace?
    Then WL: set security questions first security answer to Los Angeles
    Then WL: select security questions second security question What was your high school mascot?
    Then WL: set security questions second security answer to Tigar
    Then WL: click profile page continue button

    Then WL: set membership page default values
    Then WL: click membership page submit button
    Then WL: expect offer does not include an atg promotion
    Then WL: expect user is navigated to print page for stamps

  @sdcwr_session_state_data_validation
  Scenario: Stamps WebReg: Session State Data Validation
    Then WL: navigates to default registration page for stamps with the following offer id 350
    Then WL: set profile page default values
    Then WL: select security questions first security question What is your mother's maiden name?
    Then WL: set security questions first security answer to random value
    Then WL: select security questions second security question What is your pet's name?
    Then WL: set security questions second security answer to random value
    Then WL: click profile page continue button

    Then WL: set membership page default values
    Then WL: uncheck membership page billing address same as mailing address
    Then WL: set membership page cardholder's name to random value
    Then WL: set membership page billing address to 1990 E Grand Ave
    Then WL: set membership page billing city to El Segundo
    Then WL: select membership page billing state CA
    Then WL: set membership page billing zip to 90245
    Then WL: click membership page back button

    #Validate profile page data are present
    Then WL: expect profile page default values are correct
    Then WL: expect security questions first security question is correct
    Then WL: expect security questions first security answer is correct
    Then WL: expect security questions second security question is correct
    Then WL: expect security questions second security answer is correct

    Then WL: click profile page continue button

    #Validate Membership page data are present
    Then WL: expect membership page default values are correct
    Then WL: expect membership page credit card number is ************1111
    Then WL: expect membership page billing state is correct
    Then WL: expect membership page billing city is correct
    Then WL: expect membership page billing state is correct
    Then WL: expect membership page billing zip is correct

    Then WL: set membership page address to Po Box 7
    Then WL: set membership page city to Manchester
    Then WL: select membership page state KY
    Then WL: set membership page zip to 40962-0007
    Then WL: click membership page submit button

    Then WL: set postage meter address between zone 5 and zone 8

    #Validate Membership page data are present
    Then WL: click membership page back button
    Then WL: expect membership page default values are correct
    Then WL: expect membership page credit card number is ************1111
    Then WL: expect membership page billing state is correct
    Then WL: expect membership page billing city is correct
    Then WL: expect membership page billing state is correct
    Then WL: expect membership page billing zip is correct

    Then WL: click membership page back button
    #Validate profile page data are present
    Then WL: expect profile page default values are correct
    Then WL: expect security questions first security question is correct
    Then WL: expect security questions first security answer is correct
    Then WL: expect security questions second security question is correct
    Then WL: expect security questions second security answer is correct

    #Validate Membership page data are present
    Then WL: click profile page continue button
    Then WL: expect membership page default values are correct
    Then WL: expect membership page billing state is correct
    Then WL: expect membership page billing city is correct
    Then WL: expect membership page billing state is correct
    Then WL: expect membership page billing zip is correct
    Then WL: click membership page submit button

    #Validate Postage Meter Page data are present
    Then WL: expect postage meter values are correct

    Then WL: browser refresh
    Then WL: navigate to www.google.com
    Then WL: navigate back

    #Validate profile page data are present
    Then WL: expect profile page password is empty
    Then WL: expect profile page re-type password is empty
    Then WL: expect security questions first security question is correct
    Then WL: expect security questions first security answer is empty
    Then WL: expect security questions second security question is correct
    Then WL: expect security questions second security answer is empty

    Then WL: set profile page password to random value
    Then WL: set profile page re-type password to same as previous password
    Then WL: set security questions first security answer to random value
    Then WL: set security questions second security answer to random value
    Then WL: expect profile page default values are correct

    Then WL: click profile page continue button

    #Validate Membership page data are present
    Then WL: expect membership page credit card number is empty
    Then WL: expect membership page terms & conditions is unchecked
    Then WL: set membership page credit card number to default value
    Then WL: expect membership page default values are correct

    Then WL: check membership page terms & conditions
    Then WL: click membership page submit button

    #Validate Postage Meter Page data are present
    Then WL: expect postage meter values are correct




