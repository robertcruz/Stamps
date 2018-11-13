Feature:  Mail BVT

  Background:
    Given Start test driver


  @alex_mail_test
  Scenario: Alex Test Services
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select print form service FCM Large Envelope/Flat
    Then set print form weight to lbs 0 oz 1
    Then select print form service FCM Package/Thick Envelope
    Then set print form weight to lbs 1 oz 2
    Then select print form service PM Large/Thick Envelope
#    Then set print form weight to lbs 0 oz 3
    Then select print form service PM Flat Rate Envelope
    Then set print form weight to lbs 5 oz 0
    Then select print form service PM Large Package
#    Then set print form weight to lbs 0 oz 3
    Then select print form service PM Padded Flat Rate Envelope
    Then select print form service PM Legal Flat Rate Envelope
    Then select print form service PM Small Flat Rate Box
#    Then select print form service PM Medium Flat Rate Box
#    Then select print form service PM Large Flat Rate Box
#    Then select print form service PM Regional Rate Box A
#    Then select print form service PM Regional Rate Box B
#    Then select print form service PME Package/Flat/Thick Envelope
#    Then select print form service PME Flat Rate Envelope
#    Then select print form service PME Padded Flat Rate Envelope
#    Then select print form service PME Legal Flat Rate Envelope
#    Then select print form service MM Package/Flat/Thick Envelope
#    Then select print form service PSG Package/Flat/Thick Envelope
#    Then select print form service PSG Large Package
#    Then select print form service PSG Oversized Package
    Then sign out

  @mail_bvt_international
  Scenario: International Shipping
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then show advanced options
    #Then set Advanced Options Mail Date to today
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button

    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Document
#Then set customs more info to some random string
    Then set customs package contents to Commercial Sample
    Then expect customs package contents is Commercial Sample
    Then set customs license number to a random string
    Then expect customs license number is correct
    Then set customs certificate number to some random string
    Then expect customs certificate number is correct
    Then set customs invoice number to a random string
    Then expect customs invoice number is correct

    Then set customs non-delivery options to Treat as abandoned
    Then expect customs non-delivery options is Treat as abandoned

    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required

    Then set customs itn number to ITN123

    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 2, description Item 2, qty 2, Price 2, Made In Japan, Tariff 2
    Then add customs associated item 3, description Random String, qty 3, Price 3, Made In Canada, Tariff 3

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then click print form edit customs form button
    Then pause for 1 second
    Then expect customs package contents is Commercial Sample
    Then expect customs license number is correct
    Then expect customs certificate number is correct
    Then expect customs invoice number is correct

    Then expect customs non-delivery options is Treat as abandoned
    Then expect customs internal transaction number is Required

    Then expect customs associated item 1 Description is correct
    Then expect customs associated item 1 Quantity is correct
    Then expect customs associated item 1 Unit Price is correct
    Then expect customs associated item 1 Made In is correct
    Then expect customs associated item 1 Tariff is correct

    Then expect customs associated item 2 Description is correct
    Then expect customs associated item 2 Quantity is correct
    Then expect customs associated item 2 Unit Price is correct
    Then expect customs associated item 2 Made In is correct

    Then expect customs associated item 3 Description is correct
    Then expect customs associated item 3 Quantity is correct
    Then expect customs associated item 3 Unit Price is correct
    Then expect customs associated item 3 Made In is correct
    Then expect customs associated item 3 Tariff is correct

    Then expect i agree to the usps privacy act statement is checked on customs form
    Then expect Customs Total Value is correct
    Then close customs information form
    Then sign out

  @mail_authentication
  Scenario: Mail - Authentication
    Then sign-in to mail
    Then open sign in modal in Mail
    Then set Mail username
    Then set Mail password
    Then check Remember Username
    Then uncheck Remember Username
    Then check Remember Username
    Then click the Sign In button in Mail
    Then expect user is signed in

    Then visit Mail
    Then open sign in modal in Mail
    Then expect username is present in Mail username field
    Then expect Remember Username is checked
    Then visit Mail
    Then open sign in modal in Mail
    Then set Mail username
    Then click the Sign In button in Mail
    Then expect Mail Sign In Modal error Your username or password is invalid.

  @mail_authentication_mobile
  Scenario: Mail - Authentication
    Then sign-in to mail
    #Then sign-in to orders
    Then sign out

  @rob_cccc
  Scenario: Address Cleansing
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
#    Then set print form mail-from to Manage Mailing Addresses...
    Then set print form mail-to country to United States
    Then set print form mail-to country to Brazil
    Then set print form mail-to country to United States
    Then set print form mail-to country to Japan
    Then set print form mail-to country to United States
    Then set print form mail-to to address to Address Cleansing, BVT, 1350 Market Street #2905, San Francisco, CA
