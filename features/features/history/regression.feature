Feature:  History regression

  Background:
    Given Start test driver

  @container_label_return_address
  @container_label_return_address_selected
  Scenario: Container label return address is user selected
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to Test User2 - El Segundo, CA
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label
    #Then expct print form print message labels
#    Then click print button on mail print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then expand eligible for on history filter panel
    Then select container label on history filter panel eligible for
    Then check row 1 on history grid
    Then click create container label button on history toolbar
    Then click selected packages button on history toolbar create container label
    Then click print label on container label modal
    Then click print button on ready to print modal
    Then close your container label modal on history
    Then expand date printed on history filter panel
    Then select today on history filter panel
    Then check row 1 on history grid
    Then expect print details on history is present
    Then expect return to on history print details contain Test User2
    Then expect return to on history print details contain El Segundo, CA
    Then sign out

  @container_label_return_address
  Scenario: Container label return address is default address
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to GAPqacc02 GAPqacc02 - EL SEGUNDO, CA
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then click print button on mail print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then expand eligible for on history filter panel
    Then select container label on history filter panel eligible for
    Then check row 1 on history grid
    Then click create container label button on history toolbar
    Then click selected packages button on history toolbar create container label
    Then click print label on container label modal
    Then click print button on ready to print modal
    Then close your container label modal on history
    Then expand date printed on history filter panel
#    Then pause for 2 seconds
    Then select today on history filter panel
    Then check row 1 on history grid
    Then expect print details on history is present
    Then expect return to on history print details contain GAPqacc02 GAPqacc02
    Then expect return to on history print details contain EL SEGUNDO, CA
    Then sign out