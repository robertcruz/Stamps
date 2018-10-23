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
    Then search for contact newly added from the contacts left navigation filter
    Then in contacts grid check row 1
    Then click print postage button on contacts toolbar
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then expect ship-to country on mail is correct?
    Then expect ship-to address on mail is correct?
    Then expect email on mail is correct?
    Then show advanced options
    Then expect reference # on mail is correct?
    Then expect cost code on mail is correct?

  @sdc_contacts_print_stamps_media_domestic
  Scenario: Contacts BVT Scenario 1 : Add new domestic contact and print postage
    Then sign-in to mail
    Then select print on Stamps
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |random  |random   |United States|189 Second Dr|Newburgh|New York|012550|random|random  |random      |random           |random      |
    Then in contacts grid uncheck row 1
    Then search for contact newly added from the contacts left navigation filter
    Then in contacts grid check row 1
    Then click print postage button on contacts toolbar
    Then expect ship-to country on mail is United States
    Then expect domestic address text area is not present
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then expect domestic address text area is present

  @sdc_contacts_print_stamps_media_international
  Scenario: Contacts BVT Scenario 1 : Click add, add new international contact  and print postage
    Then sign-in to mail
#Then navigate to Mail
    Then select print on Stamps
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |random  |random   |India|TCS House Rave Line Street|Mumbai|Mumbai|400001|random|random  |random      |random           |random      |
    Then in contacts grid uncheck row 1
    Then search for contact newly added from the contacts left navigation filter
    Then in contacts grid check row 1
    Then click print postage button on contacts toolbar
    Then expect ship-to country on mail is India
    Then expect domestic address text area is not present
    Then expect international address fields are not present
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then expect international address fields are present

