Feature:  Mail Print Form Toolbar

  Background:
    Given Start test driver

  @mail_print_button_labels
  Scenario: WEBAPPS-11938 Label for printing stamps has incorrect text
    Then sign-in to mail
    Then select print on Stamps
    Then expect mail toolbar print button label is Print Stamps
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then expect mail toolbar print button label is Print Label
    Then select print on Envelope - #10, 4 ⅛" x 9 ½"
    Then expect mail toolbar print button label is Print Envelope
    Then select print on Roll - 4" x 6" Shipping Label
    Then expect mail toolbar print button label is Print Label
    Then sign out

  @mail_dropdown_tooltip
  Scenario: WEBAPPS-11395 Tooltip Should Not Display when Drop Down Is Active
    Then sign-in to mail
    Then hover on mail toolbar print dropdown
    Then expect mail toolbar print dropdown tooltip is present
    Then blur out on print form
    Then click mail toolbar print dropdown
    Then expect mail toolbar print dropdown tooltip is not present
    Then sign out