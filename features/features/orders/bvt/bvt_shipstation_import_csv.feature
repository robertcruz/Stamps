
Feature: ShipStation BVT Import CSV

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_shipstation_import_csv
  Scenario:  ShipStation BVT Import CSV
    Then in Orders Toolbar, Import
    Then Import Orders: Cancel
    Then in Orders Toolbar, Import
    Then Import Orders: Select CSV File
    Then Import Orders: File Upload: Set Filename to import_orders_test.csv
    Then pause for 1 second
    Then Import Orders: Expect Imported Filename is import_orders_test.csv
    Then pause for 1 second
    Then Import Orders: Import
    Then pause for 1 second
    Then Import Orders: Expect Import is successful
    Then Import Orders: Success: OK
    Then pause for 1 second
    Then sign out
    Then pause for 1 second

