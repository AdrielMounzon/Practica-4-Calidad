Feature: Validate the return to home page
  As a customer
  I want to see the return to home page after placing an order
  So that I can make another order

  @maximize
  Scenario: Return to home page after placing an order
  
    Given I am on the OnLine Store Receipt page
    When I click the "Return to Home Page" button below the Online Store Receipt
    Then I should be redirected to the home page