
Feature: Logoff

  Background:
    Given a valid user is signed in to Web Apps

  @general_settings
  Scenario: Show unavailable services

    Then open Settings Modal

    Then In Settings modal, set Logoff to 5 min.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Logoff is set for 5 min.

    Then In Settings modal, set Logoff to 10 min.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Logoff is set for 10 min.

    Then In Settings modal, set Logoff to 15 min.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Logoff is set for 15 min.

    Then In Settings modal, set Logoff to 30 min.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Logoff is set for 30 min.

    Then In Settings modal, set Logoff to 1 hour.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Logoff is set for 1 hour

    Then In Settings modal, set Logoff to 2 hours
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Logoff is set for 2 hours

    Then In Settings modal, Close

    Then Sign out

