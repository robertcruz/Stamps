Feature:  Batch Print: Create Multiple Ship To Contacts View

  Background:
    Given Start test driver
    Then sign-in to orders
    Then navigate to Contacts
    #Delete existing contacts
    Then delete all available contacts with the value Diana Doly
    Then expect count of contact search results is 0
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country     | street_address | city   | state  | postal_code | phone      |  email | groups | reference_number|cost_code |
      |Diana Doly |Company a123 |United States|1 Cortlandt St  |New York|New York|10007    |random| random |random        |random           |random    |
    Then save contact details of Diana
    Then in contacts grid uncheck row 1
    Then delete all available contacts with the value Alex Persih
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name  | company | country       | street_address | city     | state    | postal_code | phone        |  email | groups | reference_number|cost_code |
      |Alex Persih |Company 456| United States | 2335 Wood Dr| Beloit | Wisconsin | 53511    | random | random |random        | random          | random        |
    Then save contact details of Alex
    Then in contacts grid uncheck row 1
    #navigate to mail page to verify multiple contact added
    Then navigate to Mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then click mail-to link on print form
    Then expect search contacts modal is present
    Then set search contacts grid name Diana Doly
    Then click search icon on search contacts modal
    Then check search contacts grid name Diana Doly
    Then set search contacts grid name Alex Persih
    Then click search icon on search contacts modal
    Then check search contacts grid name Alex Persih
    Then click select button on search contacts modal
    Then expect multiple contacts view is displayed

  @multiple_shipto_contacts_view
  Scenario: Multiple Contacts Selected and country field is disabled
    Then expect print form mail-to country is disabled
    Then expect value of print form mail-to country is United States

  @multiple_shipto_contacts_view
  Scenario: Multiple Contacts Selected and see list of contacts
    Then expect multiple contacts view include Diana Doly, Alex Persih

  @multiple_shipto_contacts_view
  Scenario: Multiple Contacts Selected and Hovers over Contact entry
    Then on mail-to text box hover over contact Diana
    Then expect tooltip of contact Diana is correct
    Then on mail-to text box hover over contact Alex
    Then expect tooltip of contact Alex is correct

  @multiple_shipto_contacts_view
  Scenario: Multiple Contacts Selected and contact is removed from list
    Then expect remove button is available for contact Diana
    Then expect remove button is available for contact Alex
    Then click remove button on contact Diana
    Then expect multiple contacts view is not displayed