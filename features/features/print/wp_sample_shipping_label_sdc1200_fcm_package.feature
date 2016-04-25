Feature: Postage Sample Shipping Label - SDC-1200 - FCM Package



  Background:
    Given I am signed in as a postage shipper


  @wp_shipping_label_regression
  @wp_sample_shipping_label_sdc1200_fcm_package
  Scenario: Sample Shipping Label - SDC-1200 - FCM Package

    Then Postage: Select Shipping Label SDC-1200

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to Random Address Between Zone 1 through 4
    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Select Service First-Class Mail Package-Thick Envelope
    Then Postage Shipping Labels: Select left side starting label
    Then Postage: Open Print Sample Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print Sample
    Then Sign out