Feature: Add items to shopping cart
  As a customer
  I want to add items to my shopping cart
  So that I can purchase them later

  Background:
    Given I am on the "OnLine Catalog" page

  Scenario: Add a single item to the cart
    And I click on the "Padded Socks" item on the item name column
    And the product "Padded Socks" has at least 1 unit
    And I press the browser´s back button
    When I write "1" on the order quantity of "Padded Socks"
    And I click the "Place An Order" button
    Then the cart should display "1" in the quantity column and "Padded Socks" in the product description column
    And the product total should be "$19.99"
    And the grand total should be "$25.99"

  Scenario Outline: Add multiple items to the cart and place order
    And I click on the "<product>" item on the item name column
    And the product "<product>" has at least 1 unit
    And I press the browser´s back button
    When I write "<quantity>" on the order quantity of "<product>"
    And I click the "Place An Order" button
    Then the cart should display "<quantity>" <product>
    And the product total should be "$129.89"
    And the grand total should be "$141.38"

    | product      | quantity |
    | Padded Socks | 1        |
    | Hiking Boots | 1        |

  Scenario: Place order without adding any product to the cart
    When I click the "Place An Order" button without adding any product
    Then I should see a message "Please Order Something First"


  Scenario: Place order adding more units of a product than available on stock
    And I click on the "Padded Socks" item on the item name column
    And the product "Padded Socks" has 47 units in stock
    When I write "50" on the order quantity of "Padded Socks"
    And I click the "Place An Order" button
    Then I should see a message "Insufficient stock for Padded Socks"
    And the order should not be placed

  Scenario: Add items to shopping cart and reset the form
    And I write "2" on the order quantity of "Hiking Boots"
    And I click the "Place An Order" button
    When I click the "Reset Form" button
    And the order form should be cleared