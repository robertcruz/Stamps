Feature:  History Filter Panel

  Background:
    Given Start test driver

  @history_filter_panel
  Scenario: History Filter Panel functions
    Then sign-in to orders
    Then navigate to History
    Then expand date printed on history filter panel

    Then select today on history filter panel
    Then expect today is selected on history filter panel
    Then expect today count on history filter panel is greater than 0

    Then select past 7 days on history filter panel
    Then expect past 7 days is selected on history filter panel
    Then expect past 7 days count on history filter panel is greater than 0

    Then select past 30 days on history filter panel
    Then expect past 30 days is selected on history filter panel
    Then expect past 30 days count on history filter panel is greater than 0

    Then select past 3 months on history filter panel
    Then expect past 3 months is selected on history filter panel
    Then expect past 3 months count on history filter panel is greater than 0

    Then select past 6 months on history filter panel
    Then expect past 6 months is selected on history filter panel
    Then expect past 6 months count on history filter panel is greater than 0

    Then select past 12 months on history filter panel
    Then expect past 12 months is selected on history filter panel
    Then expect past 12 months count on history filter panel is greater than 0

    Then select past 2 years on history filter panel
    Then expect past 2 years is selected on history filter panel
    Then expect past 2 years count on history filter panel is greater than 0

  @history_filter_direct_url
  @history_filter_direct_url_1
  Scenario: Navigating to direct URLs
    Then sign-in to mail
    Then navigate to History
    Then go to delivered filter on history directly
    Then wait while loading history filters grid
    Then expect delivered is selected on history filter panel status
    Then go to pending recipient action filter on history directly
    Then wait while loading history filters grid
    Then expect pending recipient action is selected on history filter panel status
    Then go to undeliverable filter on history directly
    Then wait while loading history filters grid
    Then expect undeliverable is selected on history filter panel status
    Then sign out

  @history_filter_direct_urlx
  Scenario: Not signed in user navigates to direct URLs
    Then go to delivered filter on history directly
    Then login to webclient
    Then wait while loading history filters grid
    Then expect delivered is selected on history filter panel status
    Then sign out
    Then go to pending recipient action filter on history directly
    Then login to webclient
    Then wait while loading history filters grid
    Then expect pending recipient action is selected on history filter panel status
    Then sign out
    Then go to undeliverable filter on history directly
    Then login to webclient
    Then wait while loading history filters grid
    Then expect undeliverable is selected on history filter panel status
    Then sign out