Feature:  History regression

  Background:
    Given Start test driver

  @container_label_return_address
  Scenario: Container label return address is user selected
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select mail from Test User2 - El Segundo, CA
    Then show advanced options
    Then set print form ship-to to international address
    | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
    | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then set customs license number to a random string
    Then set customs certificate number to some random string
    Then set customs invoice number to a random string
    Then set customs non-delivery options to Treat as abandoned
    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required
    Then set customs itn number to ITN123
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save postage message panel tracking number
    Then navigate to history
    Then expand eligible for on history filter panel
    Then select container label on history filter panel eligible for
    Then select row 1 on history grid

    Then expect print details on history is present
    Then expect return to on print details contains Test User2
    Then expect return to on print details contains El Segundo, CA
    Then sign out

  @container_label_return_address
  Scenario: Container label return address is default address
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then set customs license number to a random string
    Then set customs certificate number to some random string
    Then set customs invoice number to a random string
    Then set customs non-delivery options to Treat as abandoned
    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required
    Then set customs itn number to ITN123
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save postage message panel tracking number
    Then navigate to history
    Then click container label on history filter panel
    Then select row 1 on history grid
    Then expect print details on history is present
    Then expect return to on print details contains Test User1
    Then expect return to on print details contains El Segundo, CA
    Then sign out
