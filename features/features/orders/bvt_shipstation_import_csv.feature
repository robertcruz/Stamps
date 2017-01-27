
Feature: ShipStation BVT Import CSV

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_shipstation_import_csv
  Scenario:  ShipStation BVT Import CSV
    Then In Orders Toolbar, Import
    Then Import Orders: Cancel
    Then In Orders Toolbar, Import
    Then Import Orders: Select CSV File
    Then Import Orders: File Upload: Set Filename to import_orders_test.csv
    Then Pause for 1 second
    Then Import Orders: Expect Imported Filename is import_orders_test.csv
    Then Pause for 1 second
    Then Import Orders: Import
    Then Pause for 1 second
    Then Import Orders: Expect Import is successful
    Then Import Orders: Success: OK
    Then Pause for 1 second
    Then Sign out
    Then Pause for 1 second

