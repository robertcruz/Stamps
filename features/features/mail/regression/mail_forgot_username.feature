Feature: Forgot Username



  Background:
    Given I launched default browser

  @mail_forgot_username
  Scenario: Forgot Username
    Then load Sign-in page
    Then Mail: Open Forgot Username Modal
    Then on Print form, set forgotten email to Win10FF1000@mailinator.com


