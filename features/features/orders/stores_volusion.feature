
Feature:  Volusion Store Management

  Background:
    Given a valid user is signed in to Web Apps

    @volusion
    Scenario: Store Management - Volusion Store
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores

      # Add Store
      Then Manage Stores: Add

      Then Marketplace: Select Volusion

      Then Volusion Store: Set Volusion API to http://ywvmt.dmjeb.servertrust.com/net/WebService.aspx?Login=qaclient@stamps.com&EncryptedPassword=39E8EDED1C795511ACF981DD59FF8398399965CD1A6D3F8069EEF60A096282E2&EDI_Name=Generic\Orders
      
      Then Volusion Store: Connect

      Then Store Settings: Set Store Nickname to random
      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save

      Then in Orders Toolbar, Refresh Orders
      Then Manage Stores: Select Store random

      # Reconnect Store
      Then Manage Stores: Reconnect

      Then Volusion Store: Set Volusion API to http://ywvmt.dmjeb.servertrust.com/net/WebService.aspx?Login=qaclient@stamps.com&EncryptedPassword=39E8EDED1C795511ACF981DD59FF8398399965CD1A6D3F8069EEF60A096282E2&EDI_Name=Generic\Orders
      
      Then Volusion Store: Reconnect

      # Edit Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Edit

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save
      Then in Orders Toolbar, Refresh Orders

      # Delete Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Delete
      Then in Orders Toolbar, Refresh Orders

      # Delete All Stores
      Then Manage Stores: Delete All Stores

      Then Manage Stores: Close Modal
      Then Pause for 1 second
      Then Sign out






      #Then Store Settings: Set service Mapping 1, Requested Services random, Shipping service First-Class Mail Postcard
      #Then Store Settings: Set service Mapping 2, Requested Services random, Shipping service Priority Mail Package
      #Then Store Settings: Set service Mapping 3, Requested Services random, Shipping service Priority Mail Small Flat Rate Box