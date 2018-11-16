Feature:  History :File an Insurance Claim

  Background:
    Given Start test driver

  @file_insurance_claim
  Scenario: Verify File Insurance Claim Page loads and Date Selections Drop Down menu is available
    Then sign-in to mail
    Then hover on navigation history then select File an Insurance Claim
    Then expect eligible for on history filter panel is expanded
    Then expect default selected value on eligible for history filter panel is insurance claim
    Then sign out