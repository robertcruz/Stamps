Feature: Mail Sample Shipping Label - SDC-1200 - PM Large Thick Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_sdc1200_pm_large_envelope
  Scenario: Sample Shipping Label - SDC-1200 - PM Large Thick Envelope

    Then Mail: Select Shipping Label - SDC-1200, 4 ¼” x 6 ¾”

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select service Priority Mail Large-Thick Envelope
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Sample Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button Sample
    Then Sign out