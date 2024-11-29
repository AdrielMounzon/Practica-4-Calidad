Feature: Add items to shopping cart
  As a customer
  I want to add items to my shopping cart
  So that I can purchase them later

  Scenario: Add a single item to the cart
    Given I am on the "OnLine Catalog" page
    And I click on the "Padded Socks" item on the item name column
    And the product "Padded Socks" has at least 1 unit
    And I press the browser´s back button
    When I write "1" on the order quantity of "Padded Socks"
    And I click the "Place An Order" button
    Then the cart should display "1 Padded Socks"
    And the product total should be "$19.99"
    And the grand total should be "$25.99"

  Scenario Outline: Add multiple items to the cart and place order
    Given I am on the "OnLine Catalog" page
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

  Scenario: Place order adding more units of a product than available on stock

  Scenario: Add items to shopping cart and reset the form