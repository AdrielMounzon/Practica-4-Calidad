Feature: Fill in personal information
  As a customer
  I want to provide my information
  So that I can pay and recieve my order

Background:
    Given I am on the "GMO Online" homepage
    And I click the "Enter GMO OnLine" button
    And I write "1" on the order quantity of "3 Person Dome Tent"
    And I write "3" on the order quantity of "Hiking Boots"
    And I click the "Place An Order" button
    And I click the "Proceed With Order" button

  @maximize
  Scenario: Fill out Bill To information correctly
    And I fill in the Bill To form with the following values:
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
    When I click the "Place The Order" button
    Then the "OnLine Store Receipt" page should show all the information I provided

  @maximize
  Scenario: Leave a required field empty
    And I fill in the Bill To form with the following values:
      | Name        | Francisco           |
      | Address     | Linden Ave #445     |
      | City        |                     |
      | State       | Nevada              |
      | Zip         | 89110               |
      | Phone       | 1234567890          |
      | E-mail      | francisco@gmail.com |
      | Credit Card | MasterCard          |
      | Card Number | 1234-5678-1234-5678 |
      | Card Date   | 11/26               |
    And I check the Same as "Bill to" option
    When I click the "Place The Order" button
    Then a popup window should be displayed with the text "This is a required field."

  @maximize
  Scenario: Enter a non valid zip code
    And I fill in the Bill To form with the following values:
      | Name        | Francisco           |
      | Address     | Linden Ave #445     |
      | City        | Las Vegas           |
      | State       | Nevada              |
      | Zip         | 666                 |
      | Phone       | 1234567890          |
      | E-mail      | francisco@gmail.com |
      | Credit Card | MasterCard          |
      | Card Number | 1234-5678-1234-5678 |
      | Card Date   | 11/26               |
    And I check the Same as "Bill to" option
    When I click the "Place The Order" button
    Then a popup window should be displayed with the text "Please enter a valid zip code in this field."

  @maximize
  Scenario: Enter a non valid phone number
    And I fill in the Bill To form with the following values:
      | Name        | Francisco           |
      | Address     | Linden Ave #445     |
      | City        | Las Vegas           |
      | State       | Nevada              |
      | Zip         | 89110               |
      | Phone       | +565432113          |
      | E-mail      | francisco@gmail.com |
      | Credit Card | MasterCard          |
      | Card Number | 1234-5678-1234-5678 |
      | Card Date   | 11/26               |
    And I check the Same as "Bill to" option
    When I click the "Place The Order" button
    Then a popup window should be displayed with the text "Please enter a valid phone number in this field."

  @maximize
  Scenario Outline: Enter a non valid credit card number
    And I fill in the Bill To form with the following values:
      | Name        | Francisco           |
      | Address     | Linden Ave #445     |
      | City        | Las Vegas           |
      | State       | Nevada              |
      | Zip         | 89110               |
      | Phone       | 1234567890          |
      | E-mail      | francisco@gmail.com |
      | Credit Card | <card_provider>     |
      | Card Number | <card_number>       |
      | Card Date   | 11/26               |
    And I check the Same as "Bill to" option
    When I click the "Place The Order" button
    Then a popup window should be displayed with the text "Please enter a valid card number of the form <correct_format> in this field."

Examples:
  | card_provider    | card_number         | correct_format        |
  | American Express | 1234-1234-1234-1234 | '1234-123456-12345'   |
  | MasterCard       | 1234-123456-12345   | '1234-1234-1234-1234' |
  | Visa             | 1234-123456-12345   | '1234-1234-1234-1234' |

  @maximize
  Scenario: Enter an expirated credit card
    And I fill in the Bill To form with the following values:
      | Name        | Francisco           |
      | Address     | Linden Ave #445     |
      | City        | Las Vegas           |
      | State       | Nevada              |
      | Zip         | 89110               |
      | Phone       | 1234567890          |
      | E-mail      | francisco@gmail.com |
      | Credit Card | MasterCard          |
      | Card Number | 1234-5678-1234-5678 |
      | Card Date   | 01/20               |
    And I check the Same as "Bill to" option
    When I click the "Place The Order" button
    Then a popup window should be displayed with the text "Please enter a valid date of the form 'MM/YY' in this field."
