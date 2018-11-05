Feature: Contacts Modal Bugs

  Background:
    Given Start test driver

  @bug_postal_code_not_added_contact_details
  Scenario: BUG  WEBAPPS-11912 : Postal Code is not displayed in Details view for Contacts
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all available contacts with the value Contact postalcode
    #creating first valid contact with out postal code
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      | Contact postalcode |Durant Hotel|United States|2600 Durant Avenue|Berkeley|California|     | random | random |random  |random           |random    |
    Then in contacts grid uncheck row 1
    Then navigate to Mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then click mail-to link on print form
    Then expect search contacts modal is present
    Then set search contacts grid name Contact postalcode
    Then click search icon on search contacts modal
    Then check search contacts grid name Contact postalcode
    Then click select button on search contacts modal
    Then fetch value of mail-to address
    Then navigate to Contacts
    Then search contacts from contacts filter panel with name Contact postal_code
    Then in contacts grid check row 1
    Then expect contact address value after address cleansing is correct