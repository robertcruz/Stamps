Feature:  Contacts BVT - Contacts Pagination

  Background:
    Given Start test driver

z@sdc_contacts_pagination
Scenario: Contacts BVT Scenario 1: Contacts Pagination
    Then sign-in to orders
    Then navigate to Contacts
	# perpage : 100
    Then set per page drop down of pagination on contacts toolbar to 100
    Then expect contacts on contacts grid is reflected according to the selected pagination
    # perpage : 250
    Then set per page drop down of pagination on contacts toolbar to 250
    Then expect contacts on contacts grid is reflected according to the selected pagination
    # perpage : 500
    Then set per page drop down of pagination on contacts toolbar to 500
    Then expect contacts on contacts grid is reflected according to the selected pagination


  @sdc_contacts_pagination_navigate_different_pages
  Scenario: Contacts BVT Scenario 1: Contacts Pagination
    Then sign-in to orders
    Then navigate to Contacts
	# perpage : 100
    Then set per page drop down of pagination on contacts toolbar to 100
    Then fetch the maximum page count in contacts pagination
    Then set current page text box on contacts pagination to random
    Then click on the pagination prev button of contacts page
    Then click on the pagination next button of contacts page
    Then click on the pagination first button of contacts page
    Then click on the pagination last button of contacts page