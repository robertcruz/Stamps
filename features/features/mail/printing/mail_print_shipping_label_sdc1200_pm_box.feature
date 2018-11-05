
@mail_print_shipping_label_sdc1200_pm_box
Feature: Mail Shipping Label - SDC-1200 - PM Box

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_sdc1200_pm_box_size
  Scenario: Shipping Label - SDC-1200 - PM Box Size

    #mail_print_shipping_label_sdc1200_pm_large_box
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Large Flat Rate Box
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_sdc1200_pm_medium_box
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Medium Flat Rate Box
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    #mail_print_shipping_label_sdc1200_pm_small_box
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Small Flat Rate Box
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

  @mail_print_shipping_label_sdc1200_pm_regional_box
  Scenario: Shipping Label - SDC-1200 - PM Regional Box

   #mail_print_shipping_label_sdc1200_pm_regional_box_a
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Regional Rate Box A
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_shipping_label_sdc1200_pm_regional_box_b
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Regional Rate Box B
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    Then sign out