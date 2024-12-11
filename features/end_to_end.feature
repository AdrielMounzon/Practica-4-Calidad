Feature: Do de full buying process
  As a customer
  I want to complete a full buying process
  So that I can buy products

  Scenario: Select items and fill in the information to complete the buy
    Given I am on the "OnLine Catalog" page
    And I click on the "Padded Socks" item on the item name column
    And the product "Padded Socks" has at least 1 unit
    And the product "Hiking Boots" has at least 1 unit
    And I press the browser's back button
    When I write "1" on the order quantity of "Padded Socks" for shopping cart
    And I write "1" on the order quantity of "Hiking Boots" for shopping cart
    And I click the "Place An Order" button for shopping cart
    Then the cart should display "1" in the quantity column and "Padded Socks" in the product description column
    And the cart should display "1" in the quantity column and "Hiking Boots" in the product description column
    And the combined product total should be "129.89"
    And the combined grand total should be "141.38"
    When I click the "Proceed With Order" button for shopping cart
    And I fill in the Bill To form with the next values:
      | Name        | Francisco           |
      | Address     | Linden Ave #445     |
      | City        | Las Vegas           |
      | State       | Nevada              |
      | Zip         | 89110               |
      | Phone       | 1234567890          |
      | E-mail      | francisco@gmail.com |
      | Credit Card | MasterCard          |
      | Card Number | 1234-5678-1234-5678 |
      | Card Date   | 11/26               |
    And I check the Same as "Bill to" option
    When I click the "Place The Order" button for billing
    Then the "OnLine Store Receipt" page should show all the information I provided
    When I click the "Return to Home Page" button for billing
    Then I should be redirected to the home page