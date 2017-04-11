Feature: WebReg
  Background:
    Given I launched default browser

  @webreg_pam_orders
  Scenario:
    Then load Sign-in page
    Then WebReg: Load username and password from parameter file
    Then Orders: Sign-in using username and password from parameter file
    Then click Orders Toolbar Add button
    Then WebReg: Store username to data file webreg_pam_ord
    Then Pause for 5 seconds
    Then On WebReg Profile page, Send username to standard out

    Then Sign out
