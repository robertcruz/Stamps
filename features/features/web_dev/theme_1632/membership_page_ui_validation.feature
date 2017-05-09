Feature: Registration Membership page validation Theme 1632

  Background:
    Given I loaded registration theme 1632

  @registration_membership_page_ui_validation
  Scenario: Memebership Page Validation
    Then set Profile page Email to random value
    Then set Profile page Username to random value
    Then set Profile page Password to random value
    Then set Profile page Re-type password to same as previous password
    Then set Profile page Survey Question to Individual
    Then set Profile page Survey Question to Both mailing and shipping
    Then set Profile page Promo Code to PR33-NH77
    Then continue to Membership page

    # Membership Page
    Then set Membership page First Name to random value
    Then expect Membership page First Name is correct
    Then set Membership page Last Name to random value
    Then expect Membership page Last Name is correct
    Then set Membership page Company to random value
    Then expect Membership page Company is correct
    Then set Membership page Address to 1350 Market Street Apt 2901
    Then expect Membership page Address is correct

    Then set Membership page City to San Francisco
    Then expect Membership page City is correct

    Then select Membership page State CA
    Then expect Membership page State is correct

    Then set Membership page Zip to 94102
    Then expect Membership page Zip is correct

    Then set Membership page Phone to random value
    Then expect Membership page Phone is correct

    Then set Membership page Cardholder's Name to random value
    Then expect Membership page Cardholder's Name is correct

    Then set Membership page Credit Card Number to default value
    Then expect Membership page Credit Card Number is correct

    Then set Membership page Month to Dec (12)
    Then set Membership page Month to Nov (11)
    Then set Membership page Month to Oct (10)
    Then set Membership page Month to Sep (09)
    Then set Membership page Month to Aug (08)
    Then set Membership page Month to Jul (07)
    Then set Membership page Month to Jun (06)
    Then set Membership page Month to May (05)
    Then set Membership page Month to Apr (04)
    Then set Membership page Month to Mar (03)
    Then set Membership page Month to Feb (02)
    Then set Membership page Month to Jan (01)

    Then expect Membership page Month is correct

    Then set Membership page Year to 2027
    Then set Membership page Year to 2026
    Then expect Membership page Year is correct

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

    Then set Membership page member address to random address between zone 1 and 4
    Then expect Membership page City is correct
    Then expect Membership page City is correct
    Then expect Membership page State is correct
    Then expect Membership page Zip is correct

    Then set Membership page member billing address to random address between zone 1 and 4
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 5 and 8
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 5 and 8
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 1
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 1
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 2
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 2
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 3
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 3
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 4
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 4
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 5
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 5
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 6
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 6
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 7
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 7
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 8
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 8
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address in zone 2
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then check Membership page Terms & Conditions
    Then expect Membership page Terms & Conditions is checked

    Then uncheck Membership page Terms & Conditions
    Then expect Membership page Terms & Conditions is unchecked

    Then check Membership page Terms & Conditions


    #Then set Profile page retype password to password
    #Then set Profile page Usage Type list of values to contain Business Use - Mostly mailing (letters/postcards/flats
    #Then on Profile page page, continue to Membership page
    Then expect Registration navigation bar Stamps logo exists
    Then expect Registration navigation bar USPS logo exists
    #Then expect Registration bread crumbs to contain Profile
    #Then expect Registration bread crumbs to contain Membership
    #Then expect Registration bread crumbs to contain Choose Supplies
    Then expect Registration Membership header contain Set up your personal Post Office
    Then expect Registration Membership first name exists
    Then expect Registration Membership last name exists
    Then expect Registration Membership company exists
    Then expect Registration Membership address exists
    Then expect Registration Membership city exists
    Then expect Registration Membership state dropdown exists
    Then expect Registration Membership zip exists
    Then expect Registration Membership phone exists
    Then expect Registration Membership stamps logo exists
    Then expect Registration Membership usps logo exists
    Then expect Registration Membership paragraph to contain Postage Account Credit Card Authorization
    Then expect Registration Membership cardholders name exists
    Then expect Registration Membership credit card number exists
    Then expect Registration Membership month dropdown exists
    Then expect Registration Membership year dropdown exists
    #Then expect Registration Membership Billing address same as mailing address checkbox exists and is checkmarked
    #Then expect Registration Membership I agree to the Terms and conditions and Pricing details checkbox exists and is checkmarked
    Then expect Registration Membership back button exists
    Then expect Registration Membership submit button exists
    Then expect Registration Membership why do you need my mailing information to contain:
    """
    Since you are being issued a license to print official U.S. postage, the USPS requires you to register the name, telephone number and physical address from which your postage will be printed. This information will be used to create your Stamps.com account and to calculate the correct postage rates. Rest assured, your information is safe with us. We take identity protection seriously. Our advanced encryption technology keeps your information safe and secure.
    """
    Then expect Registration Membership Can I change my mailing address to contain:
    """
    Yes. If you move to a new location your Stamps.com account will follow you. Simply change the address for your postage license in the Stamps.com settings. This is very important since postage rates are calculated based on where the mail is sent from.
    """
    Then expect Registration Membership Can I use my Stamps.com account outside my office to contain:
    """
    Yes, with Stamps.com you can mail and ship from anywhere, whether it’s your office, your home or your hotel room. Just be sure to set the zip code of your location before printing postage.
    """
    Then expect Registration Membership Is my credit card information safe to contain:
    """
    Definitely. We use the highest level SSL encryption technology to secure all commerce transactions.
    """
    Then expect Registration Membership Pricing and billing details to contain:
    """
    If you decide to continue past the trial, you will be charged a service fee of just $15.99 per month. This includes the month following registration. For your convenience, your Stamps.com service will continue uninterrupted unless you decide to cancel. No service fee will be charged if you cancel within the trial period. Your credit card may also be used to pay for postage and optional services.
    """
    Then expect Registration Membership Cancel anytime to contain:
    """
    Cancel online or simply call us toll-free at 1-855-608-2677, M-F, 6am-6pm PST
    """
    Then expect Registration Membership Bonus Offer Details link exists and is clickable
    Then expect Profile page Privacy Policy link exists and is clickable
    Then expect Profile page copyright link exists
    #Then expect Profile page Norton logo exists
    Then expect Profile page TRUSTe logo exists
    Then expect Profile page LIVE chat button exists














