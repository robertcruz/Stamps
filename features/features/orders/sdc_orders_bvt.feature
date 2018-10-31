Feature:  BVT tests for Orders

  Background:
    Given Start test driver

  @healthcheck
  Scenario: Orders Healthcheck
    Then verify health check for Orders
    Then verify health check for Address Book
    Then verify health check for OR Reports
    Then verify health check for Postage Tools

  @authentication
  Scenario: Orders Authentication Test
    # sign-in to orders
    Then sign-in to orders
    Then sign out


  @bvt_new_order
  Scenario:  BVT Add a new order
    Then sign-in to orders
    Then add new order
    Then set order details ship-to to Full Name, BVT New Order, 2622 New Banner Ln, Herndon, VA, 20171
    Then set order details email to random
    Then set order details phone to random
    Then set order details service to PM Package
    Then set order details pounds to 1
    Then set order details ounces to 1
    Then set order details length to 1
    Then set order details width to 1
    Then set order details height to 1
    Then set order details insure-for to 50.00


  @bvt_orders_ship_date
  Scenario: Ship Date defaults to today
    Then sign-in to orders
    Then open orders settings general settings
    Then set orders settings general postdate to now +2 hours
    Then close orders settings modal
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to PM Flat Rate Envelope
    Then click orders toolbar print button
    Then expect print modal ship date is 0 days from today
    Then close print modal

    Then open orders settings general settings
    Then set orders settings general postdate to now -2 hours
    Then close orders settings modal
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to PM Flat Rate Envelope
    Then click orders toolbar print button
    Then expect print modal ship date is 1 days from today
    Then close print modal

    Then open orders settings general settings
    Then set orders settings general postdate to now +2 hours
    Then close orders settings modal
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to PM Flat Rate Envelope
    Then click orders toolbar print button
    Then expect print modal ship date is 0 days from today
    Then set print modal ship date to today
    Then set print modal ship date to today plus 1
    Then set print modal ship date to today plus 2
    Then set print modal ship date to today
    Then expect print modal ship date is 0 days from today
    Then close print modal
    Then open orders settings general settings
    Then set orders settings general postdate to 5:00 p.m.
    Then close orders settings modal
    Then sign out

  @bvt_orders_ship_date_calendar
  Scenario: Set Ship Date to today
    Then sign-in to orders
    Then open orders settings general settings
    Then set orders settings general postdate to now +2 hours
    Then close orders settings modal
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to PM Flat Rate Envelope
    Then click orders toolbar print button
    Then expect print modal ship date is 0 days from today
    Then select Print modal Ship Date datepicker to today
    Then select Print modal Ship Date datepicker to today plus 1
    Then select Print modal Ship Date datepicker to today plus 2
    Then select Print modal Ship Date datepicker to today
    Then expect print modal ship date is 0 days from today
    Then close print modal
    Then open orders settings general settings
    Then set orders settings general postdate to 5:00 p.m.
    Then close orders settings modal
    Then sign out

  @bvt_international_shipping
  Scenario: BVT International Shipping
    Then sign-in to orders
    Then add new order
    Then set order details ship-to international address to
      | full_name   | company | street_address1         | street_address2 | city   | province | postal_code  | country| phone   |  email  |
      | random      | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then set order details ounces to 4
    Then set order details service to PMI Flat Rate Envelope
    Then click order details form customs form button
    # create items
    Then add customs associated item 1, description random, qty 1, Price 4, Made In Philippines, Tariff 1
    Then add customs associated item 2, description random, qty 1, Price 4, Made In Japan, Tariff 1
    Then add customs associated item 3, description random, qty 1, Price 4, Made In France, Tariff 1
    # edit item
    Then edit customs associated item 1, description random, qty 2, Price 4.25, Made In United States, Tariff 1
    Then edit customs associated item 2, description random, qty 2, Price 4.50, Made In United States, Tariff 1

    Then expect customs associated item grid count is 3
    Then set customs package contents to Commercial Sample
    Then set customs package contents to Gift
    Then set customs package contents to Document
    Then set customs package contents to Humanitarian Donation
    Then set customs package contents to Merchandise
    Then set customs package contents to Other
    Then set customs more info to random string
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Not required
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    #Then click orders toolbar print button
    #Then in print modal, click close button
    Then sign out


  @bvt_shipping_address_management
  Scenario: BVT Shipping Address
    Then sign-in to orders
    Then add new order
    Then add new address to manage shipping address
      |ship_from_zip  | full_name     | company    | street_address     | street_address2 | city          | state       | zip    | country       | phone           |
      |90245          | Euan Davidson | Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California  | 94105  | United States | (415) 123-5555  |
    Then delete all addresses on manage shipping address modal
    Then set order details ship-from to Euan Davidson - San Francisco, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Package
    Then sign out

  @bvt_shipstation_search
  Scenario: Search shipstation orders
    Then sign-in to orders
    Then add new order
    Then set order details ship-to to random address in zone 1
    Then set order details email to random
    Then set order details phone to random
    Then set order details service to PM Package
    Then set order details weight to 1 lb 1 oz
    Then uncheck grid order id
    Then check grid order id
    Then search filtered Orders for cached Order ID
    Then expect filter panel search results tab is present
    Then expect Filter Panel search result count is 1
    Then check grid order id
    Then expect filter panel search result count is greater than 0
    Then remove filter panel search results tab
    Then expect filter panel search results tab is not present
    Then sign out

  @bvt_shipstation_updates_domestic
  Scenario: Update ShipStation for Domestic
    Then sign-in to orders
    Then add new order
    Then set order details ship-to domestic address to
      | full_name       | company      | street_address1   | street_address2| city    | state | zip    | country  | phone | email |
      | First Last      | Company Name | 777 N Orange Ave | Apt 100         | Orlando | FL    |   | United States | random | random |
    Then set order details pounds to 1
    Then set order details ounces to 1
    Then set order details service to PM Package
    Then set order details insure-for to 100.00
    Then set order details tracking to Signature Required
    Then set order details length to 1
    Then set order details width to 1
    Then set order details height to 1

    Then set order details reference number to Update Orders To ShipStation
    Then add order details item 1, qty 1, id Item 1 SKU, description Item 1 Description

    # verify Orders Grid values
    #Then expect orders grid service is correct
    Then expect orders grid service ship-from is correct
    Then expect orders grid store is Manual Orders
    Then expect orders grid order id is correct
    Then expect orders grid ship cost is correct
    #Then expect orders grid age is < 24 hours
    Then expect orders grid order date is populated
    #Then expect orders grid recipient is correct
    Then expect orders grid address is 777 N Orange Ave Apt 100
    #Then expect orders grid city is Orlando
    Then expect orders grid state is FL
    Then expect orders grid zip is 32801-1175
    Then expect orders grid phone is correct
    Then expect orders grid tracking service is correct
    Then expect orders grid email is correct
    Then expect orders grid reference number is correct
    Then expect orders grid qty is 1
    Then expect orders grid item sku is Item 1 SKU
    Then expect orders grid item name is Item 1 Description
    Then expect orders grid service is correct
    Then expect orders grid weight is 1 lb. 1 oz.
    Then expect orders grid order status is Awaiting Shipment
    Then expect orders grid pounds is 1
    Then expect orders grid ounces is 1
    Then expect orders grid insured value is 100.00
    #Then expect orders grid order total is correct
    #Then expect orders grid tracking number is populated

  #Verify Single Order Details form was saved in ShipStation
    Then expect order details pound is 1
    Then expect order details ounce is 1
    Then expect order details length is 1
    Then expect order details width is 1
    Then expect order details height is 1
    Then expect order details service cost is correct
    Then expect order details insure-for is 100.00
    Then expect order details tracking is correct
    Then expect order details tracking cost is correct
    Then expect order details reference number is correct
    Then expect order details ship-to email is correct
    Then expect order details ship-to phone is correct

