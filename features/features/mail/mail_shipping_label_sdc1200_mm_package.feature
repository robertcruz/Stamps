Feature: Mail Shipping Label - SDC-1200 - MM Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_sdc1200_mm_package
  Scenario: Shipping Label - SDC-1200 - MM Package

    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"

    Then set Print form Mail From to default
    Then set Label form Mail To Country to United States
    Then on Label form, set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Mail Service Media Mail Package
    Then on Print form, select left side starting label
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out