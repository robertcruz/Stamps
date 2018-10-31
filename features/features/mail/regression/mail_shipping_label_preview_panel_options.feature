Feature:Shipping Label Preview Panel 

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_preview_panel_options
  Scenario: Shipping Label Preview Panel

    Then select print on Shipping Label - 5x8

    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    #Then select print form service Priority Mail Package
    Then select print form service PM Package
    Then show advanced options

    # Hide Label Value Check-box
    Then check advanced options hide label value
    Then expect advanced options hide label value is checked
    Then uncheck advanced options hide label value
    Then expect advanced options hide label value is unchecked
    # Print Receipt Check-box
    Then check advanced options print receipt
    Then expect advanced options print receipt is checked
    Then uncheck advanced options print receipt
    Then expect advanced options print receipt is unchecked
    # Print Reference Check-box
    Then check advanced options print reference #
    Then expect advanced options print reference # is checked
    Then uncheck advanced options print reference #
    Then expect advanced options print reference # is unchecked

    Then set print form advanced options reference number to random string
    Then expect print form advanced options reference number is correct
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal
    Then sign out

