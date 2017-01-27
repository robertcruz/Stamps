
Feature:  BVT Wonderment

  Background:
    Given a valid user is signed in to Web Apps

  @wonderment_bvt
  Scenario:  Add a new order
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Insure-For to $1.00
    Then Sign out