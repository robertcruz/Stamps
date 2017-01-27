Feature: Print 2 Intl CN22 labels on 8.5x11 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_cn22_paper_right
  Scenario: Print 2 Intl CN22 labels on 8.5x11 - right side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI PFR Envelope | 8.5x11 Right Side 2 | random           | random           | random | random  | random      | Australia | random  | random  |
    Then on Order Details form, select service PMI Padded Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Envelope | 8.5x11 Right Side 1 | random           | random           | random | random  | random      | Japan | random  | random  |
    Then on Order Details form, select service PMI Legal Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select right-side label
    Then in Print modal, expect right-side label selected
    Then in Print modal, click Print button
    Then Sign out
