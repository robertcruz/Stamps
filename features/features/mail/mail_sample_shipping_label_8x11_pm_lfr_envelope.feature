Feature: Mail Sample Shipping Label - 8 ½” x 11” Paper - PM Legal Flat Rate Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_8x11_pm_lfr_envelope
  Scenario: Sample Shipping Label - 8 ½” x 11” Paper - PM Legal Flat Rate Envelope

    Then Mail: Select Shipping Label - 8 ½” x 11” Paper

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 5 through 8
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select service Priority Mail Legal Flat Rate Envelope
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Sample Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button Sample
    Then Sign out