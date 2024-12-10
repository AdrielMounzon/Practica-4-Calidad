Feature: Add items to shopping cart
  As a customer
  I want to add items to my shopping cart
  So that I can purchase them later

  Background:
    Given I am on the "OnLine Catalog" page

    Scenario Outline: Add a single item to the cart
    And I click on the "<product_name>" item on the item name column
    And I am now on the "Products" page
    And the product "<product_name>" has at least 1 unit
    And I press the browser's back button
    When I write "1" on the order quantity of "<product_name>"
    And I click the "Place An Order" button
    Then I should be on the "Place Order" page
    And the cart should display "1" in the quantity column and "<product_name>" in the product description column
    And the product total should be "<product_total>"
    And the grand total should be "<grand_total>"
  
  Examples:
  | product_name            | product_total | grand_total |
  | Back Country Shorts     | 24.95         | 31.20       |
  | Hiking Boots            | 109.90        | 120.40      |
  | Padded Socks            | 19.99         | 25.99       |
  | Glacier Sun Glasses     | 67.99         | 76.39       |
  | External Frame Backpack | 179.95        | 193.95      |
  | 3 Person Dome Tent      | 299.99        | 319.99      |

  Scenario: Add multiple items to the cart and place order
    And I click on the "Padded Socks" item on the item name column
    And the product "Padded Socks" has at least 1 unit
    And the product "Hiking Boots" has at least 1 unit
    And I press the browser's back button
    When I write "1" on the order quantity of "Padded Socks"
    And I write "1" on the order quantity of "Hiking Boots"
    And I click the "Place An Order" button
    Then the cart should display "1" in the quantity column and "Padded Socks" in the product description column
    And the cart should display "1" in the quantity column and "Hiking Boots" in the product description column
    And the combined product total should be "129.89"
    And the combined grand total should be "141.38"  

  Scenario: Place order without adding any product to the cart
    When I click the "Place An Order" button
    Then I should see a message "Please Order Something First"

  Scenario: Add items to shopping cart and reset the form
    And I write "1" on the order quantity of "Hiking Boots"
    When I click the "Reset Form" button
    Then the order form should be cleared

  Scenario: Place order adding more units of a product than available on stock
    And I click on the "Padded Socks" item on the item name column
    And the product "Padded Socks" has 47 units in stock
    When I press the browser's back button
    And I am now on the "OnLine Catalog" page
    And I write "50" on the order quantity of "Padded Socks"
    And I click the "Place An Order" button
    Then I should see a message "Insufficient stock for Padded Socks"

  Scenario Outline: Validate Sales Tax and Grand Total for different products
    And I click on the "<product_name>" item on the item name column
    And the product "<product_name>" has at least <quantity> units
    And I press the browser's back button
    When I write "<quantity>" on the order quantity of "<product_name>"
    And I click the "Place An Order" button
    Then I should be on the "Place Order" page
    And the cart should display "<quantity>" in the quantity column and "<product_name>" in the product description column
    And the product total should be "<product_total>"
    And I see the correct Sales Tax as "<sales_tax>"
    And the grand total should be "<grand_total>"

  Examples:
    | product_name              | quantity | product_total | sales_tax | grand_total |
    | 3 Person Dome Tent        | 1        | 299.99        | 15        | 319.99      |
    | 3 Person Dome Tent        | 2        | 599.98        | 30        | 634.98      |
    | External Frame Backpack   | 1        | 179.95        | 9         | 193.95      |
    | External Frame Backpack   | 2        | 359.9         | 18        | 382.9       |
    | Glacier Sun Glasses       | 1        | 67.99         | 3.4       | 76.39       |
    | Padded Socks              | 1        | 19.99         | 1         | 25.99       |
    | Hiking Boots              | 1        | 109.90        | 5.5       | 120.40      |
    | Back Country Shorts       | 1        | 24.95         | 1.25      | 31.2        |

  Scenario: Validate Shipping & Handling charge
    When I write "<quantity>" on the order quantity of "<product_name>"
    And I click the "Place An Order" button
    Then I see the Shipping & Handling as "$5.00"

  Examples:
    | product_name             | quantity |
    | 3 Person Dome Tent       | 1        |
    | 3 Person Dome Tent       | 2        |
    | External Frame Backpack  | 1        |
    | External Frame Backpack  | 3        |
    | Glacier Sun Glasses      | 2        |
    | Padded Socks             | 5        |
    | Hiking Boots             | 1        |
    | Back Country Shorts      | 3        |
