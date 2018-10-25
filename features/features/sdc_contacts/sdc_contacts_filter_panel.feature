Feature:  Contacts BVT - Contacts Filter Panel

  Background:
    Given Start test driver

  @sdc_contacts_left_panel_regression
  Scenario: Contacts Filter Panel Hide/Show: Collapse and expand contacts Left navigation Filter Panel
  Contacts Filter Panel Cost Code Expand/Collapse: Collapse and expand contacts Left navigation Cost Codes Filter Panel
  Contacts Filter Panel Cost Code count: Expand contacts Left navigation individual Cost Codes count
  Contacts Filter Panel Groups Expand/Collapse: Collapse and expand contacts Left navigation Cost Codes Filter Groups
  Contacts Filter Panel All Contacts count :Left filter panel contact count
  Contacts Filter Panel	Search Contact : Search for exsisting contact based on name, cost code, group
  Contacts Filter Panel	Search Contact : Search for non exsisting contact
    Then sign-in to orders
    Then navigate to Contacts
	#Contacts Filter Panel Hide/Show: Collapse and expand contacts Left navigation Filter Panel
    Then click on collapse button of contacts left navigation
    Then click on expand button of contacts left navigation
	#Contacts Filter Panel - SEARCH BAR
    Then expect search bar is available on the contacts left navigation panel
   	#Contacts Filter Panel	Search Contact : Search for exsisting contact based on name
    Then set search text on contacts left navigation search bar to aloha
    Then click search button on contacts left navigation search bar
    Then expect search results is available on the contacts left navigation panel
    Then expect contacts with Name containing the value aloha are retrieved in the grid
	#Contacts Filter Panel	Search Contact : Search for non exsisting contact
    Then set search text on contacts left navigation search bar to Non Exsisting
    Then click search button on contacts left navigation search bar
    Then expect empty search message for searched contact is displayed on the contacts grid
    Then click on remove button of search results on contacts left navigation panel
	#Contacts Filter Panel - SELECTED Filter
    Then expect selected filter on the contacts left navigation panel is available
    Then fetch count of selected contacts
	#Contacts Filter Panel - ALL CONTACTS Filter and its count
    Then expect all contacts filter is available on the contacts left navigation panel
    Then fetch total count of all contacts
   	#Contacts Filter Panel - GROUPS Filter - expand , fetch each group count , collapse
    Then expect groups filter is available on the contacts left navigation panel
    Then click on groups expand button of contacts left navigation
    Then fetch total against each group available
    Then click on groups collapse button of contacts left navigation
	#Contacts Filter Panel - COST CODES Filter - expand , fetch each cost code count , collpase
    Then expect cost codes filter is available on the contacts left navigation panel
    Then click on cost codes expand button of contacts left navigation
    Then fetch total against each cost code available
    Then click on cost codes collapse button of contacts left navigation

  @sdc_contacts_left_navigation_add_group
  Scenario: Contacts BVT Scenario 1: Add new group from contact left navigation
    Then sign-in to orders
    Then navigate to Contacts
    # Groups Left Navigation plus Button - Add
    Then mousehover on groups section of left navigation
    Then click on groups add button of contacts left navigation
    Then set group name on add group pop up to blank
    Then click on save button of add groups pop up window
    Then expect error message of blank group name is displayed on add groups pop up window
    Then set group name on add group pop up to existing
    Then click on save button of add groups pop up window
    Then expect error message of existing group name is displayed on add groups pop up window
    Then set group name on add group pop up to random
    Then click on save button of add groups pop up window
    Then expect error message is not displayed on add groups pop up window

  @sdc_contacts_left_add_edit_group
  Scenario: Contacts BVT Scenario 1: Add/Edit group from contact left navigation
    Then sign-in to orders
    Then navigate to Contacts
    # Groups Left Navigation settings Button - Add from (manage groups)
    Then mousehover on groups section of left navigation
    Then click on groups settings button of contacts left navigation
    Then expect manage groups pop up is displayed
    Then click add button on manage groups window toolbar
    Then set group name on add group pop up to blank
    Then click on save button of add groups pop up window
    Then expect error message of blank group name is displayed on add groups pop up window
    Then set group name on add group pop up to existing
    Then click on save button of add groups pop up window
    Then expect error message of existing group name is displayed on add groups pop up window
    Then set group name on add group pop up to random
    Then click on save button of add groups pop up window
    Then expect error message is not displayed on add groups pop up window
    Then expect manage groups pop up is displayed
    Then expect group name added is available in the manage group pop up table
    # Groups Left Navigation settings Button - Edit and delete from (manage groups)
    Then click existing row in manage group table
    Then click edit button on manage groups window toolbar
    Then set group name on edit pop up to blank
    Then click on save button of edit groups pop up
    Then expect error message of blank group name is displayed on edit groups pop up window
    Then set group name on edit pop up to existing
    Then click on save button of edit groups pop up
    Then expect error message of existing group name is displayed on edit groups pop up window
    Then set group name on edit pop up to random
    Then click on save button of edit groups pop up
    Then expect error message is not displayed on edit groups pop up window
    Then expect manage groups pop up is displayed
    Then expect group name added is available in the manage group pop up table
    Then click existing row in manage group table
    Then click delete button on manage groups window toolbar
    Then click on yes button of delete groups pop up
    Then expect group name deleted is not available in the manage group pop up table

  @sdc_contacts_left_nav_add_edit_cost_code
  Scenario: Contacts BVT Scenario 1: Add/Edit cost code from contact left navigation
    Then sign-in to orders
    Then navigate to Contacts
    Then mousehover on cost codes section of left navigation
    Then click on cost codes settings button of contacts left navigation
    Then expect cost code page is displayed
    Then on cost code page set value of new cost code textbox to existing value
    Then on cost codes page click on add button
    Then expect error message box is displayed
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
    Then on cost codes dropdown menu select Change Cost Code WEBAPPAUTO-120
    Then set cost code value in the change costcode pop up box to new costcode added
    Then click on cost code save button
    Then expect value of Cost Code in contacts grid is correct?

  @sdc_contacts_left_navigation_selected_filter
  Scenario: Selected Contacts Filter
    Then sign-in to orders
    Then navigate to Contacts
    #Selected filter - Default
    Then expect selected filter on the contacts left navigation panel is available
    Then expect count on selected filter is 0
    #Selected filter - Empty State
    Then click on selected filter of contacts left navigation panel
    Then expect empty state message of selected contacts is displayed on the contacts grid
    Then expect contacts grid message for selected contact is There are no contacts selected.
    Then click on all contacts filter of contacts left navigation panel
    #Selected filter -counts
    Then in contacts grid check row 1
    Then expect count on selected filter is 1
    Then in contacts grid check row 2
    Then expect count on selected filter is 2
    Then in contacts grid uncheck row 1
    Then expect count on selected filter is 1
    Then in contacts grid check row 3
    Then expect count on selected filter is 2
	#Switches filters - based on cost codes
    Then select an existing cost code from left navigation filter panel
    Then expect count on selected filter is 2
	#Switches filters - based on groups
    Then select an existing group from left navigation filter panel
    Then expect count on selected filter is 2
	#Searches contacts
    Then search for contact aloha from the contacts left navigation filter
    Then expect count on selected filter is 2
	#Changes pages or page numbers in the filter (Bottom footer)
    Then set per page drop down of pagination on contacts toolbar to 100
    Then expect count on selected filter is 2
    #Clear All Link
    Then expect clear all link is displayed on contact detail panel
    Then click on clear all link of contact detail panel
    Then expect clear contacts pop up box is displayed
    Then click on yes button of clear contacts pop up window
