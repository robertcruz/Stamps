Feature: Endicia WebReg: Profile Page

  Background:
    Given Start test driver

  @ewwr_profile_page_ui_validation
  Scenario: Profile Page Validation

    Then WL: navigates to default registration page for endicia with the following offer id 707

    #Verifying all content present
    Then WL: expect profile page header contain Better Shipping Starts Here
    Then WL: expect profile bread crumbs is Profile

    #Side Content
    Then WL: expect profile page side content side account header is Why do I need to create an account?
    Then WL: expect profile page paragraph contain
    """
    The USPS requires you to register your name, telephone number and physical address from which your postage will be printed. This information will be used to create your Endicia account.
    """
    Then WL: expect profile page money-saving offers and new products header is "Money-saving offers and new products"
    Then WL: expect profile page content under money-saving offers and new products
    """
    Send me special money-saving offers and information on new products and services from Endicia and its partners.
    """
    Then WL: expect profile page money-saving offers and new products is checked
    Then WL: uncheck profile page money-saving offers and new products
    Then WL: check profile page money-saving offers and new products
    Then WL: expect profile page money-saving offers and new products is unchecked

   #Validate Single Help block tooltips
    Then WL: click profile page continue button
    Then WL: expect profile page email tooltip index 1 to be This field is required
    Then WL: expect profile page username tooltip index 1 to be This field is required
    Then WL: expect profile page password tooltip index 1 to be This field is required
    Then WL: expect profile page re-type password tooltip index 1 to be This field is required

    #Verifying all fields present and set Negative values for tooltip Validation
    Then WL: expect profile page email exists
    Then WL: set profile page email to k
    Then WL: expect profile page username exists
    Then WL: set profile page username to r
    Then WL: expect profile page password exists
    Then WL: set profile page password to !
    Then WL: expect profile page re-type password exists
    Then WL: set profile page re-type password to k
    Then WL: expect profile page survey question exists
    Then WL: expect profile page promo code link exists
    Then WL: show profile page promo code
    Then WL: expect profile page promo code exists
    #Then WL: expect profile page promo code to equal source id promo code
    Then WL: set profile page promo code to test1234567
    Then WL: expect profile page continue button exists
    Then WL: click profile page continue button

    #Validate tooltips for various values
    #Validate email tooltips
    Then WL: expect profile page email tooltip count is 2
    Then WL: expect profile page email tooltip index 1 to be 5 character minimum
    Then WL: expect profile page email tooltip index 2 to be Valid email address required

    #Validate username tooltips
    Then WL: expect profile page username tooltip count is 1
    Then WL: expect profile page username tooltip index 1 to be 2 character minimum

    #Validate password tooltips
    Then WL: expect profile page password tooltip count is 3
    Then WL: expect profile page password tooltip index 1 to be 6 character minimum
    Then WL: expect profile page password tooltip index 2 to be At least 1 number required
    Then WL: expect profile page password tooltip index 3 to be At least 1 letter required

    #Validate Re-type password tooltips
    Then WL: expect profile page re-type password tooltip index 1 to be Passwords don't match

    #Validate promo code tooltips
    Then WL: expect profile page promo code tooltip 1 to be Invalid promo code

    #Validating all fields with correct values
    Then WL: set profile page email to random value
    Then WL: expect profile page email is correct

    Then WL: set profile page username to random value
    Then WL: expect profile page username is correct

    Then WL: set profile page password to random value
    Then WL: expect profile page password is correct

    Then WL: set profile page re-type password to same as previous password

    #Validate Survey Question options
    Then WL: set profile page survey question to Individual/Home Office
    Then WL: expect profile page survey question is correct
    Then WL: set profile page survey question to Business Use - Both mailing and shipping
    Then WL: expect profile page survey question is correct
    Then WL: set profile page survey question to Business Use - Mostly mailing (letters/postcards/flats)
    Then WL: expect profile page survey question is correct
    Then WL: set profile page survey question to Business/Ecommerce Use - Mostly shipping packages
    Then WL: expect profile page survey question is correct

    Then WL: set profile page how did you hear about us? to Television Commercial
    Then WL: expect profile page how did you hear about us option is correct
    Then WL: set profile page how did you hear about us? to Web Search
    Then WL: expect profile page how did you hear about us option is correct
    Then WL: set profile page how did you hear about us? to Received Mailer
    Then WL: expect profile page how did you hear about us option is correct
    Then WL: set profile page how did you hear about us? to Recommended by Friend
    Then WL: expect profile page how did you hear about us option is correct
    Then WL: set profile page how did you hear about us? to Radio/Podcast/Streaming Audio
    Then WL: expect profile page how did you hear about us option is correct
    Then WL: set profile page how did you hear about us? to Other
    Then WL: expect profile page how did you hear about us option is correct

    #Validate Promo code
    Then WL: set profile page promo code to X7G8-2HMQ
    Then WL: click profile page continue button
    Then WL: expect membership page header exists
    Then WL: click membership page back button

    Then WL: set profile page promo code to empty
    Then WL: click profile page continue button
    Then WL: expect membership page header exists