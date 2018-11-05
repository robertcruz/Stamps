Feature:  Transitioning between Contacts and Mail Pages

  Background:
    Given Start test driver

  @sdc_contacts_print_to_mail
  Scenario: Contacts Printing
    Then sign-in to orders
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then set contact details name to Adam Smith
    Then set contact details company to FL Homes
    Then set contact details country to United States
    Then set contact details street address to  223 E. Concord Street
    Then set contact details city to Orlando
    Then set contact details state to Florida
    Then set contact details postal code to 32801
    Then set contact details email to adams@gmail.com
    Then set contact details phone to 23345152
    Then click print postage button on contacts toolbar
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then sign out
