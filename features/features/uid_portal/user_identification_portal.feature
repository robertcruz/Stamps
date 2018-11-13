Feature:  User Identification Portal

  Background:
    Given Start test driver

  @user_identification_portal
  Scenario: This test will authenticate through firewall user identification portal
    Then go to url https://172.16.67.1:6082/php/uid.php?vsys=1&url=https://www.google.com/
    Then set username to lab on user id portal
    Then set password to Sdcqatest623 on user id portal
    Then click login button on user id portal