#    Then set print form ounces to 1
#    Then select print form service PM Package
#    Then expect Print form Domestic Address field displays Address Cleansing, BVT, 1350 Market Street, San Francisco, CA 94102-5401
    Then sign out

  @mail_bvt_stamps
  Scenario: Mail BVT-Stamps
    Then sign-in to mail
    Then select print on Stamps
    Then set print form serial number to C12345
    Then select print form specify postage amount
    Then select print form service Media Mail
    Then set print form stamp amount to 3.00
    Then set print form stamp quantity to 1
    Then set print form serial number to B12345
    Then select print form calculate postage amount
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then sign out

  @mail_print_on_lov
  Scenario: Print-on list of values
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select print form service PM Package
    Then select print form service PM Flat Rate Envelope
    Then select print form service PM Medium Flat Rate Box

    Then select print on Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then select print on Envelope - #10, 4 ⅛" x 9 ½"
    Then select print on Envelope - #9, 3 ⅞" x 8 ⅞"
    Then select print on Envelope - #A9, 5 ¾" x 8 ¾"
    Then select print on Envelope - #6, 3 ⅝" x 6 ½"
    Then select print on Envelope - #A2, 4 ⅜" x 5 ¾"
    Then select print on Envelope - #7, 3 ⅞" x 7 ½"
    Then select print on Envelope - #11, 4 ½" x 10 ⅜"
    Then select print on Envelope - #12, 4 ¾" x 11"
    Then select print on Certified Mail Label - SDC-3610
    Then select print on Certified Mail Label - SDC-3710
    Then select print on Certified Mail Label - SDC-3910
    Then select print on Certified Mail Label - SDC-3930
    Then select print on Certified Mail #11 Envelope - SDC-3810
    Then select print on Roll - 4" x 6" Shipping Label
    Then select print on Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then select print on Stamps
    Then select print on Manage Printing Options...

  @rob_test
  Scenario: Advanced Options for Envelope - 10
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 8
    Then select print form service PM Package
    Then set print form weight to lbs 1 oz 1
    Then set print form dimensions to length 2 width 2 height 2

    Then show advanced options
    Then hide advanced options
    Then show advanced options
    #Then expect print form advanced options extra services button is visible

    Then set mail ship date to 05/31/2018
    Then open mail ship date picker
    Then click today on mail ship date picker
    Then click mail ship date picker today plus 0
    Then click mail ship date picker today plus 1
    Then click mail ship date picker today plus 2
    Then click mail ship date picker today plus 3
    Then click mail ship date picker today plus 4
    Then click mail ship date picker today plus 5


#    Then set Advanced Options Mail Date to today
#    Then expect print form advanced options mail date is present
#    Then set Advanced Options Mail Date to date 04/04/2017
#    Then expect Advanced Options Mail Date is 04/04/2017
#    Then set Advanced Options Mail Date to today
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to tomorrow
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to today plus 0
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to today plus 1
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to today plus 2
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to today plus 3
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to today plus 4
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to today plus 5
#    Then expect Advanced Options Mail Date is correct
#
#    Then expect advanced options include return address is present
#    Then check advanced options include return address
#    Then expect advanced options include return address is checked
#    Then uncheck advanced options include return address
#    Then expect advanced options include return address is unchecked
#
#    Then expect advanced options include delivery address is present
#    Then check advanced options include delivery address
#    Then expect advanced options include delivery address is checked
#    Then uncheck advanced options include delivery address
#    Then expect advanced options include delivery address is unchecked
#
#    Then expect advanced options include postage is present
#    Then check advanced options include postage
#    Then expect advanced options include postage is checked
#    Then uncheck advanced options include postage
#    Then expect advanced options include postage is unchecked
#
#    Then expect print form advanced options reference number field is present
#    Then set print form advanced options reference number to random string
#    Then expect print form advanced options reference number is correct
#
#    Then expect advanced options cost code field is present
#    Then set print form advanced options cost code None
#    Then expect print form advanced options cost code is None

  @mail_bvt_ui_validation
  Scenario: BVT Mail UI Validation for Print On options
    Then sign-in to mail

