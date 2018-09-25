Feature:  Contacts BVT - Contacts Filter Panel

  Background:
    Given Start test driver

  @sdc_contacts_left_panel_regression
  Scenario: Contacts Filter Panel Hide/Show: Collapse and expand contacts Left navigation Filter Panel
  Contacts Filter Panel Cost Code Expand/Collapse: Collapse and expand contacts Left navigation Cost Codes Filter Panel
  Contacts Filter Panel Cost Code count: Expand contacts Left navigation individual Cost Codes count
  Contacts Filter Panel Groups Expand/Collapse: Collapse and expand contacts Left navigation Cost Codes Filter Groups
  Contacts Filter Panel All Contacts count :Left filter panel contact count
    Then sign-in to orders
    Then navigate to contacts
    #Contacts Filter Panel All Contacts count :Left filter panel contact count
    Then fetch total count of all contacts
    # Contacts Filter Panel Hide/Show: Collapse and expand contacts Left navigation Filter Panel
    Then click on collapse button of contacts left navigation
    Then click on expand button of contacts left navigation
    # Contacts Filter Panel Cost Code Expand/Collapse: Collapse and expand contacts Left navigation Cost Codes Filter Panel
    Then click on cost codes expand button of contacts left navigation
    Then click on cost codes collapse button of contacts left navigation
    # Contacts Filter Panel Cost Code count: Expand contacts Left navigation individual Cost Codes count
    Then click on cost codes expand button of contacts left navigation
    Then fetch total against each cost code available
    # Contacts Filter Panel Groups Expand/Collapse: Collapse and expand contacts Left navigation Cost Codes Filter Groups
    Then click on groups expand button of contacts left navigation
    Then click on groups collapse button of contacts left navigation
    # Contacts Filter Panel Group count: Expand contacts Left navigation individual Group count
    Then click on groups expand button of contacts left navigation
    Then fetch total against each group available


