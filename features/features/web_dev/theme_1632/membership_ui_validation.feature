Feature: Test Workflow - Theme 1632 Happy Path

  Background:
    Given I loaded SDC Website

  @registration_normal_workflow
  Scenario: Theme 1632 Happy Path
    Then click on Get Started
    # Profile Page
    Then set Profile page Email to random value
    Then set Profile page Username to random value
    Then set Profile page Password to random value
    Then set Profile page Re-type password to same as previous password
    Then set Profile page Survey Question to Individual
    Then set Profile page Promo Code to PR33-NH77
    Then continue to Membership page

    # Membership Page
    Then set Membership page First Name to random value
    Then expect Membership page First Name is correct
    Then set Membership page Last Name to random value
    Then expect Membership page Last Name is correct
    Then set Membership page Company to random value
    Then expect Membership page Company is correct
    Then set Membership page Address to 1350 Market Street Apt 2901
    Then expect Membership page Address is correct

    Then set Membership page City to San Francisco
    Then expect Membership page City is correct

    Then select Membership page State CA
    Then expect Membership page State is correct

    Then set Membership page Zip to 94102
    Then expect Membership page Zip is correct

    Then set Membership page Phone to random value
    Then expect Membership page Phone is correct

    Then set Membership page Cardholder's Name to random value
    Then expect Membership page Cardholder's Name is correct

    Then set Membership page Credit Card Number to default value
    Then expect Membership page Credit Card Number is correct

    Then set Membership page Month to Dec (12)
    Then set Membership page Month to Nov (11)
    Then set Membership page Month to Oct (10)
    Then set Membership page Month to Sep (09)
    Then set Membership page Month to Aug (08)
    Then set Membership page Month to Jul (07)
    Then set Membership page Month to Jun (06)
    Then set Membership page Month to May (05)
    Then set Membership page Month to Apr (04)
    Then set Membership page Month to Mar (03)
    Then set Membership page Month to Feb (02)
    Then set Membership page Month to Jan (01)

    Then expect Membership page Month is correct

    Then set Membership page Year to 2027
    Then set Membership page Year to 2026
    Then expect Membership page Year is correct

    Then uncheck Membership page Billing address same as mailing address
    Then expect Membership page Billing address same as mailing address is unchecked
    Then expect Billing Address form is present

    Then check Membership page Billing address same as mailing address
    Then expect Membership page Billing address same as mailing address is checked
    Then expect Billing Address form is not present

    Then uncheck Membership page Billing address same as mailing address

    Then set Membership page Billing Address to 1350 Market Street Apt 2901
    Then expect Membership page Billing Address is correct

    Then set Membership page Billing City to San Francisco
    Then expect Membership page Billing City is correct

    Then select Membership page Billing State CA
    Then expect Membership page Billing State is correct

    Then set Membership page Billing Zip to 94102
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 1 and 4
    Then expect Membership page City is correct
    Then expect Membership page City is correct
    Then expect Membership page State is correct
    Then expect Membership page Zip is correct

    Then set Membership page member billing address to random address between zone 1 and 4
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 5 and 8
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 5 and 8
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 1
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 1
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 2
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 2
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 3
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 3
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 4
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 4
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 5
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 5
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 6
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 6
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 7
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 7
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address between zone 8
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member billing address to random address between zone 8
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then set Membership page member address to random address in zone 2
    Then expect Membership page Billing Address is correct
    Then expect Membership page Billing City is correct
    Then expect Membership page Billing State is correct
    Then expect Membership page Billing Zip is correct

    Then check Membership page Terms & Conditions
    Then expect Membership page Terms & Conditions is checked

    Then uncheck Membership page Terms & Conditions
    Then expect Membership page Terms & Conditions is unchecked

    Then check Membership page Terms & Conditions

    Then submit Membership Page