#    Then click orders toolbar print button
#    Then in print modal, click close button
#    Then sign out


  @bvt_shipstation_updates_international
  Scenario:  Update ShipStation for International
    Then sign-in to orders
    Then add new order
    Then set order details ship-to international address to
      | full_name     | company       | street_address1 | street_address2 | city          | province      | postal_code   | country| phone         |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | India  | Random phone  | Random email  |
    Then expect order details ship-to country is correct
    Then set order details weight to 2 lb 2 oz
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details insure-for to 100.25
    Then set order details reference number to a random string
    Then add order details item 1, qty 1, id ID 1, description Description 1
    Then expect orders grid service is correct

    Then click order details form customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Document
    Then set customs package contents to Commercial Sample
    Then expect customs package contents is Commercial Sample
    Then set customs license number to a random string
    Then expect customs license number is correct
    Then set customs certificate number to some random string
    Then expect customs certificate number is correct
    Then set customs invoice number to a random string
    Then expect customs invoice number is correct
    Then set customs non-delivery options to Treat as abandoned
    Then expect customs non-delivery options is Treat as abandoned
    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required
    Then set customs itn number to ITN123
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then expect order details international ship-to name is correct
    Then expect order details international ship-to company is correct
    Then expect order details international ship-to address 1 is correct
    Then expect order details international ship-to address 2 is correct
    Then expect order details international ship-to city is correct
    Then expect order details international ship-to province is correct
    Then expect order details international ship-to postal code is correct
    Then expect order details international ship-to phone is correct
    Then expect order details international ship-to email is correct
    Then expect order details reference number is correct
    Then expect order details service cost is correct
    Then expect order details pounds is 2
    Then expect order details ounces is 2
    Then expect order details associated item 1 qty is 1
    Then expect order details associated item 1 ID is ID 1
    Then expect order details associated item 1 Description is Description 1
    Then expect order details insure-for is correct
    Then click order details form customs form button
    Then pause for 2 second
    Then expect customs package contents is Commercial Sample
    Then expect customs license number is correct
    Then expect customs certificate number is correct
    Then expect customs invoice number is correct

    Then expect customs non-delivery options is Treat as abandoned
    Then expect customs internal transaction number is Required

    Then expect customs associated item 1 Description is correct
    Then expect customs associated item 1 Quantity is correct
    Then expect customs associated item 1 Unit Price is correct
    Then expect customs associated item 1 Made In is correct
    Then expect customs associated item 1 Tariff is correct
    Then expect Customs Total Value is correct
    Then close customs information form

    Then expect orders grid service ship-from is correct
    #todo-rob revisit grid
    #Then expect orders grid recipient is correct
    Then expect orders grid country is correct
    Then expect orders grid address is correct
    Then expect orders grid city is correct
    Then expect orders grid state is correct
    Then expect orders grid zip is correct
    Then expect orders grid phone is correct
    Then expect orders grid email is correct

    Then expect orders grid qty is correct
    Then expect orders grid weight is 2 lb. 2 oz.

    Then expect orders grid service is correct
    Then expect orders grid service is correct
   Then expect orders grid order status is Awaiting Shipment

    Then sign out

  @bvt_address_cleansing
  Scenario: BVT Address Cleansing
    Then sign-in to orders
    Then add new order
    Then set order details ship-to domestic address to
      | full_name     | company | street_address1     | street_address2 | city          | state | zip | country       | phone          |  email           |
      | Euan Davidson | Betfair | 1350 Market Street |                 | San Francisco | CA    |     | United States | (415) 123-5555 | rtest@stamps.com |
    Then set order details service to PM Package
    Then set order details ounces to 1
    Then blur out on order details form
    Then pause for 2 seconds
    Then expect orders grid recipient is Euan Davidson
    Then expect orders grid address is 1350 Market Street
    Then expect orders grid city is San Francisco
    Then expect orders grid state is CA
    Then expect orders grid zip is 94102
    Then sign out

  @bvt_purchasing
  Scenario: BVT Purchasing $10
    Then sign-in to orders
    Then save balance amount
    Then hover on navigation menu balance
    Then click on navigation menu buy more
    Then on add funds modal, purchase 10
    Then on add funds modal, click purchase button
    Then buy mail confirm purchase: expect text area contains, please confirm your $10.00 postage purchase.
    Then buy mail confirm transction: click confirm button
    Then buy mail purchase approved: expect text area contains, your fund request for $10.00 has been approved.
    Then buy mail purchase approved: click ok button
    Then buy mail: expect customer balance increased by $10
    Then sign out


  @bvt_bulk_update
  Scenario: BVT Bulk Update International
    Then sign-in to orders
  # Order #1 (Domestic)
    #Then in Orders Grid, Sort Order Date in Descending Order
    Then add order 1
    Then blur out on order details form
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Package
    Then set order details ounces to 1
    Then blur out on order details form

