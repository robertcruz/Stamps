
Feature:  Etsy Store Management

  Background:
    Given a valid user is signed in to Web Apps

    @etsy
    Scenario: Store Management - Etsy Store
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores

      # Add Store
      Then Manage Stores: Add

      Then Marketplace: Select Etsy

      Then Pause for 1 second
      Then Etsy Store: Set Etsy Username to StampsDC
      Then Etsy Store: Find My Shops
      Then Etsy Store: Set Available Shops
      Then Etsy Store: Connect then sign in with Etsy credentials StampsDC/etsydevSTMP1234

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save

      # Reconnect Store
      Then Pause for 1 second
      Then Manage Stores: Select Store random
      Then Manage Stores: Reconnect
      Then Etsy Store: Set Etsy Username to StampsDC
      Then Etsy Store: Find My Shops
      Then Etsy Store: Set Available Shops
      Then Etsy Store: Reconnect then sign in with Etsy credentials StampsDC/etsydevSTMP1234

      # Edit Store
      Then Pause for 1 second
      Then Manage Stores: Select Store random
      Then Manage Stores: Edit

      Then Store Settings: Set Store Nickname to random
      Then Store Settings: Save

      # Delete Store
      Then Pause for 1 second
      Then Manage Stores: Select Store random
      Then Manage Stores: Delete
      Then in Orders Toolbar, Refresh Orders

      Then Manage Stores: Close Modal
      Then Sign out




