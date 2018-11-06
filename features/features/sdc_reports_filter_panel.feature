Feature:  Reports Filter Panel

  Background:
    Given Start test driver

  @reports_filter_panel
  Scenario: Reports filter panel UI validation
    Then sign-in to orders
    Then navigate to Reports
    Then click prints on reports filter panel