#    STAMPS
    Then select print on Stamps
    Then set print form serial number to random
    Then blur out on print form
    Then select print form specify postage amount
    Then set print form mail-to country to United States
    Then select print form service First Class
    Then select print form service Media Mail
    #Then set print form stamp amount 1.23
    Then hide advanced options
    Then show advanced options
    Then select print form calculate postage amount
    Then increment print form weight by lbs 2 oz 2
    Then decrement print form weight by lbs 2 oz 2
    Then set print form weight to lbs 0 oz 1
    Then select print form service FCM Postcard
    Then select print form service FCM Letter
    Then select print form service FCM Large Envelope/Flat
    Then select print form service MM Package/Flat/Thick Envelope
    Then set print form advanced options reference number to STMP123
    Then set print form advanced options cost code None
    #Then set print form stamp quantity 3
    Then increment print form stamp quantity by 2
    Then decrement print form stamp quantity by 2
    Then check print form print all
    Then uncheck print form print all
    Then sign out

  @mail_bvt_ui_validation
  Scenario: BVT Mail UI Validation for Print On options
    Then sign-in to mail
    Then select print on Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then select print on Envelope - #10, 4 ⅛" x 9 ½"
    Then select print on Envelope - #9, 3 ⅞" x 8 ⅞"
    Then select print on Envelope - #A9, 5 ¾" x 8 ¾"
    Then select print on Envelope - #6, 3 ⅝" x 6 ½"
    Then select print on Envelope - #A2, 4 ⅜" x 5 ¾"
    Then select print on Envelope - #7, 3 ⅞" x 7 ½"
    Then select print on Envelope - #11, 4 ½" x 10 ⅜"
    Then select print on Envelope - #12, 4 ¾" x 11"
    Then select print on Certified Mail Label - SDC-3610
    Then select print on Certified Mail Label - SDC-3710
    Then select print on Certified Mail Label - SDC-3910
    Then select print on Certified Mail Label - SDC-3930
    Then select print on Certified Mail #11 Envelope - SDC-3810
    Then select print on Certified Mail #11 Envelope - SDC-3830
    Then select print on Roll - 4" x 6" Shipping Label
    Then select print on Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then sign out

  @mail_bvt_ui_validation
  Scenario: BVT Mail UI Validation for Print Services
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then click print form mail to link
    Then close search contacts modal
    Then set print form mail-to to a random address in zone 8
    Then set print form email tracking stamps@mailinator.com
    Then select print form service FCM Large Envelope/Flat
    Then select print form service FCM Package/Thick Envelope
    Then select print form service PM Large/Thick Envelope
    Then select print form service PM Flat Rate Envelope
    Then select print form service PM Large Package
    Then select print form service PM Padded Flat Rate Envelope
    Then select print form service PM Legal Flat Rate Envelope
    Then select print form service PM Small Flat Rate Box
    Then select print form service PM Medium Flat Rate Box
    Then select print form service PM Large Flat Rate Box
    Then select print form service PM Regional Rate Box A
    Then select print form service PM Regional Rate Box B
    Then select print form service PME Package/Flat/Thick Envelope
    Then select print form service PME Flat Rate Envelope
    Then select print form service PME Padded Flat Rate Envelope
    Then select print form service PME Legal Flat Rate Envelope
    Then select print form service MM Package/Flat/Thick Envelope
    Then select print form service PSG Package/Flat/Thick Envelope
    Then select print form service PSG Large Package
    Then select print form service PSG Oversized Package
    Then sign out

  @mail_bvt_ui_validation
  Scenario: BVT Mail UI Validation - Extra Services
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 8
    Then set print form email tracking stamps@mailinator.com
    Then select print form service PM Package
    Then set print form weight to lbs 1 oz 1
    Then increment print form dimensions by length 2 width 2 height 2
    Then decrement print form dimensions by length 2 width 2 height 2
    Then set print form dimensions to length 2 width 2 height 2
    Then set print form tracking Signature Required
    Then set print form tracking USPS Tracking
    Then set print form insure for to $100
    Then set print form insure for to $0

