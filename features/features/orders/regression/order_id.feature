
Feature: Saved Order ID Created

  Background:
    Given a valid user is signed in to Web Apps

  @order_id
  Scenario:  Saved Order ID Created
    Then add new order
    Then expect Order Details form Order ID is truthy
    Then expect Order Details form Order ID equals Grid Oder ID in row 1
    Then Sign out