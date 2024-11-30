Feature: Validate product details
  As a customer
  I want to see the details of a product
  So that I can get more information about the product and the available amount on the store

  Scenario: Validate product details from a single product
    Given I am on the Products page
    When I scroll to the "Padded Socks" section
    Then the product name should be shown
    And the slogan should be shown
    And an image should be shown
    And "Unit Price" should be greater than 0
    And "# In Stock" should be equal or greater than 0
    And "Item Number" should be equal or greater than 0
    And the description below the image should be shown

  Scenario Outline: Validate product details from many products
    Given I am on the Products page
    When I scroll to the "<product_name>" section
    Then the product name should be shown
    And the slogan should be shown
    And an image should be shown
    And "Unit Price" should be greater than 0
    And "# In Stock" should be equal or greater than 0
    And "Item Number" should be equal or greater than 0
    And the description below the image should be shown

Examples:
    | product_name        |
    | Back Country Shorts |
    | Hiking Boots        |