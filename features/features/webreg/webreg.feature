Feature: Registration
  Background:
    Given I loaded the default registration page

  @registration_orders
  Scenario: Theme 1632 Normal Test Workflow
    Then populate all Profile page required fields
    Then continue to Membership page
    Then populate all Membership page required fields
    Then submit Membership Page

    Then save sign-in credentials to parameter file normal_workflow
    Then save sign-in credentials
    Then load sign-in credentials

    # Verify new user exist in PAM
    Then visit PAM Customer Search page
    Then set PAM Customer Search page username to cached value
    Then click PAM Customer Search page Search button
    #Then expect PAM Customer search result Status is OK
    Then expect PAM Customer Profile Page Status Reason is OK
    Then expect PAM Customer Profile Page Username is correct

    # Verify new user is able to sign-in to Web Apps
    Then load Web Apps Orders then sign-in
    Then add new order
    Then expect Order Details form Order ID is the same as saved Order ID
    Then Sign out

#

#    Then save sign-in credentials to parameter file registration_ach_purchase_100k
#    Then load sign-in credentials from file registration_ach_purchase_100k

#    Then send username to standard out

