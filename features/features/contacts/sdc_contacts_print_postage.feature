Feature:  Contacts BVT - Print Postage

  Background:
    Given Start test driver

  @sample
  Scenario: Printing Postage from Contacts Page

  @sdc_contact_top_nav_print_postage
  Scenario: Add a new contact and print postage from top navigation
    Then sign-in to orders
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |random  |random   |United States|189 Second St|Newburgh|New York|12550|random|random  |random      |random           |random      |
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name newly added
    Then in contacts grid check row 1
    Then click print postage button on contacts toolbar
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then expect ship-to country on mail is correct
    Then expect ship-to address on mail is correct
    Then expect email on mail is correct
    Then show advanced options
    Then expect reference # on mail is correct
    Then expect cost code on mail is correct
    Then sign out

  @mailto_validtion_for_multiple_contacts
  Scenario: validating mail to fields for multiple contacts selected in mail page
  WEBAPPAUTO-8 Batch Print: Create Multiple Ship To Contacts View
  WEBAPPAUTO-9 Batch Print : Search Contacts Modal for selecting multiple contacts in Mail
    Then sign-in to orders
    Then navigate to Contacts
    #Delete existing contacts
    Then delete all available contacts with the value Diana Doly
    Then expect count of contact search results is 0
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country     | street_address | city   | state  | postal_code | phone      |  email | groups | reference_number|cost_code |
      |Diana Doly |random   |United States|1 Cortlandt St  |New York|New York|10007        |random| random |random        |random           |random    |
    Then save contact details of Diana
    Then in contacts grid uncheck row 1
    Then delete all available contacts with the value Alex Persih
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name  | company | country       | street_address | city     | state    | postal_code | phone        |  email | groups | reference_number|cost_code |
      |Alex Persih |random   | United States | 189 Second St| Newburgh | New York | 12550    | random | random |random        | random          | random         |
    Then save contact details of Alex
    Then in contacts grid uncheck row 1
    #navigate to mail page to verify multiple contact added
    Then navigate to Mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then click mail-to link on print form
    Then expect search contacts modal is present
    #WEBAPPAUTO-17 Contacts: RETRIEVE CONTACTS FROM MAIL PAGE
    #WEBAPPAUTO-9 - Batch Print : Search Contacts Modal for selecting multiple contacts in Mail
    Then set search contacts grid name Diana Doly
    Then click search icon on search contacts modal
    Then check search contacts grid name Diana Doly
    Then set search contacts grid name Alex Persih
    Then click search icon on search contacts modal
    Then check search contacts grid name Alex Persih
    Then click select button on search contacts modal
    #Multiple Contacts Selected and country field is disabled
    Then expect print form mail-to country is disabled
    Then expect value of print form mail-to country is United States
    #Multiple Contacts Selected and see list of contacts
    Then expect multiple contacts view is displayed
    Then expect multiple contacts view include Diana Doly, Alex Persih
    # Multiple Contacts Selected and Hovers over Contact entry
    Then on mail-to text box hover over contact Diana
    Then expect tooltip of contact Diana is correct
    Then expect remove button is available for contact Diana
    Then on mail-to text box hover over contact Alex
    Then expect tooltip of contact Alex is correct
    Then expect remove button is available for contact Alex
    #Multiple Contacts Selected and contact is removed from list
    Then click remove button on contact Diana
    Then expect multiple contacts view is not displayed
    Then sign out

