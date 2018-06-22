Feature: ORDERSAUTO-3353 New Sprint 11/22/17 WEBAPPS-6720 Update Default Checkbox State for Hide Label Value

  Background:
    Given a valid user is signed in to Web Apps

  @mail_hidden_postage
  Scenario: ORDERSAUTO-3353 New Sprint 11/22/17 WEBAPPS-6720 Update Default Checkbox State for Hide Label Value
    Then select print on Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to address random name, random company, 3217 Shasta Circle S., Los Angeles, CA 90065
    Then set print form ounces to 1
    Then select print form service PM Package
    Then show advanced options
    Then expect advanced options hide label value is checked
    Then select Advanced Options Extra Services

    Then check extra services return receipt for Merchandise
    Then click value must be shown window continue button
    Then expect extra services return receipt for merchandise is checked
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Return Receipt for Merchandise
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect extra services return receipt for merchandise is unchecked

    Then set extra services security to Registered Mail
    Then click value must be shown window continue button
    Then expect extra services security is Registered Mail
    Then check extra services return receipt
    Then check extra services restricted delivery
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Registered Mail
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Restricted Delivery
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Return Receipt
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect extra services security is None
    Then expect extra services return receipt is unchecked
    Then expect extra services restricted delivery is unchecked

    Then set extra services cod to 20.00
    Then click value must be shown window continue button
    Then expect extra services cod value is 20.00
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Collect On Delivery
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect extra services cod value is 0.00

    Then set extra services handling to Live Animal (with Fee)
    Then click value must be shown window continue button
    Then click special contents warning modal i agree
    Then expect Extra Services Handling is Live Animal (with Fee)
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Live Animal with Fee
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect Extra Services Handling is Normal

    Then close extra services
    Then select print form service FCM Large Envelope/Flat
    Then select Advanced Options Extra Services
    Then set extra services security to USPS Insurance
    Then set Extra Services Value to 1.00
    Then check extra services electronic return receipt
    Then click value must be shown window continue button
    Then expect Extra Services Electronic Return Receipt is checked
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Electronic Return Receipt
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect Extra Services Electronic Return Receipt is unchecked

    Then set extra services security to Certified Mail
    Then click value must be shown window continue button
    Then expect extra services security is Certified Mail
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Certified Mail
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect extra services security is None


  @mail_hidden_postage_backlog_1
  Scenario: ORDERSAUTO-3353 New Sprint 11/22/17 WEBAPPS-6720 Update Default Checkbox State for Hide Label Value







    Then sign out

  @mail_hidden_postage_backlog
  Scenario: ORDERSAUTO-3353 New Sprint 11/22/17 WEBAPPS-6720 Update Default Checkbox State for Hide Label Value
    Then check extra services return receipt for Merchandise
    Then click value must be shown window continue button
    Then expect extra services return receipt for merchandise is checked
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Return Receipt for Merchandise
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then extra Services Return Receipt for Merchandise is unchecked

    Then set extra services security to Registered Mail
    Then click value must be shown window continue button
    Then expect extra services security is Registered Mail
    Then check extra services return receipt
    Then check extra services restricted delivery
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Registered Mail
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect extra services security is None
    Then expect extra services return receipt is unchecked
    Then expect extra services restricted delivery is unchecked

    Then set extra services cod to 20.00
    Then click value must be shown window continue button
    Then expect extra services cod value is 20.00
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Collect on Delivery
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect extra services cod value is None

    Then set extra services handling to Live Animal (with Fee)
    Then click value must be shown window continue button
    Then expect Extra Services Handling is Live Animal (with Fee)
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Live Animal with Fee
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect Extra Services Handling is Normal

    Then close extra services
    Then select print form service FCM Large Envelope/Flat
    Then select Advanced Options Extra Services
    Then set extra services security to USPS Insurance
    Then set Extra Services Value to 1.00
    Then check extra services electronic return receipt
    Then click value must be shown window continue button
    Then expect Extra Services Electronic Return Receipt is checked
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Electronic Return Receipt
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect Extra Services Electronic Return Receipt is unchecked


    Then set extra services security to Certified Mail
    Then click value must be shown window continue button
    Then expect extra services security is Certified Mail
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Certified Mail
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect extra services security is None


    Then set extra services cod to 20.00
    Then click value must be shown window continue button
    Then expect extra services cod value is 20.00
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Collect on Delivery
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect extra services cod value is None

    Then set extra services handling to Live Animal (with Fee)
    Then click value must be shown window continue button
    Then expect Extra Services Handling is Live Animal (with Fee)
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Live Animal with Fee
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect Extra Services Handling is Normal

    Then close extra services
    Then select print form service FCM Large Envelope/Flat
    Then select Advanced Options Extra Services
    Then set extra services security to USPS Insurance
    Then set Extra Services Value to 1.00
    Then check extra services electronic return receipt
    Then click value must be shown window continue button
    Then expect Extra Services Electronic Return Receipt is checked
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Electronic Return Receipt
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect Extra Services Electronic Return Receipt is unchecked


    Then set extra services security to Certified Mail
    Then click value must be shown window continue button
    Then expect extra services security is Certified Mail
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Certified Mail
    Then click continue in Hidden Postage not Allowed modal
    Then select Advanced Options Extra Services
    Then expect extra services security is None


    Then close extra services
    Then select print form service PM Package











    Then expect extra services security price to be 11.70

    Then set Extra Services Value to 30.00
    Then expect extra services security price to be 12.50

    Then set extra services cod to 20.00
    Then expect extra services cod price to be 5.65

    Then check extra services return receipt
    Then expect extra services return receipt price to be 2.75

    Then check extra services restricted delivery
    Then expect extra services restricted delivery price to be 4.95

    Then check Extra Services Notice of Non-Delivery
    Then expect extra services notice of non-delivery price to be 0.00

    Then expect extra services total price to be 25.85

    Then save Extra Services

    Then select Advanced Options Extra Services

    Then expect extra services security price to be 12.50
    Then expect extra services return receipt price to be 2.75
    Then expect extra services restricted delivery price to be 4.95
    Then expect extra services cod price to be 5.65
    Then expect extra services notice of non-delivery price to be 0.00
    Then expect extra services total price to be 25.85

    Then save Extra Services
    Then sign out
