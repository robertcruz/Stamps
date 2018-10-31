@mail_print_label_both_sides
Feature: Mail Shipping Label - Left Side, Mail Shipping Label - Right Side

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_label_left_side
  Scenario: Left Side Shipping Label -  SDC-1200
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to random address in zone 1
    Then set print form ounces to 1
    Then select print form service PM Package
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal
    Then sign out

  @mail_print_label_right_side
  Scenario: Right Side Shipping Label - 8 ½” x 11” Paper

    Then select print on Shipping Label - 8 ½" x 11" Paper

    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4

    Then set print form ounces to 1
    Then select print form service PM Package
#    Then on Print form, select right side starting label
    Then select on Print Preview Panel, right side starting label
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal
    Then sign out

  @mail_print_label_right_side
  Scenario: Right Side Shipping Label -  5 ½” x 8 ½”

    Then select print on Shipping Label - 5x8
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Package
#    Then on Print form, select right side starting label
    Then select on Print Preview Panel, right side starting label
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal
    Then sign out

  @mail_print_label_right_side
  Scenario: Right Side Shipping Label -  SDC-1200

    Then select print on Shipping Label - SDC-1200

    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4

    Then set print form ounces to 1
    Then select print form service PM Package
#    Then on Print form, select right side starting label
    Then select on Print Preview Panel, right side starting label
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal
    Then sign out