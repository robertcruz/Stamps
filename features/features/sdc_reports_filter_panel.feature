Feature:  Reports Filter Panel

  Background:
    Given Start test driver

  @reports_filter_panel
  Scenario: Reports filter panel UI validation
    Then sign-in to orders
    Then navigate to Reports
    Then expect filter panel on reports is expanded
    Then click collapse button on reports filter panel
    Then click expand button on reports filter panel
    Then expand prints on reports filter panel
    Then select by service on reports filter panel prints
    Then select by cost code on reports filter panel prints
    Then select expenses on reports filter panel
    Then select balances on reports filter panel
    Then click prints on reports filter panel