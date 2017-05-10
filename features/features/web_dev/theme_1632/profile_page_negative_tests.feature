Feature: Profile page negative tests

  Background:
    Given I loaded SDC Website

  @registration_profile_page_negative_tests
  Scenario: Profile Page negative tests
    Then click on Get Started
    Then Pause for 2 seconds
    Then click Profile Page Continue button
    Then expect Profile Page Email help text is This field is required
    Then expect Profile Page Username help text is This field is required
    Then expect Profile Page Password help text is This field is required
    Then expect Profile Page Retype password help text is This field is required
    Then expect Profile Page Survey question help text is This field is required
    Then set Profile page Email to s
    Then blur out of Profile Page
    Then expect Profile page Email help text 1 is 5 character minimum
    Then expect Profile page Email help text 2 is Valid email address required
    Then set Profile Page Email to sa
    Then blur out of Profile Page
    Then expect Profile Page Email help text 1 is 1 is 5 character minimum
    Then expect Profile Page Email help text 2 is Valid email address required
    Then set Profile Page Email to testqa@
    Then blur out of Profile Page
    Then expect Profile Page Email help text 1 is Valid email address required
    Then set Profile page email to qawebdevelopment@stamps.com
    #Then click into the Profile page username field
    #Then expect username tooltip is Your username must have a minimum of 2 characters and not contain spaces
    Then set Profile page username to sa v
    Then blur out of the Profile page
    Then expect Profile page username help text is Username must not contain spaces
    Then set Profile page username to qa
    Then click into Profile page
    #Then expect password tooltip is have 16-14 characters
    #Then expect password tooltip is include at least 1 number
    #Then expect password tooltip is include at least 1 letter
    #Then expect password tooltip is not be the same as USERNAME
    Then set Profile page password to qa
    Then click into Profile page
    #Then expect Profile page password help text include at least 1 letter is checked
    #Then expect Profile page password help text not to be the same as USERNAME is checked
    Then blur out of the Profile page
    Then expect Profile page Password help text 1 is 6 character minimum
    Then expect Profile page Password help text 2 is At least 1 number required
    Then expect Profile page Password help text 3 is Cannot match username

    Then set Profile page password to qatest
    #Then expect Profile page password help text include at least 1 letter is checked
    #Then expect Profile page password help text not to be the same as USERNAME is checked
    #Then expect Profile page password help text have 6-14 characters is checked
    Then blur out of the Profile page
    Then expect Profile page Password help text is At least 1 number required

    Then set Profile page password to qatest7
    #Then expect Profile page Password help text include at least 1 letter is checked
    #Then expect Profile page Password help text not to be the same as USERNAME is checked
    #Then expect Profile page Password help text have 6-14 characters is checked
    #Then expect Profile page Password help text include at least 1 number is checked

    Then set Profile page retype password field to qatest
    Then blur out of the field
    Then expect Profile page retype password help text is Password's don't match
    Then set Profile page retype password field to qatest7
    Then set survey question to Individual/Home office
    Then blur out of the field
    Then click on link I have a promo code
    Then expect profile page promo code is PR33-NH77
    Then set Profile page Promo Code to an empty string
    Then blur out of the field
    Then expect Profile page promo code help text is not present
    Then set Profile page promo code field to zz
    Then expect Profile page promo code help text is Invalid promo code