#    EXTRA SERVICES
    Then click select extra services button on print form
    Then check fragile on extra services modal
    Then uncheck fragile on extra services modal

    Then expect value must be shown modal is present
    Then click continue button on value must be shown modal
    Then click extra services form 3811
    Then close form 3811 modal
    Then check hold for pickup on extra services modal
    Then uncheck hold for pickup on extra services modal
    Then set extra services security to USPS Insurance
    Then set extra services security to Registered Mail
    Then increment extra services security value by 2
    Then decrement extra services security value by 2
    Then set extra services security value to 3
    Then set extra services security value to 0
    Then check return receipt on extra services modal
    Then uncheck return receipt on extra services modal
    Then check restricted delivery on extra services modal
    Then uncheck restricted delivery on extra services modal
    Then blur out on extra services form
    Then increment extra services cod by 2
    Then decrement extra services cod by 2
    Then set extra services cod to 3
    Then pause for 15 second

    Then set extra services cod to 0
    Then blur out on extra services form
    Then set extra services handling to Hazardous Materials
    Then click special contents warning modal i agree
    Then set extra services handling to Live Animal
    Then click special contents warning modal i agree
    Then set extra services handling to Live Animal (with Fee)
    Then click special contents warning modal i agree
    Then set extra services handling to Normal
    Then close extra services
    Then select print form service PME Flat Rate Envelope
    Then click select extra services button on print form
    Then close extra services

    Then click advanced options service commitments
    Then close advanced options service commitments modal

#    ADVANCED OPTIONS
    Then uncheck advanced options hide label value
    Then check advanced options hide label value
    Then check advanced options print receipt
    Then uncheck advanced options print receipt
    Then check advanced options print reference #
    Then uncheck advanced options print reference #

    Then sign out

  @mail_bvt_ui_validation
  Scenario: BVT Mail UI Validation for Envelopes
    Then sign-in to mail
    Then select print on Envelope - #10, 4 ⅛" x 9 ½"
    Then set print form mail-to to a random address in zone 2
    Then set print form weight to lbs 0 oz 1
    Then select print form service FCM Letter
    Then click select extra services button on print form
    Then close extra services
    Then check advanced options include return address
    Then uncheck advanced options include return address
    Then check advanced options include delivery address
    Then uncheck advanced options include delivery address
    Then check advanced options include postage
    Then uncheck advanced options include postage
    Then sign out

  @mail_bvt_ui_validation
  Scenario: BVT Mail UI Validation for Certified Mail
    Then sign-in to mail
    Then select print on Certified Mail Label - SDC-3610
    Then set print form mail-to to a random address in zone 8
    Then set print form weight to lbs 0 oz 1
    Then select print form service FCM Letter


    Then check restricted delivery on extra services modal
    Then uncheck restricted delivery on extra services modal
    Then select print on Certified Mail Label - SDC-3910
    Then check return receipt on extra services modal
    Then uncheck return receipt on extra services modal
    Then sign out

  @mail_bvt_ui_validation
  Scenario: BVT Mail UI Validation International form
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then show advanced options
    #Then set Advanced Options Mail Date to today
    Then set print form ship-to to international address
      | name   | company | street_address_1 | street_address_2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service FCMI Package/Thick Envelope
    Then select print form service PMI Package/Flat/Thick Envelope
    Then select print form service PMI Flat Rate Envelope
    Then select print form service PMI Padded Flat Rate Envelope
    Then select print form service PMI Legal Flat Rate Envelope
    Then select print form service PMI Small Flat Rate Box
    Then select print form service PMI Medium Flat Rate Box
    Then select print form service PMI Large Flat Rate Box
    Then select print form service PMEI Package/Flat/Thick Envelope
    Then select print form service PMEI Flat Rate Envelope
    Then select print form service PMEI Padded Flat Rate Envelope
    Then select print form service PMEI Legal Flat Rate Envelope
    Then select print form service PMI Flat Rate Envelope

    Then click print form restrictions button
    Then click restrictions modal ok
    Then click print form edit customs form button

    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Document
