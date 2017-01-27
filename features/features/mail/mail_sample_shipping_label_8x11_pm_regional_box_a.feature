Feature: Mail Sample Shipping Label - 8 ½” x 11” Paper - PM Regional Rate Box A



  Background:
    Given I am signed in as Mail shipper


  @mail_print_sample_shipping_label_8x11_pm_regional_box_a
  Scenario: Sample Shipping Label - 8 ½” x 11” Paper - PM Regional Rate Box A

    Then Mail: Select Shipping Label - 8 ½” x 11” Paper

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 5 through 8
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select service Priority Mail Regional Rate Box A
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Sample Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button Sample
    Then Sign out