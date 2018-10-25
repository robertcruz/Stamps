Feature: Auto Refund UI test

  Background:
    Given Start test driver

  @refund_assist
  Scenario: WEBAPPS-11739 New Auto-Refund UI
    Then sign-in to mail
    Then navigate to auto refund page
    Then expect title on auto refund present
    Then expect terms and conditions link on auto refund present
    Then expect update label status button on auto refund present
    Then expect not shipped for all rows on auto refund selected
    Then select shipped on row 1 on auto refund
    Then select not shipped on row 1 on auto refund
    Then click update label status button on auto refund present
    Then expect success message on auto refund present
    Then select shipped on row 1 on auto refund
    Then click update label status button on auto refund present
    Then expect success message on auto refund present