#    Then set customs more info to random string
    Then set customs package contents to Commercial Sample
    Then expect customs package contents is Commercial Sample
    Then set customs license number to a random string
    Then expect customs license number is correct
    Then set customs certificate number to some random string
    Then expect customs certificate number is correct
    Then set customs invoice number to a random string
    Then expect customs invoice number is correct

    Then set customs non-delivery options to Treat as abandoned
    Then expect customs non-delivery options is Treat as abandoned

    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required

    Then set customs itn number to ITN123

    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then increment customs associated item 1 qty by 2
    Then decrement customs associated item 1 qty by 2

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then click print form edit customs form button
    Then pause for 1 second
    Then expect customs package contents is Commercial Sample
    Then expect customs license number is correct
    Then expect customs certificate number is correct
    Then expect customs invoice number is correct

    Then expect customs non-delivery options is Treat as abandoned
    Then expect customs internal transaction number is Required

    Then expect customs associated item 1 Description is correct
    Then expect customs associated item 1 Quantity is correct
    Then expect customs associated item 1 Unit Price is correct
    Then expect customs associated item 1 Made In is correct
    Then expect customs associated item 1 Tariff is correct

    Then expect i agree to the usps privacy act statement is checked on customs form
    Then expect Customs Total Value is correct
    Then close customs information form

    Then check advanced options hide label value
    Then uncheck advanced options hide label value
    Then check advanced options print receipt
    Then uncheck advanced options print receipt
