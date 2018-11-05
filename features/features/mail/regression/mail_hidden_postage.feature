Feature: ORDERSAUTO-3353 New Sprint 11/22/17 WEBAPPS-6720 Update Default Checkbox State for Hide Label Value

  Background:
    Given a valid user is signed in to Web Apps

  @mail_hidden_postage
  Scenario: ORDERSAUTO-3353 New Sprint 11/22/17 WEBAPPS-6720 Update Default Checkbox State for Hide Label Value
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to address random name, random company, 3217 Shasta Circle S., Los Angeles, CA 90065
    Then set print form ounces to 1
    Then select print form service PM Package
    Then show advanced options
    Then expect advanced options hide label value is checked
    Then click select extra services button on print form


    Then click continue button on value must be shown modal
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Return Receipt for Merchandise
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form

    Then set extra services security to Registered Mail
    Then click continue button on value must be shown modal
    Then expect extra services security is Registered Mail
    Then check return receipt on extra services modal
    Then check restricted delivery on extra services modal
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Registered Mail
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Restricted Delivery
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Return Receipt
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect extra services security is None
    Then expect return receipt on extra services modal is unchecked
    Then expect restricted delivery on extra services modal is unchecked

    Then set extra services cod to 20.00
    Then click continue button on value must be shown modal
    Then expect extra services cod value is $20.00
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Collect On Delivery
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect extra services cod value is $0.00

    Then set extra services handling to Live Animal (with Fee)
    Then click continue button on value must be shown modal
    Then click special contents warning modal i agree
    Then expect Extra Services Handling is Live Animal (with Fee)
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Live Animal with Fee
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect Extra Services Handling is Normal

    Then close extra services
    Then select print form service FCM Large Envelope/Flat
    Then click select extra services button on print form
    Then set extra services security to USPS Insurance
    Then set Extra Services Value to 1.00

    Then click continue button on value must be shown modal
    Then expect extra services electronic return receipt is checked
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Electronic Return Receipt
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect extra services electronic return receipt is unchecked

    Then set extra services security to Certified Mail
    Then click continue button on value must be shown modal
    Then expect extra services security is Certified Mail
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Certified Mail
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect extra services security is None


  @mail_hidden_postage_backlog_1
  Scenario: ORDERSAUTO-3353 New Sprint 11/22/17 WEBAPPS-6720 Update Default Checkbox State for Hide Label Value







    Then sign out

  @mail_hidden_postage_backlog
  Scenario: ORDERSAUTO-3353 New Sprint 11/22/17 WEBAPPS-6720 Update Default Checkbox State for Hide Label Value

    Then click continue button on value must be shown modal
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Return Receipt for Merchandise
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then extra Services Return Receipt for Merchandise is unchecked

    Then set extra services security to Registered Mail
    Then click continue button on value must be shown modal
    Then expect extra services security is Registered Mail
    Then check return receipt on extra services modal
    Then check restricted delivery on extra services modal
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Registered Mail
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect extra services security is None
    Then expect return receipt on extra services modal is unchecked
    Then expect restricted delivery on extra services modal is unchecked

    Then set extra services cod to 20.00
    Then click continue button on value must be shown modal
    Then expect extra services cod value is $20.00
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Collect on Delivery
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect extra services cod value is $None

    Then set extra services handling to Live Animal (with Fee)
    Then click continue button on value must be shown modal
    Then expect Extra Services Handling is Live Animal (with Fee)
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Live Animal with Fee
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect Extra Services Handling is Normal

    Then close extra services
    Then select print form service FCM Large Envelope/Flat
    Then click select extra services button on print form
    Then set extra services security to USPS Insurance
    Then set Extra Services Value to 1.00

    Then click continue button on value must be shown modal
    Then expect extra services electronic return receipt is checked
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Electronic Return Receipt
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect extra services electronic return receipt is unchecked


    Then set extra services security to Certified Mail
    Then click continue button on value must be shown modal
    Then expect extra services security is Certified Mail
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Certified Mail
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect extra services security is None


    Then set extra services cod to 20.00
    Then click continue button on value must be shown modal
    Then expect extra services cod value is $20.00
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Collect on Delivery
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect extra services cod value is $None

    Then set extra services handling to Live Animal (with Fee)
    Then click continue button on value must be shown modal
    Then expect Extra Services Handling is Live Animal (with Fee)
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Live Animal with Fee
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect Extra Services Handling is Normal

    Then close extra services
    Then select print form service FCM Large Envelope/Flat
    Then click select extra services button on print form
    Then set extra services security to USPS Insurance
    Then set Extra Services Value to 1.00

    Then click continue button on value must be shown modal
    Then expect extra services electronic return receipt is checked
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Electronic Return Receipt
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect extra services electronic return receipt is unchecked


    Then set extra services security to Certified Mail
    Then click continue button on value must be shown modal
    Then expect extra services security is Certified Mail
    Then save Extra Services
    Then expect advanced options hide label value is unchecked
    Then check advanced options hide label value
    Then expect Hidden Postage not Allowed modal appears due to Extra Service Certified Mail
    Then click continue in Hidden Postage not Allowed modal
    Then click select extra services button on print form
    Then expect extra services security is None


    Then close extra services
    Then select print form service PM Package












    Then set extra services cod to 20.00
    Then expect extra services cod price is $5.65

    Then check return receipt on extra services modal
    Then expect return receipt on extra services modal price to be 2.75

    Then check restricted delivery on extra services modal
    Then expect restricted delivery on extra services modal price to be 4.95


    Then expect extra services total cost is $25.85

    Then save Extra Services

    Then click select extra services button on print form

    Then expect return receipt on extra services modal price to be 2.75
    Then expect restricted delivery on extra services modal price to be 4.95
    Then expect extra services cod price is $5.65
    Then expect extra services total cost is $25.85

    Then save Extra Services
    Then sign out
