Feature: Profile page validation theme_1632

  Background:
    Given I loaded the default registration page

  @registration_profile_page_ui_validation
  Scenario: Profile Page UI Validation
    Then expect Registration navigation bar Stamps logo exists
    Then expect Registration navigation bar USPS logo exists
    Then expect Registration bread crumbs is Profile
    Then expect Profile page header contain Sign up and avoid trips to the Post Office
    Then expect Profile page SideContent Side Account header is "Why do I need to create an account?"
    Then expect Profile page Money-saving offers and new products header is "Money-saving offers and new products"
    Then check Profile page Money-saving offers and new products
    Then expect Profile page Money-saving offers and new products is checked
    Then uncheck Profile page Money-saving offers and new products
    Then expect Profile page Money-saving offers and new products is unchecked

    # Verifying all fields present
    Then expect Profile page email exists
    Then expect Profile page username exists
    Then expect Profile page password exists
    Then expect Profile page retype password exists
    Then expect Profile page Survey Question exists
    Then expect Profile page promo code link exists
    Then expect Profile page CONTINUE button exists
    Then expect Profile page Privacy Policy link exists
    Then expect Profile page copyright link exists

    # Validating all fields
    Then set Profile page Email to random value
    Then expect Profile page Email is correct
    Then set Profile page Username to random value
    Then expect Profile page Username is correct
    Then set Profile page Password to random value
    Then expect Profile page Password is correct
    Then set Profile page Re-type password to same as previous password
    Then expect Profile page Re-Type password is correct

    # Validate Survey Quetion options
    Then set Profile page Survey Question to Mostly shipping
    Then expect Profile page Survey Question is correct
    Then set Profile page Survey Question to Both mailing and shipping
    Then expect Profile page Survey Question is correct
    Then set Profile page Survey Question to Business Use - Mostly mailing (letters/postcards/flats)
    Then expect Profile page Survey Question is correct
    Then set Profile page Survey Question to Individual
    Then expect Profile page Survey Question is correct



