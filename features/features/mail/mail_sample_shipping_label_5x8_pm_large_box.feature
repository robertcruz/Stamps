Feature: Mail Sample Shipping Label - 5 ½” x 8 ½” - Large Box

  Background:
    Given I am signed in as Mail shipper

  @mail_print_sample_shipping_label_5x8_pm_large_box
  Scenario: Sample Shipping Label - 5 ½” x 8 ½” - Large Box

    Then Mail: Select Shipping Label - 5 ½” x 8 ½”

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 5 through 8
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select service Priority Mail Large Flat Rate Box
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Sample Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button Sample
    Then Sign out