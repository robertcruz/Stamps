Feature:  History Toolbar

  Background:
    Given Start test driver

  @history_toolbar
  Scenario: History Filter Panel functions
    Then sign-in to orders
    Then navigate to History
    Then check row 1 on history grid
    Then click refund button on history toolbar
    Then expect refund modal on history is present
    Then close refund modal on history

    Then click schedule pickup button on history toolbar
    Then click all eligible packages button on history toolbar schedule pickup
    Then expect schedule pickup on history is present
    Then set first name on schedule pickup modal to random
    Then set last name on schedule pickup modal to random
    Then set company on schedule pickup modal to stamps.com
    Then set address on schedule pickup modal to 1990 east grand ave
    Then set city on schedule pickup modal to El Segundo
    Then select state on schedule pickup modal California
    Then set zip on schedule pickup modal to 90245
    Then set phone on schedule pickup modal to 8885556622
    Then set phone ext on schedule pickup modal to 123
    Then set number of express mail pieces on schedule pickup modal to 1
    Then set number of priority mail pieces on schedule pickup modal to 1
    Then set number of international pieces on schedule pickup modal to 1
    Then set number of first class pieces on schedule pickup modal to 1
    Then set number of other pieces on schedule pickup modal to 1
    Then set estimated weight on schedule pickup modal to 1
    Then select package location on schedule pickup modal Office
    Then set special instructions on schedule pickup modal to none
    Then close schedule pickup modal on history
    Then click schedule pickup button on history toolbar
    Then click selected packages button on history toolbar schedule pickup
    Then expect schedule pickup on history is present
    Then close schedule pickup modal on history
    Then click schedule pickup button on history toolbar
    Then click manage pickups button on history toolbar schedule pickup
    Then expect manage pickups on history is present
    Then close manage pickups modal on history

    Then click create scan form button on history toolbar
    Then click all eligible packages button on history toolbar create scan form
    Then expect scan form on history is present
    Then close scan form modal on history
    Then click create scan form button on history toolbar
    Then click selected packages button on history toolbar create scan form
    Then expect scan form on history is present
    Then check print details on scan form modal
    Then uncheck print details on scan form modal
    Then close scan form modal on history
    Then click create scan form button on history toolbar
    Then click reprint scan form button on history toolbar create scan form
    Then expect reprint scan form on history is present
    Then close reprint scan form modal on history

    Then click create return label button on history toolbar
    Then expect return label modal on history is present
    Then set from address on return label modal to test test,\n1990 east grand ave,\nEl Segundo, CA 90245-5013
    Then set to address on return label modal to test test,\n1990 east grand ave,\nEl Segundo, CA 90245-5013
    Then set weight on return label modal to 1 lbs 1 oz
#    Then select service on return label modal PM Flat Rate Envelope
    Then close return label modal on history
    Then expect return label modal on history is not present

    Then click cost codes button on history toolbar
    Then expect change cost codes button on history toolbar cost codes is enabled
    Then click change cost codes button on history toolbar cost codes
    Then expect change cost code modal on history is present
    Then select new cost code on change cost code modal None
    Then close change cost code modal on history
    Then expect change cost code modal on history is not present


  @history_export
  Scenario: Verify user should is able to Export History Information
    Then sign-in to orders
    Then navigate to History
    Then expect export button on history toolbar is present
    Then click export button on history toolbar
    Then sign out




