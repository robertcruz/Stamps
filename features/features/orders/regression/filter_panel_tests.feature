
@filter_panel_tests
Feature: Orders Filter Panel

  Background:
    Given a valid user is signed in to Web Apps

  @filter_panel
  Scenario: Filter Panel
    # default filter
    Then expect selected Filter is Awaiting Shipment

    Then select Filter Panel tab Shipped
    Then expect selected Filter is Shipped

    Then select Filter Panel tab Canceled
    Then expect selected Filter is Canceled

    Then select Filter Panel tab Awaiting Shipment
    Then expect selected Filter is Awaiting Shipment

    Then select Filter Panel tab On Hold
    Then expect selected Filter is On Hold

    Then add new order
    Then expect selected Filter is Awaiting Shipment

    Then check grid order id
    Then select Grid Toolbar Move menu item Move to On Hold
    Then set Move to On Hold modal Hold Until date to today plus 1
    Then click Move to On Hold modal move button
    Then select Filter Panel tab On Hold
    Then expect selected Filter is On Hold
    Then expect cached Order ID exist in the selected filter

    Then search filtered Orders for cached Order ID
    Then check grid order id
    Then select Grid Toolbar Move menu item Move to Shipped
    Then expect Move to Shipped modal order number is correct
    Then click Move to Shipped modal move button
    Then remove filter panel search results tab
    Then select Filter Panel tab Shipped
    Then expect selected Filter is Shipped
    Then expect cached Order ID exist in the selected filter

    Then search filtered Orders for cached Order ID
    Then check grid order id
    Then select Grid Toolbar Move menu item Move to Canceled
    Then click Move to Canceled modal move button
    Then remove filter panel search results tab
    Then select Filter Panel tab Canceled
    Then expect selected Filter is Canceled
    Then expect cached Order ID exist in the selected filter

    Then search filtered Orders for cached Order ID
    Then check grid order id
    Then select Grid Toolbar Move menu item Move to Awaiting Shipment
    Then click Move to Awaiting Shipment modal move button
    Then remove filter panel search results tab
    Then select Filter Panel tab Awaiting Shipment
    Then expect selected Filter is Awaiting Shipment
    Then expect cached Order ID exist in the selected filter
    Then sign out

  @filters_user_views
  Scenario: User Views Filter Panel - Panel Default
    When In left Filter Panel, expect system displays expanded filters panel
    Then expect selected Filter is Awaiting Shipment

    Then Filter Panel: Collapse Panel
    Then In left Filter Panel, expect Filters panel is close

    Then Filter Panel: Expand Panel
    Then In left Filter Panel, expect Panel is open

    Then sign out

  @filters_user_change
  Scenario: User Changes filters

    When In left Filter Panel, expect system displays expanded filters panel

    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details domestic ship-to country to United States
    Then set order details ship-to domestic address to
      | full_name   | company      | street_address1      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then set order details service to PM Package
    Then set order details ounces to 1

    Then select Filter Panel tab Awaiting Shipment
    Then expect selected Filter is Awaiting Shipment

    #Then expect orders grid recipient is James Test
    #Then expect orders grid company is Domestic Company
    #Then expect orders grid address is 600 Front St Apt 220
    #Then expect orders grid city is San Diego
    #Then expect orders grid state is CA
    #Then expect orders grid zip is 92101

    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then expect selected Filter is Shipped

    #Then expect orders grid recipient is James Test
    #Then expect orders grid company is Domestic Company
    #Then expect orders grid address is 600 Front St Apt 220
    #Then expect orders grid city is San Diego
    #Then expect orders grid state is CA
    #Then expect orders grid zip is 92101

    Then add new order
    Then expect selected Filter is Awaiting Shipment

    Then sign out

  @filters_pagination
  Scenario: User Views Filter Panel - Panel Default

    Then in left Filter Panel, expect system displays expanded filters panel
    Then select Filter Panel tab Shipped
    Then expect selected Filter is Shipped
    Then in Orders Toolbar, set Per Page drop-down to 500
    Then in Orders Toolbar, expect number of orders on page is correct
    Then Paging: Expect Total Number of Pages is 2
    Then in Orders Toolbar, set Per Page drop-down to 250
    Then Paging: Expect Total Number of Pages is 3
    Then in Orders Toolbar, expect number of orders on page is correct
    Then Paging: Set Per Page drop-down to 100
    Then Paging: Expect Total Number of Pages is 6
    Then in Orders Toolbar, expect number of orders on page is correct
    Then sign out