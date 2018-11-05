
@international_rules
Feature: All International Rules

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international_dev
  Scenario: Add Missing Validation Logic for Phone and International Email
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details domestic ship-to country to Australia
    Then check row 1

    Then expect Order Details International Name data error tooltip is "A first and last name of at least two characters each is required"
    Then expect Order Details International Company data error tooltip is "Company name must be at least two characters long"
    Then expect Order Details International Address 1 data error tooltip is "The ship to address is a required field"
    Then expect Order Details International City data error tooltip is "The ship to city is a required field"
    Then expect Order Details International Phone data error tooltip is "A valid phone number is required"

    Then expect Order Details service data error tooltip is "Service is required"
    Then expect order details weight Lbs data error tooltip is "Weight cannot be 0"
    Then expect order details weight Oz data error tooltip is "Weight cannot be 0"
    Then sign out


  @rules_international_cuba
  Scenario: Cuba Internal Transaction Number Required
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Cuba    | random  | random  |

    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope
    Then click order details form customs form button
    Then set customs package contents to Commercial Sample
    Then expect customs internal transaction number is Required
    Then set customs package contents to Document
    Then expect customs internal transaction number is Required
    Then set customs package contents to Merchandise
    Then expect customs internal transaction number is Required
    Then set customs package contents to Gift
    Then expect customs internal transaction number is Not required
    Then set customs package contents to Humanitarian Donation
    Then expect customs internal transaction number is Not required
    Then set customs package contents to Returned Goods
    Then expect customs internal transaction number is Required
    Then set customs package contents to Other
    Then expect customs internal transaction number is Required

    Then add customs associated item 1, description random, qty 1, Price 3000, Made In United States, Tariff 10
    Then expect customs internal transaction number is Required
    Then set customs itn number to random
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then sign out


  @rules_international_iran
  Scenario: Iran Internal Transaction Number Required
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Iran    | random  | random  |
    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope

    Then click order details form customs form button
    Then expect customs internal transaction number is Required
    Then set customs package contents to Commercial Sample
    Then expect customs internal transaction number is Required
    Then set customs package contents to Document
    Then expect customs internal transaction number is Required
    Then set customs package contents to Merchandise
    Then expect customs internal transaction number is Required
    Then set customs package contents to Gift
    Then expect customs internal transaction number is Required
    Then set customs package contents to Humanitarian Donation
    Then expect customs internal transaction number is Required
    Then set customs package contents to Returned Goods
    Then expect customs internal transaction number is Required
    Then set customs package contents to Other
    Then expect customs internal transaction number is Required

    Then add customs associated item 1, description random, qty 1, Price 3000, Made In United States, Tariff 10
    Then expect customs internal transaction number is Required
    Then set customs itn number to random
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then sign out



  @rules_international_customs_fields_validation
  Scenario: International Shipping fields and Customs Information fields validation
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details domestic ship-to country to Japan

    Then expect Order Details International Address fields are visible
    Then expect Order Details Domestic Ship-To fields are hidden
    Then expect Order Details Customs Restrictions button is visible
    Then expect Order Details Customs Customs Form button is visible

    Then set order details ship-to international address to
      | full_name   | company | street_address1         | street_address2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope
    Then add order details item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Commercial Sample
    Then expect Customs More Info is hidden
    Then expect customs license number is visible
    Then expect customs certificate number is visible
    Then expect customs invoice number is visible

    Then set customs package contents to Document
    Then expect Customs More Info is visible
    Then expect customs license number is hidden
    Then expect customs certificate number is hidden
    Then expect customs invoice number is hidden

    Then set customs package contents to Gift
    Then expect Customs More Info is visible
    Then expect customs license number is hidden
    Then expect customs certificate number is hidden
    Then expect customs invoice number is hidden

    Then set customs package contents to Humanitarian Donation
    Then expect Customs More Info is visible
    Then expect customs license number is hidden
    Then expect customs certificate number is hidden
    Then expect customs invoice number is hidden

    Then set customs package contents to Merchandise
    Then expect Customs More Info is visible
    Then expect customs license number is hidden
    Then expect customs certificate number is hidden
    Then expect customs invoice number is hidden

    Then set customs package contents to Returned Goods
    Then expect Customs More Info is visible
    Then expect customs license number is hidden
    Then expect customs certificate number is hidden
    Then expect customs invoice number is hidden

    Then set customs package contents to Commercial Sample
    Then expect Customs More Info is hidden
    Then set customs license number to random
    Then set customs certificate number to random
    Then set customs invoice number to random

    Then set customs non-delivery options to Treat as abandoned
    Then set customs non-delivery options to Return to sender

    Then set customs internal transaction number to Required

    Then set customs internal transaction number to Not required

    Then set customs internal transaction number to Required
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to FCMI Large Envelope/Flat
    Then sign out



  @rules_international_nkorea
  Scenario: North Korea Internal Transaction Number Required
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Democratic People's Republic of (North) Korea| random  | random  |
    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope
    Then click order details form customs form button
    Then set customs package contents to Commercial Sample
    Then expect customs internal transaction number is Required
    Then set customs package contents to Document
    Then expect customs internal transaction number is Required
    Then set customs package contents to Merchandise
    Then expect customs internal transaction number is Required
    Then set customs package contents to Gift
    Then expect customs internal transaction number is Not required
    Then set customs package contents to Humanitarian Donation
    Then expect customs internal transaction number is Not required
    Then set customs package contents to Returned Goods
    Then expect customs internal transaction number is Required
    Then set customs package contents to Other
    Then expect customs internal transaction number is Required
    Then add customs associated item 1, description random, qty 1, Price 3000, Made In United States, Tariff 10
    Then expect customs internal transaction number is Required
    Then set customs itn number to random
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then sign out



  @international_rogue_countries_sudan
  Scenario: Sudan Internal Transaction Number Required
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Sudan    | random  | random  |

    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope

  #Then set order details service to FCMI Large Envelope/Flat
    Then click order details form customs form button
    Then expect customs internal transaction number is Required
    Then set customs package contents to Commercial Sample
    Then expect customs internal transaction number is Required
    Then set customs package contents to Document
    Then expect customs internal transaction number is Required
    Then set customs package contents to Merchandise
    Then expect customs internal transaction number is Required
    Then set customs package contents to Gift
    Then expect customs internal transaction number is Required
    Then set customs package contents to Humanitarian Donation
    Then expect customs internal transaction number is Required
    Then set customs package contents to Returned Goods
    Then expect customs internal transaction number is Required
    Then set customs package contents to Other
    Then expect customs internal transaction number is Required

    Then add customs associated item 1, description random, qty 1, Price 3000, Made In United States, Tariff 10
    Then expect customs internal transaction number is Required
    Then set customs itn number to random
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then sign out


  @rules_international_syria
  Scenario: Syria Internal Transaction Number Required
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Syria    | random  | random  |

    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope

  #Then set order details service to FCMI Large Envelope/Flat
    Then click order details form customs form button
    Then expect customs internal transaction number is Required
    Then set customs package contents to Commercial Sample
    Then expect customs internal transaction number is Required
    Then set customs package contents to Document
    Then expect customs internal transaction number is Required
    Then set customs package contents to Merchandise
    Then expect customs internal transaction number is Required
    Then set customs package contents to Gift
    Then expect customs internal transaction number is Required
    Then set customs package contents to Humanitarian Donation
    Then expect customs internal transaction number is Required
    Then set customs package contents to Returned Goods
    Then expect customs internal transaction number is Required
    Then set customs package contents to Other
    Then expect customs internal transaction number is Required

    Then add customs associated item 1, description random, qty 1, Price 3000, Made In United States, Tariff 10
    Then expect customs internal transaction number is Required
    Then set customs itn number to random
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then sign out



  @rules_international_over_2500
  Scenario: Customs Form Internal Transaction Number Required for total over $2500
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1         | street_address2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope
    Then add order details item 1, qty 1, id random, description random
    Then set order details service to FCMI Large Envelope/Flat
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 3000, Made In United States, Tariff 10
    Then expect customs internal transaction number is Required
    Then add customs associated item 1, description random, qty 1, Price 1, Made In United States, Tariff 10
    Then expect customs internal transaction number is Not required
    Then add customs associated item 1, description random, qty 1, Price 2501, Made In United States, Tariff 10
    Then expect customs internal transaction number is Required
    Then set customs itn number to random
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then sign out



  @rules_international_trx_no_not_required
  Scenario: Internal Transaction # Not Required
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Philippines    | random  | random  |
    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope
    Then set order details ounces to 5
    Then click order details form customs form button
    Then expect customs internal transaction number is Not required
    Then set customs package contents to Commercial Sample
    Then expect customs internal transaction number is Not required
    Then set customs package contents to Document
    Then expect customs internal transaction number is Not required
    Then set customs package contents to Merchandise
    Then expect customs internal transaction number is Not required
    Then set customs package contents to Gift
    Then expect customs internal transaction number is Not required
    Then set customs package contents to Humanitarian Donation
    Then expect customs internal transaction number is Not required
    Then set customs package contents to Returned Goods
    Then expect customs internal transaction number is Not required
    Then set customs package contents to Other
    Then expect customs internal transaction number is Not required
    Then expect customs internal transaction number is Not required
    Then set customs itn number to random
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then sign out


  @rules_international_name_stuff
  Scenario: Two character minimum for Name & Company
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details domestic ship-to country to Antigua & Barbuda
    Then set order details international ship-to name to a
    Then expect Order Details International Name data error tooltip is "A first and last name of at least two characters each is required"


    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details international ship-to name to abc def
    Then expect Order Details International Name data error tooltip is ""
    #Then expect Order Details International Company data error tooltip is ""
    #Then set order details international ship-to name to ""
    #Then set order details international ship-to company to "a"
    #Then expect Order Details International Company data error tooltip is "Company name must be at least two characters long"
    #Then set order details international ship-to name to a
    #Then set order details international ship-to company to ""
    #Then expect Order Details International Name data error tooltip is "A First Name and Last Name or Company are required"
    #Then expect Order Details International Company data error tooltip is "A First Name and Last Name or Company are required"
