Feature:  Contacts BVT - Contacts Cost Codes

  Background:
    Given Start test driver

  @sdc_contacts_toolbar_add_existing_cost_code
    Scenario:
    Then sign-in to orders
    Then navigate to Contacts
    Then click contacts toolbar cost codes dropdown
    Then on cost codes dropdown menu select Add/Edit Cost Codes
    Then expect account settings cost code page is displayed
    Then click add button on account settings cost codes page
    Then expect add cost code modal is displayed
    Then set new cost textbox to blank on add cost code modal
    Then click add button on add cost code modal
    Then expect error message on cost codes page is No codes found. Please enter cost codes of 30 characters or less separated by commas and click Add.
    Then click add button on account settings cost codes page
    Then set new cost textbox to existing value on add cost code modal
    Then click add button on add cost code modal
    #Then expect error message on cost codes page includes The cost code
    Then click add button on account settings cost codes page
    Then expect add cost code modal is displayed
    Then set new cost textbox to random on add cost code modal
    Then click add button on add cost code modal
    Then expect error message box is not displayed
    Then expect newly added cost codes included in the cost code grid
    Then click add button on account settings cost codes page
    Then set new cost textbox to random,random on add cost code modal
    Then click add button on add cost code modal
    Then navigate to Contacts
    Then click on cost codes expand button of contacts left navigation
    Then on left navigation expect new costcode added is avilable under costcode filter
    Then on left navigation expect count of new costcode added is 0

  @sdc_contacts_toolbar_add_new_cost_code
  Scenario: Add Cost Code scenario 1: Add cost code from TOP Nav ,Sent to Cost codes page, add an new cost code and expect error is not displayed and make sure cost codes save and visible on contacts page
    Then sign-in to orders
    Then navigate to Contacts
    Then click contacts toolbar cost codes dropdown
    Then on cost codes dropdown menu select Add/Edit Cost Codes
    Then expect cost code page is displayed
    Then on cost code page set value of new cost code textbox to random
    Then on cost codes page click on add button
    Then expect error message box is not displayed
    Then on cost codes page click on done button
    Then navigate to Contacts
    Then click on cost codes expand button of contacts left navigation
    Then on left navigation expect new costcode added is avilable under costcode filter
    Then on left navigation expect count of new costcode added is 0
    Then in contacts grid check row 1
    Then click contacts toolbar cost codes dropdown
    Then on cost codes dropdown menu select Change Cost Code
    Then set cost code value in the change costcode pop up box to new costcode added
    Then click on cost code save button
    Then expect value of Cost Code in contacts grid is correct?
    Then on left navigation expect count of new costcode added is incremented by 1

  @sdc_contacts_toolbar_change_cost_code_add_edit
  Scenario: Contacts BVT Scenario 1: Add Cost Code from change cost codes pop up via Contacts Toolbar
    Then sign-in to orders
    Then navigate to Contacts
    Then in contacts grid check row 1
    Then click contacts toolbar cost codes dropdown
    Then on cost codes dropdown menu select Change Cost Code
    Then set cost code value in the change costcode pop up box to Add/Edit Cost Codes
    Then expect cost code page is displayed
    Then on cost code page set value of new cost code textbox to random
    Then on cost codes page click on add button
    Then expect error message box is not displayed
    Then on cost codes page click on done button
    Then navigate to Contacts
    Then in contacts grid check row 1
    Then set new costcode added value in details menu cost code dropdown
    Then click on cost codes expand button of contacts left navigation
    Then on left navigation expect count of new costcode added is incremented by 1
    # Change to exsisting code code
    Then in contacts grid check row 1
    Then click contacts toolbar cost codes dropdown
    Then on cost codes dropdown menu select Change Cost Code
    Then set cost code value in the change costcode pop up box to existing value
    Then click on cost code save button
    Then expect value of Cost Code in contacts grid is correct?
