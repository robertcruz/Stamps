
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given a valid user is signed in to Web Apps

  @reprint_media @reprint
  Scenario: User Reprints Order - US Territory | CP72

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to Domestic Address
      | name         | company            | street_address | street_address_2| city | state | zip        | country       | phone  |  email |
      | Reprint Test | 8.5x11 Plain Paper | PO Box 10281   |                 | Palau| PW    | 96940-0881 | United States | 8885551212 | test@stamps.com |
    Then on Order Details form, set Weight to 2 lb 1 oz
    Then on Order Details form, select service MM Package
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button

    Then In left filter panel, select Shipped
    Then In Orders Grid, check saved Order ID
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out

