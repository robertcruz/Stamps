Feature: Contacts BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_contacts
  Scenario: Contacts

    Then Mail: Select Shipping Label - 5 ½” x 8 ½”
    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail Shipping Labels: Open Contacts modal
    Then Contacts: Click Contacts Page Link
    Then Sign out