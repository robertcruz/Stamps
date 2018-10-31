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