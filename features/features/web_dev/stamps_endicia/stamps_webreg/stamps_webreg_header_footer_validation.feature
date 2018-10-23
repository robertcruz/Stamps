Feature: Stamps WebReg: Header Footer Validation

  Background:
    Given Start test driver

  @sdcwr_header_footer_validation
  Scenario: Header Footer Validation

    Then WL: navigate to https://registration.stamps.com/registration/
    Then WL: navigates to default registration page for stamps with the following offer id 399


    #Verifying all content present to profile page
    Then pause for 5 seconds
    Then WL: expect registration navigation bar stamps logo exists
    Then WL: expect registration navigation bar usps logo exists
    Then WL: expect registration navigation bar header text exists
    Then WL: expect registration container norton logo exists
    Then WL: expect profile bread crumbs is Profile

    #Verify Privacy Policy modal to profile page
    Then WL: expect registration container privacy policy link exists
    Then WL: click registration container privacy policy link
    Then WL: expect privacy policy modal header is Privacy Policy
    Then WL: expect privacy policy modal body header is Stamps.com Privacy Policy
    Then WL: click modal x button

    #Verify Copyrights modal to profile page
    Then WL: expect registration container copyright exists
    Then WL: click registration container copyright link
    Then WL: expect copyright modal header is Stamps.com Website Terms of Use and Copyright Notice
    Then WL: click modal x button

    #Profile Page
    Then WL: set profile page default values
    Then WL: set profile page promo code to 522MB

    Then WL: click profile page continue button

    #Validate navigate to Membership page
    #Verifying all content present to Membership page
    Then pause for 2 seconds
    Then WL: expect membership page bread crumbs is Membership
    Then WL: expect registration navigation bar stamps logo exists
    Then WL: expect registration navigation bar usps logo exists
    Then WL: expect registration navigation bar header text exists
    Then WL: expect registration container norton logo exists

    #Verify Privacy Policy modal to Membership page
    Then WL: expect registration container privacy policy link exists
    Then WL: click registration container privacy policy link
    Then WL: expect privacy policy modal header is Privacy Policy
    Then WL: expect privacy policy modal body header is Stamps.com Privacy Policy
    Then WL: click modal x button

    #Verify Copyrights modal to Membership page
    Then WL: expect registration container copyright exists
    Then WL: click registration container copyright link
    Then WL: expect copyright modal header is Stamps.com Website Terms of Use and Copyright Notice
    Then WL: click modal x button

    #Membership Page
    Then WL: set membership page default values
    Then WL: set membership page address to PO Box 2951 US-41
    Then WL: click membership page address
    Then WL: select membership page address autocomplete index 1

    Then WL: click membership page submit button
    Then WL: check if address standardized is present then click continue

   #Postage Meter Page
    Then pause for 1 seconds
    Then WL: expect membership page bread crumbs is Membership
    Then WL: expect registration navigation bar stamps logo exists
    Then WL: expect registration navigation bar usps logo exists
    Then WL: expect registration navigation bar header text exists
    Then WL: expect registration container norton logo exists

    Then pause for 2 seconds
    Then WL: set postage meter address to 1990 E Grand Ave
    Then WL: set postage meter city to El Segundo
    Then WL: select postage meter state CA
    Then WL: set postage meter zip to 90245

    #Verify Privacy Policy modal on Postage Meter page
    Then WL: expect registration container privacy policy link exists
    Then WL: click registration container privacy policy link
    Then WL: expect privacy policy modal header is Privacy Policy
    Then WL: expect privacy policy modal body header is Stamps.com Privacy Policy
    Then WL: click modal x button

    #Verify Copyrights modal on Postage Meter page
    Then WL: expect registration container copyright exists
    Then WL: click registration container copyright link
    Then WL: expect copyright modal header is Stamps.com Website Terms of Use and Copyright Notice
    Then WL: click modal x button

    Then WL: click membership page submit button

    #Choose Supplies Page
    Then WL: check choose supplies page is present then verify the page and click place order button
    Then pause for 3 seconds

    #Security Question Page
    Then WL: expect security questions header to be Before you start printing postage, make sure your account is protected.

    Then pause for 1 seconds
    Then WL: expect registration navigation bar stamps logo exists
    Then WL: expect registration navigation bar usps logo exists
    Then WL: expect registration navigation bar header text exists
    Then WL: expect registration container norton logo exists

    #Verify Privacy Policy modal
    Then WL: expect registration container privacy policy link exists
    Then WL: click registration container privacy policy link
    Then WL: expect privacy policy modal header is Privacy Policy
    Then WL: expect privacy policy modal body header is Stamps.com Privacy Policy
    Then WL: click modal x button

    #Verify Copyrights modal
    Then WL: expect registration container copyright exists
    Then WL: click registration container copyright link
    Then WL: expect copyright modal header is Stamps.com Website Terms of Use and Copyright Notice
    Then WL: click modal x button