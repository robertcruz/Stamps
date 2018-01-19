# Order: OrderNumber, ShipName, ShipCompany, Username, +BuyerEmail +OrderItem: SKU, Description
Feature:  Search Orders

  Background:
    Given a valid user is signed in to Web Apps

  @search_orders
  Scenario: Search order
    # Search for New Order ID
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address in zone 1
    Then set Order Details Email to random
    Then set Order Details Phone to random
    Then hide order details form Ship-To fields
    Then set Order Details service to PM Package
    Then set Order Details Weight to 1 lb 1 oz
    Then uncheck orders grid cached order id
    Then select Filter Panel tab Shipped

    # Search for new order
    Then select Filter Panel tab Awaiting Shipment
    Then search filtered Orders for cached Order ID
    Then expect Filter Panel search results tab is present
    Then expect Filter Panel search result count is 1
    Then expect Filter Panel search result count is greater than 0
    Then remove Filter Panel search results tab
    Then expect Filter Panel search results tab is not present

    # Search for Ship Name
    Then select Filter Panel tab Awaiting Shipment
    Then search filtered Orders for cached Ship-To full name
    Then expect Filter Panel search results tab is present
    Then expect Filter Panel search result count is 1
    Then expect Filter Panel search result count is greater than 0
    Then remove Filter Panel search results tab
    Then expect Filter Panel search results tab is not present

    # Search for Ship Company
    Then select Filter Panel tab Awaiting Shipment
    Then search filtered Orders for cached Ship-To full name
    Then expect Filter Panel search results tab is present
    Then expect Filter Panel search result count is 1
    Then expect Filter Panel search result count is greater than 0
    Then remove Filter Panel search results tab
    Then expect Filter Panel search results tab is not present
    Then Sign out


  @search_orders_on_hold
  Scenario: Search Orders On Hold
    # Search for New Order ID
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address in zone 1
    Then set Order Details Email to random
    Then set Order Details Phone to random
    Then hide order details form Ship-To fields
    Then set Order Details service to PM Package
    Then set Order Details Weight to 1 lb 1 oz

    Then select Grid Toolbar Move menu item Move to On Hold
    Then set Move to On Hold modal Hold Until date to today plus 1
    Then click Move to On Hold modal move button
    Then select Filter Panel tab On Hold
    Then expect selected Filter is On Hold
    Then expect cached Order ID exist in the selected filter

    # Search for new order
    Then search filtered Orders for cached Order ID
    Then expect Filter Panel search results tab is present
    Then expect Filter Panel search result count is 1
    Then expect cached Order ID is in Orders Grid row 1
    Then expect cached Order ID exist in the selected filter
    Then remove Filter Panel search results tab
    Then expect Filter Panel search results tab is not present

    # Search for Ship Name
    Then search filtered Orders for cached Ship-To full name
    Then expect Filter Panel search results tab is present
    Then expect Filter Panel search result count is 1
    Then expect cached Order ID is in Orders Grid row 1
    Then expect cached Order ID exist in the selected filter
    Then remove Filter Panel search results tab
    Then expect Filter Panel search results tab is not present

    # Search for Ship Company
    Then search filtered Orders for cached Ship-To Company name
    Then expect Filter Panel search results tab is present
    Then expect Filter Panel search result count is 1
    Then expect cached Order ID is in Orders Grid row 1
    Then expect cached Order ID exist in the selected filter
    Then remove Filter Panel search results tab
    Then expect Filter Panel search results tab is not present
    Then Sign out