#  # Order #2 (International)
    Then add order 2
    Then blur out on order details form
    Then set order details ship-to international address to
      | full_name     | company       | street_address1 | street_address2 | city          | province      | postal_code   | country | phone        |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | France  | Random phone | Random email  |
    Then set order details weight to 0 lb 1 oz
    Then set order details service to PMI Flat Rate Envelope
    Then blur out on order details form

#  Check 1st two orders
    Then check orders grid row 1
    Then check orders grid row 2

  # Updating order details
    Then expect bulk update is present
    Then set bulk update domestic service to PM Large Package
    Then set bulk update international service to PMI Package/Flat/Thick Envelope
    Then check bulk update weight
    Then set bulk update pounds to 0
    Then set bulk update ounces to 3
    Then click bulk update update order button
    Then wait until orders available

#  # Uncheck both orders
    Then uncheck orders grid row 1
    Then uncheck orders grid row 2

#  # verify fields in 1st order
    Then check orders grid row 1
    Then expect Order Details service is PM Large Package
    Then expect order details pound is 0
    Then expect order details ounce is 3
    Then uncheck orders grid row 1

#  # verify fields in 2nd order
    Then check orders grid row 2
    Then expect order details international service is PMI Package/Flat/Thick Envelope
    Then expect order details pound is 0
    Then expect order details ounce is 3
    Then sign out

  @bvt_ambigious_address
  Scenario: BVT Ambigious Address
    Then sign-in to orders
    Then add new order
    Then set order details ship-to ambiguous address to
      | full_name      | company  | street_address      | city          | state | zip   | country       | phone           |  email           |
      | Juan Dela Cruz | Betfair  | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com |
    Then expect exact address not found window title is Exact Address Not Found
    Then select exact address not found row 5
    Then click exact address not found accept button
    Then set order details service to PM Package
    Then expect orders grid recipient is Juan Dela Cruz
    Then expect orders grid city is San Francisco
    Then expect orders grid state is CA
    Then expect orders grid zip is 94102
    Then sign out

  @bvt_printing
  Scenario:  BVT Printing
    Then sign-in to orders
    Then add new order
    Then set order details ship-to to random address in zone 8
    Then set order details service to PM Package
    Then set order details ounces to 1
    Then set order details width to 1
    Then set order details length to 1
    Then set order details height to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then click print modal print button
    Then select orders filter shipped tab
    Then select orders filter awaiting shippment tab
    Then select orders filter shipped tab
    #Then in Orders Grid, Sort Order Date in Descending Order
    Then sign out

  @bvt_form_validation_orders_details
  Scenario:  BVT UI Validation for Single Order Detail form
    Then sign-in to orders
    Then add new order
    Then expect order details is present
    ##Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address in zone 7
    Then set order details service to PM Package
    Then set order details pounds to 0
    Then set order details ounces to 1
    Then set order details width to 1
    Then set order details length to 1
    Then set order details height to 1
    #Then set order details service to FCM Large Envelope/Flat
    Then set order details service to FCM Package/Thick Envelope
    Then set order details service to PM Large/Thick Envelope
    Then set order details service to PM Package
    Then set order details service to PM Large Package
    Then set order details service to PM Flat Rate Envelope
    Then set order details service to PM Padded Flat Rate Envelope
    Then set order details service to PM Legal Flat Rate Envelope
    Then set order details service to PM Small Flat Rate Box
    Then set order details service to PM Medium Flat Rate Box
    Then set order details service to PM Large Flat Rate Box
    Then set order details service to PM Regional Rate Box A
    Then set order details service to PM Regional Rate Box B
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details service to PME Flat Rate Envelope
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details service to PME Legal Flat Rate Envelope
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details service to PSG Large Package
    Then set order details service to PSG Oversized Package
    Then set order details service to PM Package
    Then check order details insure-for checkbox
    #Then uncheck order details insure-for checkbox
    Then check order details insure-for checkbox
    Then set order details insure-for to 11.99
    Then set order details tracking to USPS Tracking
    Then set order details reference to STMPS111
    Then add order details item 1, qty 1, id ID 1, description Description 1
    Then add order details item 2, qty 2, id random string, description random string
    Then add order details item 3, qty 3, id ID 3, description random string
    Then expect filter panel search results tab is not present
    Then expect orders filter awaiting shippment tab is present
    Then expect orders filter shipped tab is present
    Then expect orders filter canceled tab is present
    Then expect orders filter on hold tab is present
    Then search orders for random expecting to find at least 0
    Then expect filter panel search results tab is present
    Then remove filter panel search results tab
    Then collapse orders filter panel
    Then expand orders filter panel
    Then expect orders toolbar print is present
    Then expect orders toolbar add is present
    Then expect orders toolbar move is present
    Then expect orders toolbar tags is present
    Then expect orders toolbar more actions is present
    Then sign out

  @bvt_form_validation_bulk_update
  Scenario:  BVT UI Validation for Bulk Update form
    Then sign-in to orders
    Then add new order
    Then expect order details is present
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name     | company       | street_address1 | street_address2 | city          | province      | postal_code   | country | phone        |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | Italy   | Random phone | Random email  |
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details pounds to 1
    Then set order details ounces to 1
    Then set order details service to FCMI Package/Thick Envelope
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details service to PMI Flat Rate Envelope
    Then set order details service to PMI Padded Flat Rate Envelope
    Then set order details service to PMI Legal Flat Rate Envelope
    Then set order details service to PMI Small Flat Rate Box
    Then set order details service to PMI Medium Flat Rate Box
    Then set order details service to PMI Large Flat Rate Box
    Then set order details service to PMEI Package/Flat/Thick Envelope
    Then set order details service to PMEI Flat Rate Envelope
    Then set order details service to PMEI Padded Flat Rate Envelope
    Then set order details service to PMEI Legal Flat Rate Envelope
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then check order details insure-for checkbox
    #Then uncheck order details insure-for checkbox
    Then check order details insure-for checkbox
    Then set order details insure-for to 11.99
    Then set order details reference to STMPS111
    Then add order details item 1, qty 1, id ID 1, description Description 1
    Then click order details form customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Document
    Then set customs package contents to Gift
    Then set customs package contents to Humanitarian Donation
    Then set customs package contents to Merchandise
    Then set customs package contents to Returned Goods
    Then set customs package contents to Other
    Then set customs more info to a random string
    Then set customs package contents to Commercial Sample
    Then set customs license number to a random string
    Then set customs certificate number to some random string
    Then set customs invoice number to a random string
    Then set customs non-delivery options to Treat as abandoned
    Then expect customs non-delivery options is Treat as abandoned
    Then set customs non-delivery options to Return to sender
    Then expect customs non-delivery options is Return to sender
    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required
    Then set customs itn number to ITN123
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 2, description Item 2, qty 2, Price 2, Made In Japan, Tariff 2
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then sign out
