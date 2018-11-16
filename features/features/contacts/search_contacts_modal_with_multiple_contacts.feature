Feature: Search Contacts Modal for selecting multiple contacts in Mail

  Background:
    Given Start test driver

  @search_contacts_modal
  Scenario: Views Search Contacts Dialog when selecting shipping label
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then expect mail-to link on print form is displayed
    Then click mail-to link on print form
    Then expect search contacts modal is present

  @search_contacts_modal
  Scenario: Views Search Contacts Dialog when selecting an envelope 10
    Then sign-in to mail
    Then select print on Envelope - 10
    Then expect mail-to link on print form is displayed
    Then click mail-to link on print form
    Then expect search contacts modal is present

  @search_contacts_modal
  Scenario: Views Search Contacts Dialog when selecting Certified Mail Label - SDC-3710
    Then sign-in to mail
    #Certified Mail Label - SDC-3610
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then expect mail-to link on print form is displayed
    Then click mail-to link on print form
    Then expect search contacts modal is present

  @search_contacts_modal
  Scenario: Views Search Contacts Dialog when selecting Roll 4x6
    Then sign-in to mail
    Then select print on Roll 418x614
    Then expect mail-to link on print form is displayed
    Then click mail-to link on print form
    Then expect search contacts modal is present

  @search_contacts_modal
  Scenario: Search Contacts Dialog UI
    Then navigate to Mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then expect mail-to link on print form is displayed
    Then click mail-to link on print form
    Then expect search contacts modal is present
    Then expect title on search contacts modal is Search Contacts
    #Then expect Background Color: #f7f7f7, Selected Filter Highlight Color: #E9E9E9 or Number Background Color: #999999
    Then expect checkbox column is available in search contacts modal grid header
    Then expect Name column is available in search contacts modal grid header
    Then expect Streed Address column is available in search contacts modal grid header
    Then expect City column is available in search contacts modal grid header
    Then expect State column is available in search contacts modal grid header
    Then expect Country column is available in search contacts modal grid header
    Then expect Country column is available in search contacts modal grid header
    Then hover on Name column on contacts grid
    Then click on Name column header dropdown trigger
    Then expect contacts header dropdown menu is displayed
    #hovering over any column will display the same drop down for managing columns as the Contacts page
    Then expect Sort Ascending is available in the contacts header dropdown menu list
    Then expect Sort Descending is available in the contacts header dropdown menu list
    Then expect Columns is available in the contacts header dropdown menu list
    Then expect Unfreeze is available in the contacts header dropdown menu list
    Then expect Freeze Column is available in the contacts header dropdown menu list
   #expect X Close icon/Esc Key: Closes out of dialog

  @search_contacts_modal
  Scenario: Search Contacts Empty State
    Then new user (with no contacts) log onto webpostage
    Then set print on to shipping label 8x10
    Then when user clicks Mail To link and new search contacts modal appears
    Then expect modal ' You have no Contacts to view You can add contacts by navigation to the Contacts page located in the top header)
    Then expect to math the UI noted on spec - see spec

  @search_contacts_modal
  Scenario: Search Contacts grid column that are sortable and not sortable
    Then set print on to shipping label 8x10
    Then when user clicks Mail To link and new search contacts modal appears
    Then expect the following columns are sortable: Name,Prefix,First Name,Middle,Last Name,Suffix,Company,Title,Department,City,State/Prv,Street Address,Postal Code,Country,Cost Code,Reference #
    Then expect the following columns are not sortable: Email,Phone,Ext.

  @search_contacts_modal
  Scenario: Search Contacts grid column order saved as user pref
    Then set print on to shipping label 8x10
    Then when user clicks Mail To link and new search contacts modal appears
    Then user will move columns around
    Then user will close out search contacts dialog
    Then user will logout of webpostage
    Then user will login to webpostage
    Then set print on to shipping label 8x10
    Then when user clicks Mail To link and new search contacts modal appears
    Then expect the column are saved in location user moved to

  @search_contacts_modal
  Scenario: Search Contacts Dialog Footer
    Then set print on to shipping label 8x10
    Then when user clicks Mail To link and new search contacts modal appears
    Then expect Cancel button closes out dialog
    Then expect Select button is disabled when no contacts selected
    Then expect Select button is enabled when at least one contact is enabled

  @search_contacts_modal_pagination
  Scenario: Search Contacts Dialog Pagination and page selecting
    Then set print on to shipping label 8x10
    Then when user clicks Mail To link and new search contacts modal appears
    Then expect Pagination: Uses same functionality as pagination on all other grids (FOR AUTOMATION COPY FROM ORDERS PAGINATION AUTOMATION)
    Then expect Per Page Selection Uses same functionality as selection on all other grids. Default is 100. Other options are 250 and 500

