Feature:  Contacts BVT - Contacts Grid Header

  Background:
    Given Start test driver

  @sdc_contact_column_header_dropdown_menu
  Scenario: Contacts row name dropdown : Contacts- ROW NAME DROP DOWN MENU OPENS FOR ALL
    Then sign-in to orders
    Then navigate to Contacts
    #Making sure all columns are available on the grid
    Then click on settings button of contacts toolbar
    Then select columns from contacts toolbar settings dropdown menu
    Then check all the columns from the list to show all columns in the contacts grid
    #validate for a specific column
    Then hover on First Name column on contacts grid
    Then click on First Name column header dropdown trigger
    Then expect contacts header dropdown menu is displayed
    Then expect Sort Ascending is available in the contacts header dropdown menu list
    Then expect Sort Descending is available in the contacts header dropdown menu list
    Then expect Columns is available in the contacts header dropdown menu list
    Then expect Unfreeze is available in the contacts header dropdown menu list
    Then expect Freeze Column is available in the contacts header dropdown menu list
    #validate for all columns available
    Then expect row name dropdown for all columns is present

  @sdc_contact_columns_sort_asc_dec
  Scenario: Contacts row dropdown - Sort Asceneding/Desending : Contacts- SORT Asc/Des
    Then sign-in to orders
    Then navigate to Contacts
    #Making sure all columns are available on the grid
    Then click on settings button of contacts toolbar
    Then select columns from contacts toolbar settings dropdown menu
    Then check all the columns from the list to show all columns in the contacts grid
    #validate for a specific column
    Then hover on First Name column on contacts grid
    Then click on First Name column header dropdown trigger
    Then expect contacts header dropdown menu is displayed
    Then verify Sort Ascending in contact header menu dropdown is enabled
    Then verify Sort Descending in contact header menu dropdown is enabled
    #validate for all columns available
    Then verify sorting options for all columns in contact header menu

  @sdc_contact_columns_name_sort
  Scenario: Contacts column sort : click on Name on contacts grid to sort
    Then sign-in to orders
    Then navigate to Contacts
    #Making sure name columns is available on the grid
    Then click on settings button of contacts toolbar
    Then select columns from contacts toolbar settings dropdown menu
    Then choose Name on contact settings columns menu list
    #click on column header to sort
    Then click on Name column header on the grid to sort
    Then verify the contacts grid is sorted based on Name
