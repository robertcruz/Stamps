Feature: Select Email Tracking for order when printing

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_email_tracking
  Scenario: Email Tracking

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to MM Package/Flat/Thick Envelope, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then in Print modal, check Email Tracking Details to Recipients
    Then click print modal print button
    Then sign out
