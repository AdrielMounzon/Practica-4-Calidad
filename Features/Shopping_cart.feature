Feature: Add items to shopping cart
  As a customer
  I want to add items to my shopping cart
  So that I can purchase them later

  Scenario: Add a single item to the cart
    Given I am on the OnLine Catalog page
    And the product "Padded Socks" has at least 1 unit
    When I write one on the order quantity of "Padded Socks"
    And I click the "Place An Order" button
    Then the cart should display "1 Padded Socks"
    And the product total should be "$19.99"
    And the grand total should be "$25.99"

  Scenario: Add multiple items to the cart
    Given I am on the OnLine Catalog page
    And the product "Padded Socks" has at least 1 unit
    And the product "Hiking Boots" has at least 1 unit
    When I write one on the order quantity of "Padded Socks"
    And I write one on the order quantity of "Hiking Boots"
    And I click the "Place An Order" button
    Then the cart should display "1 Padded Socks"
    And the cart should display "1 Hiking Boots"
    And the product total should be "$129.89"
    And the grand total should be "$141.38"