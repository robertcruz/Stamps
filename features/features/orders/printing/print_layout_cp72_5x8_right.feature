Feature: Print 1 Intl CP72 label on 5.5x8.5 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_5x8_right
  Scenario: Print 1 Intl CP72 label on 5.5x8.5 - right side
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name              | company   | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFR Envelope |  5.5x8.5 Right Side 1  | random       | random           | random | random  | random      | Argentina | random  | random  |
    Then set Order Details service to PMEI Padded Flat Rate Envelope
    Then set Order Details Ounces to 1
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Merchandise
    Then add Customs Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button
    Then Sign out