#    Then expect advanced options print reference # is disabled

    Then sign out

  @mail_bvt_ui_validation
  Scenario: BVT Mail UI Validation of Toolbar
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then expect mail toolbar print is present
    Then set print form mail-to to a random address in zone 8
    Then select print form service PM Package
    Then set print form weight to lbs 0 oz 1
    Then set print form dimensions to length 2 width 2 height 2
    Then click mail toolbar print dropdown
    Then expect mail toolbar print label is present
    Then expect mail toolbar print sample is present
    Then blur out on print form
    Then click mail toolbar favorites
    Then pause for 15 seconds
    Then click mail toolbar save as favorite
    Then set save as favorite modal name to random
    Then check save as favorite modal include delivery address
    Then save save as favorite modal
    Then click mail toolbar favorites
    Then click mail toolbar manage favorites
    Then select on manage favorites modal row 1
    Then click manage favorites modal rename
    Then set favorite modal rename name to random
    Then save favorite modal rename
    Then click manage favorites modal delete
    Then click manage favorites delete modal delete button
    Then close manage favorites modal
    Then click mail toolbar reset button
    Then click mail toolbar feedback
    Then close feedback modal
    Then click mail toolbar settings
    Then close settings modal
    Then sign out

  @mail_bvt_ship_date
  Scenario: Change Ship Date and Postdate Time
    Then sign-in to mail
    Then open mail settings modal
    Then set mail settings postdate to now +2 hours
    Then close mail settings modal
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to address to Address Cleansing, BVT, 1350 Market Street #2905, San Francisco, CA
    Then set print form ounces to 4
    Then select print form service PM Flat Rate Envelope
    Then expect print form advanced options ship date is 0 days from today
    Then open mail settings modal
    Then set mail settings postdate to now -2 hours
    Then close mail settings modal
    Then expect settings link is present in notification bar
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 2
    Then select print form service PM Padded Flat Rate Envelope
    Then expect print form advanced options ship date is 1 days from today
    Then open mail settings modal
    Then set mail settings postdate to now +2 hours
    Then close mail settings modal
    Then set print form ounces to 3
    Then select print form service PM Legal Flat Rate Envelope
    Then expect print form advanced options ship date is 0 days from today
    Then set print form ship date to today
    Then expect print form advanced options ship date is 0 days from today
    Then set print form advanced options ship date to today plus 1
    Then expect print form advanced options ship date is 1 day from today
    Then set print form advanced options ship date to today plus 2
    Then expect print form advanced options ship date is 2 days from today
    Then set print form ship date to today
    Then expect print form advanced options ship date is 0 days from today

    Then open mail settings modal
    Then set mail settings postdate to 5:00 p.m.
    Then close mail settings modal
    Then sign out

  @mail_bvt_extra_services
  Scenario: Extra Services
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-to country to United States
    Then set print form mail-to to address random name, random company, 3217 Shasta Circle S., Los Angeles, CA 90065
    Then set print form ounces to 1
    Then select print form service PM Padded Flat Rate Envelope
    Then expect advanced options hide label value is checked
    Then click select extra services button on print form
    Then set extra services security to Registered Mail
    Then set extra services security value to 30.00
    Then set extra services cod to 20.00
    Then expect extra services cod price is $5.70
    Then check return receipt on extra services modal
    Then expect extra services return receipt price to be 2.75
    Then check restricted delivery on extra services modal
    Then expect restricted delivery on extra services modal price to be 5.10

    Then expect extra services total cost is $26.15
    Then save extra services
    Then click select extra services button on print form
    Then expect extra services return receipt price to be 2.75
    Then expect restricted delivery on extra services modal price to be 5.10
    Then expect extra services cod price is $5.70
    Then expect extra services total cost is $26.15
    Then save extra services
    Then sign out

  @mail_bvt_purchasing
  Scenario: Purchasing $10
    Then sign-in to mail
    Then save balance amount
    Then hover on navigation menu balance
    Then click on navigation menu buy more
    Then on add funds modal, purchase 10
    Then on add funds modal, click purchase button
    Then buy mail confirm purchase: expect text area contains, please confirm your $10.00 postage purchase.
    Then buy mail confirm transction: click confirm button
    Then buy mail purchase approved: expect text area contains, your fund request for $10.00 has been approved.
    Then buy mail purchase approved: click ok button
    Then buy mail: expect customer balance increased by $10
    Then sign out

  @mail_bvt_address_cleansing
  Scenario: Address Cleansing
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to country to United States
    Then set print form mail-to to address to Address Cleansing, Google, 1600 Amphitheatre Pkwy, Mountain View, CA 94043
    Then set print form ounces to 1
    Then select print form service PM Package
    Then expect Print form Domestic Address field displays Address Cleansing, Google, 1600 Amphitheatre Pkwy, Mountain View, CA 94043-1351
    Then sign out

    # ------------------------------------------------------------ Shipping Labels Advanced Options
  @mail_bvt_advanced_options
  @mail_advanced_options_paper
  Scenario: Advanced Options for Shipping Label - 8 ½" x 11" Paper
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 1
    Then select print form service PM Package
    Then show advanced options
    Then expect print form advanced options extra services button is present
    Then expect advanced options hide label value is present
    Then check advanced options hide label value
    Then expect advanced options hide label value is checked
    Then uncheck advanced options hide label value
    Then expect advanced options hide label value is unchecked
    Then expect advanced options print receipt is present
    Then check advanced options print receipt
    Then expect advanced options print receipt is checked
    Then uncheck advanced options print receipt
    Then expect advanced options print receipt is unchecked
    Then expect advanced options print reference # is present
    Then check advanced options print reference #
    Then expect advanced options print reference # is checked
    Then uncheck advanced options print reference #
    Then expect advanced options print reference # is unchecked
    Then expect print form advanced options reference number field is present
    Then set print form advanced options reference number to random string
    Then expect print form advanced options reference number is correct
    Then expect advanced options cost code field is present
    Then set print form advanced options cost code None
    Then expect print form advanced options cost code is None
    Then sign out