Feature: Contacts BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_contacts
  Scenario: Contacts

    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to El Segundo
    Then click Print form Mail To link
    Then click Search Contacts close button
    Then Sign out