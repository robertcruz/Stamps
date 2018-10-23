Feature: Stamps WebReg: Membership Page

  Background:
    Given Start test driver

  @sdcwr_membership_page_ui_validation
  Scenario: Membership Page Validation

    # Profile Page
    Then WL: navigates to default registration page for stamps with the following offer id 404
    Then WL: set profile page default values

    Then WL: set profile page promo code to empty
    Then WL: click profile page continue button


    # Membership Page
    # Membership Page Validate Help block tooltips
    Then WL: expect membership page billing address same as mailing address is checked
    Then WL: uncheck membership page billing address same as mailing address
    Then WL: click membership page submit button
    Then WL: expect membership page header to be Set up your personal Post Office

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

    #Membership Page Terms & Conditions Help block tooltips
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

    #Credit Card
    Then WL: expect membership page credit card stamps logo is present
    Then WL: expect membership page credit card usps logo is present
    Then WL: expect membership page credit card authorization text to be
    """
    Postage Account
    Credit Card Authorization
    """

    Then WL: set membership page cardholder's name to random value
    Then WL: expect membership page cardholder's name is correct

    Then WL: set membership page credit card number to 4111111111111111
    Then WL: expect membership page credit card number is correct
    Then WL: expect membership page credit card visa is present

    Then WL: set membership page credit card number to 5241744011877736
    Then WL: expect membership page credit card number is correct
    Then WL: expect membership page credit card mastercard is present

    Then WL: set membership page credit card number to 6011363662993134
    Then WL: expect membership page credit card number is correct
    Then WL: expect membership page credit card discover is present

    Then WL: set membership page credit card number to 348871178715194
    Then WL: expect membership page credit card number is correct
    Then WL: expect membership page credit card american express is present

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
    Then WL: expect membership page billing header to be present
    Then WL: expect membership page billing address to be present
    Then WL: expect membership page billing city to be present
    Then WL: expect membership page billing state to be present
    Then WL: expect membership page billing zip to be present

    Then WL: check membership page billing address same as mailing address
    Then WL: expect membership page billing address same as mailing address is checked
    Then WL: expect membership page billing header not to be present
    Then WL: expect membership page billing address not to be present
    Then WL: expect membership page billing city not to be present
    Then WL: expect membership page billing state not to be present
    Then WL: expect membership page billing zip not to be present

    Then WL: uncheck membership page billing address same as mailing address

    Then WL: set membership page billing address to 1350 Market Street Apt 2901
    Then WL: expect membership page billing address is correct
    Then WL: set membership page billing city to San Francisco
    Then WL: expect membership page billing city is correct
    Then WL: select membership page billing state CA
    Then WL: expect membership page billing state is correct
    Then WL: set membership page billing zip to 94102
    Then WL: expect membership page billing zip is correct

    Then WL: check membership page billing address same as mailing address
    Then WL: expect membership page terms & conditions is unchecked
    Then WL: check membership page terms & conditions
    Then WL: expect membership page terms & conditions is checked

    #Verify Side Content
    Then WL: expect membership page need mailing info header to be
    """
    Why do you need my mailing information?
    """

    Then WL: expect membership page need mailing info paragraph to be
    """
    Since you are being issued a license to print official U.S. postage, the USPS requires you to register the name, telephone number and physical address from which your postage will be printed. This information will be used to create your Stamps.com account and to calculate the correct postage rates. Rest assured, your information is safe with us. We take identity protection seriously. Our advanced encryption technology keeps your information safe and secure.
    """

    Then WL: expect membership page change mailing address header to be
    """
    Can I change my mailing address?
    """

    Then WL: expect membership page change mailing address paragraph to be
    """
    Yes. If you move to a new location your Stamps.com account will follow you. Simply change the address for your postage license in the Stamps.com settings. This is very important since postage rates are calculated based on where the mail is sent from.
    """

    Then WL: expect membership page outside my office header to be
    """
    Can I use my Stamps.com account outside my office?
    """

    Then WL: expect membership page outside my office paragraph to be
    """
    Yes, with Stamps.com you can mail and ship from anywhere, whether it’s your office, your home or your hotel room. Just be sure to set the zip code of your location before printing postage.
    """

    Then WL: expect membership page credit card information safe header to be
    """
    Is my credit card information safe?
    """

    Then WL: expect membership page credit card information safe paragraph to be
    """
    Definitely. We use the highest level SSL encryption technology to secure all commerce transactions.
    """

    Then WL: expect membership page pricing and billing header to be
    """
    Pricing and billing details
    """

    Then WL: expect membership page pricing and billing paragraph to be
    """
    If you decide to continue past the trial, you will be charged a service fee of just $plan_rate per month. This includes the month following registration. For your convenience, your Stamps.com service will continue uninterrupted unless you decide to cancel. No service fee will be charged if you cancel within the trial period. Your credit card may also be used to pay for postage and optional services.
    """

    Then WL: expect membership page cancel anytime header to be
    """
    Cancel anytime
    """

    Then WL: expect membership page cancel anytime paragraph to be
    """
    Cancel online or simply call us toll-free at 1-855-608-2677, M-F, 6am-6pm PST.
    """

    Then WL: expect membership page bonus offer details link to be present
    Then WL: click membership page bonus offer details link
    Then WL: expect membership page your stamps.com offer modal to be present
    Then WL: click membership page bonus offer details modal x button

    Then WL: uncheck membership page terms & conditions
    Then WL: expect membership page terms & conditions is unchecked
    Then WL: check membership page terms & conditions
    Then WL: click membership page terms & conditions link
    Then WL: expect membership page terms and conditions modal is present
    Then WL: click membership page terms & conditions modal x button

    Then WL: set membership page credit card number to 5417122242000949
    Then WL: click membership page submit button
    Then WL: expect membership page credit card number tooltip to be Stamps.com was unable to complete your registration because your payment method failed verification. Please correct your payment information.

  @sdcwr_membership_page_addr_validation
  Scenario: Membership Page Address Validation
    Then WL: navigates to default registration page for stamps with the following offer id 721
    Then WL: set profile page default values
    Then WL: set pp username to an existing username from db
    Then WL: set profile page promo code to empty
    Then WL: click profile page continue button
    Then WL: set membership page default values

    #Exact Address not Found
    Then WL: set membership page address to 5211 Pacific Concourse Dr
    Then WL: set membership page city to Los Angeles
    Then WL: select membership page state CA
    Then WL: set membership page zip to 90045
    Then WL: click membership page submit button
    Then WL: expect membership page exact addr modal header to be Exact address not found
    Then WL: expect membership page exact addr modal paragraph to be
    """
    The USPS address standardization system could not find your exact address. Select an address from the list below that best matches it:
    """
    Then WL: select membership page exact addr modal radio button index 2
    Then WL: click modal continue button
    Then WL: set username taken username to an existing username from db
    Then WL: click username taken continue button
    Then WL: click membership page standardized addr modal x button
    Then pause for 1 second
    Then WL: expect membership page address is 5211 Pacific Concourse Dr Apt 1102
    Then WL: expect membership page city is Los Angeles
    Then WL: expect membership page state is CA
    Then WL: expect membership page zip is 90045-6908

    #Autocomplete Profile Address
    Then pause for 1 second
    Then WL: set membership page address to 1990 E
    Then WL: click membership page address

    Then WL: select membership page address autocomplete index 1
    Then WL: expect membership page address is 1990 E Grand Ave
    Then WL: expect membership page city is El Segundo
    Then WL: expect membership page state is CA
    Then WL: expect membership page zip is 90245

    Then WL: click membership page address
    Then WL: select membership page address autocomplete index 2
    Then WL: expect membership page address is 1990 E Grand Ave
    Then WL: expect membership page city is Alhambra
    Then WL: expect membership page state is CA
    Then WL: expect membership page zip is 91801

    Then WL: click membership page address
    Then WL: select membership page address autocomplete index 3
    Then WL: expect membership page address is 1990 E Grand Ave
    Then WL: expect membership page city is Pomona
    Then WL: expect membership page state is CA
    Then WL: expect membership page zip is 91766

    Then WL: click membership page address
    Then WL: select membership page address autocomplete index 4
    Then WL: expect membership page address is 1990 E Grand Ave
    Then WL: expect membership page city is Escondido
    Then WL: expect membership page state is CA
    Then WL: expect membership page zip is 92027

    Then WL: click membership page address
    Then WL: select membership page address autocomplete index 5
    Then WL: expect membership page address is 1990 E Grand Ave
    Then WL: expect membership page city is Arroyo Grande
    Then WL: expect membership page state is CA
    Then WL: expect membership page zip is 93420

    # perfect address match
    Then WL: set membership page address to 610 Lairport St, El Segundo, CA
    Then WL: click membership page address

    Then WL: select membership page address autocomplete index count to be 1
    Then WL: select membership page address autocomplete index 1
    Then WL: expect membership page address is 610 Lairport St
    Then WL: expect membership page city is El Segundo
    Then WL: expect membership page state is CA
    Then WL: expect membership page zip is 90245

    #Autocomplete Billing Address
    Then WL: uncheck membership page billing address same as mailing address
    Then WL: set membership page billing address to 47 W 13th St

    Then WL: click membership page billing address
    Then WL: select membership page billing address autocomplete index 1
    Then WL: expect membership page billing address is 47 W 13th St
    Then WL: expect membership page billing city is Upland
    Then WL: expect membership page billing state is CA
    Then WL: expect membership page billing zip is 91786

    Then WL: set membership page billing address to 47 W 13th St
    Then WL: click membership page billing address
    Then WL: select membership page billing address autocomplete index 2
    Then WL: expect membership page billing address is 47 W 13th St
    Then WL: expect membership page billing city is Los Angeles
    Then WL: expect membership page billing state is CA
    Then WL: expect membership page billing zip is 90731

    Then WL: set membership page billing address to 47 W 13th St
    Then WL: click membership page billing address
    Then WL: select membership page billing address autocomplete index 3
    Then WL: expect membership page billing address is 47 W 13th St
    Then WL: expect membership page billing city is San Bernardino
    Then WL: expect membership page billing state is CA
    Then WL: expect membership page billing zip is 92405

    Then WL: set membership page billing address to 47 W 13th St
    Then WL: click membership page billing address
    Then WL: select membership page billing address autocomplete index 4
    Then WL: expect membership page billing address is W 13th St
    Then WL: expect membership page billing city is Azusa
    Then WL: expect membership page billing state is CA
    Then WL: expect membership page billing zip is 91702

    Then WL: set membership page billing address to 47 W 13th St
    Then WL: click membership page billing address
    Then WL: select membership page billing address autocomplete index 5
    Then WL: expect membership page billing address is 47 W 13th St
    Then WL: expect membership page billing city is Merced
    Then WL: expect membership page billing state is CA
    Then WL: expect membership page billing zip is 95341

    #Verify Physical Address Zone wise
    Then WL: set membership page personal info to random info between zone 1 and zone 3
    Then WL: expect membership page address is correct
    Then WL: expect membership page city is correct
    Then WL: expect membership page state is correct
    Then WL: expect membership page zip is correct
    Then WL: click membership page submit button
    Then WL: click modal x button

    Then pause for 1 second
    Then WL: set membership page personal info to random info between zone 5 and zone 8
    Then WL: expect membership page address is correct
    Then WL: expect membership page city is correct
    Then WL: expect membership page state is correct
    Then WL: expect membership page zip is correct
    Then WL: click membership page submit button

    Then WL: click modal x button
    Then WL: set pp username to an existing username from db
    Then WL: click profile page continue button


    #Invalid Address Modal
    Then WL: set membership page default values
    Then WL: set membership page address to kdjfkd
    Then WL: click membership page submit button
    Then WL: expect membership page invalid address modal header to be Invalid Address
    Then WL: expect membership page invalid address modal paragraph to be
    """
    Your address does not appear to be a valid USPS mailing address. Please verify that it is entered correctly. If you need assistance, please contact customer support at 1-888-434-0055, Monday - Friday, 6 a.m. - 6 p.m. Pacific Time.
    """
    Then WL: click modal x button

    #Standardize Address Modal
    Then WL: set membership page address to PO Box 2951 US-41
    Then WL: set membership page city to Inverness
    Then WL: select membership page state FL
    Then WL: set membership page zip to 34450
    Then WL: check membership page billing address same as mailing address
    Then WL: check membership page terms & conditions
    Then WL: click membership page submit button

    Then WL: expect membership page standardized addr modal header to be Your address has been standardized
    Then WL: expect membership page standardized addr modal paragraph to be
    """
    The USPS PC Postage™ program requires that the address used on your account be standardized for more efficient mail processing. The corrected portions are in bold below.
    """
    Then WL: expect membership page standardized addr modal original address label to be Original Address:
    Then WL: expect membership page standardized addr modal original address to be
    """
    PO Box 2951 US-41
    Inverness FL 34450
    """
    Then WL: expect membership page standardized addr modal standardized by the usps label to be Standardized by the USPS:
    Then WL: expect membership page standardized addr modal standardized by the usps address to be
    """
    PO Box 2951
    Inverness FL 34451-2951
    """
    Then WL: click membership page standardized addr modal continue button

    Then WL: click membership page back button
    Then WL: expect membership page address is PO Box 2951
    Then WL: expect membership page city is Inverness
    Then WL: expect membership page state is FL
    Then WL: expect membership page zip is 34451-2951

    Then WL: click membership page submit button

    #Postage meter Address Validation
    Then WL: expect postage meter page address to be An additional postage meter address is required
    Then WL: expect postage meter page address paragraph to be
    """
    Your mailing address has been standardized and accepted. However, this address cannot be used as your official USPS Postage Meter Address.
    Please provide an additional physical address (not a PO Box) where you will use your Stamps.com account to print postage.
    """
    Then WL: click membership page submit button
    Then WL: expect postage meter address tooltip to be This field is required
    Then WL: expect postage meter city tooltip to be This field is required
    Then WL: expect postage meter state tooltip to be This field is required
    Then WL: set postage meter address between zone 8
    Then WL: click membership page submit button

    Then WL: expect username taken header to be Username Taken

  @sdcwr_membership_page_username_taken_validation
  Scenario: Membership Page Username Taken Validation
    Then WL: navigates to default registration page for stamps with the following offer id 404
    Then WL: set profile page default values
    Then WL: set profile page promo code to PR33-NH77
    Then WL: set pp username to an existing username from db
    Then WL: click profile page continue button
    Then WL: set membership page default values
    Then WL: click membership page submit button

    Then WL: expect username taken header to be Username Taken
    Then WL: expect username taken paragraph to be
    """
    The username you have selected (USERNAME) is already in use.
    Please enter a different username and try again.
    """
    Then WL: expect username taken tooltip to be This field is required
    Then WL: set username taken to a
    Then WL: expect username taken tooltip to be 2 character minimum
    Then WL: set username taken username to an existing username from db
    Then WL: click username taken continue button
    Then WL: expect username taken header to be Username Taken

    Then WL: click modal x button

    Then WL: set membership page address to PO Box 659
    Then WL: set membership page city to Kosrae
    Then WL: select membership page state FM
    Then WL: set membership page zip to 96944

    Then WL: click membership page submit button
    Then WL: set pp username to an existing username from db
    Then WL: click profile page continue button
    Then WL: click membership page submit button

    Then WL: set postage meter address between zone 5 and zone 8
    Then WL: click membership page submit button

    Then WL: expect username taken header to be Username Taken
    Then WL: set username taken username to an existing username from db
    Then WL: click username taken continue button
    Then WL: expect username taken header to be Username Taken

    Then WL: set username taken to \abc
    Then WL: click username taken continue button
    Then WL: expect an error occurred modal head to be An Error Occurred
    Then WL: expect an error occurred modal paragraph to be
    """
    An unexpected error occurred, please try again. If the problem persists please contact customer support at 1‑888‑434‑0055, Monday - Friday, 6 a.m. - 6 p.m. Pacific Time.
    """
    Then WL: expect an error occurred modal error code to be Error Code: 2820099
    Then WL: expect an error occurred modal error description to include Username cannot be have backslashes
    Then WL: click modal x button