Feature:  Reports Toolbar

  Background:
    Given Start test driver

  @reports_toolbar
  Scenario: Reports toolbar UI validation
    Then sign-in to orders
    Then navigate to Reports
#    Then click date link on reports toolbar
#    Then click All on reports toolbar date
#    Then click date link on reports toolbar
#    Then click Custom Date Range on reports toolbar date
#    Then click date link on reports toolbar
#    Then click Month to Date on reports toolbar date
#    Then click date link on reports toolbar
#    Then click Year to Date on reports toolbar date
#    Then click date link on reports toolbar
#    Then click Previous Month on reports toolbar date
#    Then click date link on reports toolbar
#    Then click Previous Quarter on reports toolbar date
#    Then click date link on reports toolbar
#    Then click Previous Year on reports toolbar date
#    Then click date link on reports toolbar
#    Then click Past 7 days on reports toolbar date
#    Then click date link on reports toolbar
#    Then click Past 30 days on reports toolbar date
#    Then click date link on reports toolbar
#    Then click Past 90 days on reports toolbar date
#
#    Then click view link on reports toolbar
#    Then click Transactions on reports toolbar view
#    Then click view link on reports toolbar
#    Then click Summary on reports toolbar view
#    Then click view link on reports toolbar
#    Then click Trend on reports toolbar view
#    Then click view link on reports toolbar
#    Then click Pie on reports toolbar view
#    Then click view link on reports toolbar
#    Then click Line on reports toolbar view
#    Then click view link on reports toolbar
#    Then click 100% Column on reports toolbar view
#    Then click view link on reports toolbar
#    Then click 100% Bar on reports toolbar view
#    Then click view link on reports toolbar
#    Then click 100% Area on reports toolbar view
#    Then click view link on reports toolbar
#    Then click Column on reports toolbar view
#    Then click view link on reports toolbar
#    Then click Bar on reports toolbar view
#    Then click view link on reports toolbar
#    Then click Area on reports toolbar view
#
#    Then click interval link on reports toolbar
#    Then click Days on reports toolbar interval
#    Then click interval link on reports toolbar
#    Then click Weeks on reports toolbar interval
#    Then click interval link on reports toolbar
#    Then click Months on reports toolbar interval
#    Then click interval link on reports toolbar
#    Then click Quarters on reports toolbar interval
#    Then click interval link on reports toolbar
#    Then click Years on reports toolbar interval

    Then click data link on reports toolbar
    Then click Count on reports toolbar data
    Then click data link on reports toolbar
    Then click Cost on reports toolbar data

    Then click filters link on reports toolbar
    Then close filters modal on reports

    Then expect reset on reports toolbar is present
    Then click reset on reports toolbar
    Then expect date on reports toolbar contains Previous Month
    Then expect print on reports toolbar is present
    Then expect export on reports toolbar is present
    Then expect feedback on reports toolbar is present
    Then click feedback on reports toolbar
    Then close feedback modal on reports
    Then expect settings on reports toolbar is present