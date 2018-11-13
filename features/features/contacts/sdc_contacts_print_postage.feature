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

  @contacts_print_postage_single_from_details
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
    Then click on contact details menu dropdown
    Then select contact details menu Print Postage
    Then expect delete contacts modal is displayed
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then expect ship-to country on mail is correct
    Then expect ship-to address on mail is correct
    Then expect email on mail is correct
    Then show advanced options
    Then expect reference # on mail is correct
    Then expect cost code on mail is correct
    Then sign out

    @contacts_print_postage_multiple_domestic_from_top_nav
    Scenario: Add a new contact and print postage from top navigation
      Then sign-in to orders
      Then navigate to Contacts
#      Then click add button on contacts toolbar
#      Then set contact details to
#        | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
#        |Print postage1  |random   |United States|189 Second St|Newburgh|New York|12550|random|random  |random      |random           |random      |
#      Then in contacts grid uncheck row 1
#      Then click add button on contacts toolbar
#      Then set contact details to
#        | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
#        |Print postage2  |random   |United States|189 Second St|Newburgh|New York|12550|random|random  |random      |random           |random      |
      Then search contacts from contacts filter panel with name Print postage1
      Then in contacts grid check row 1
      Then search contacts from contacts filter panel with name Print postage2
      Then in contacts grid check row 1
      Then click print postage button on contacts toolbar
      Then select print on Shipping Label - 5 ½" x 8 ½"
      Then expect value of print form mail-to country is United States
      Then expect multiple contacts view is displayed
      Then expect multiple contacts view include Print postage1, Print postage2
      Then set print form ounces to 1
      Then select print form service PM Package
      Then click print postage button on contacts toolbar
      Then click continue on confirm print modal
      Then sign out

  @contacts_print_postage_single_international_from_top_nav
  Scenario: Add a new contact and print postage from top navigation
    Then sign-in to orders
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |random  |random   |India|321/2RT Vijaynagar colony|Hyderabad|Telangana|500080|random|random  |random      |random           |random      |
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

