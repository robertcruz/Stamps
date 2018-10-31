Feature: Mail Contacts Modal Bugs

  Background:
    Given a valid user is signed in to Web Apps

  @bugs_contacts_modal
  Scenario: ORDERSAUTO_3243 Adding Contact from Mail should not Add Reference # Or Cost Code
    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set print form advanced options reference number to 12345
    Then set print form advanced options cost code 123
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    Then click print form mail to link
    Then expect contacts modal is present
    Then Search Contacts Modal for last printed contact
    Then Select Recently Printed Contact
    Then expect Print form Domestic Address field displays last printed contact
    Then show advanced options
    Then expect print form advanced options reference number is blank
    Then expect print form advanced options cost code is None
    Then sign out
