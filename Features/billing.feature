Feature: Fill in personal information
  As a customer
  I want to provide my information
  So that I can pay and recieve my order

  Scenario: Fill in all fields with correct data
    Given I am on the "Billing Information" page
    And I fill in the "<field name>" with "<field value>"
    And I check the Same as "Bill to" option
    When I click the "Place The Order" button
    Then the "OnLine Store Receipt" page should show all the information I provided

    | field name  | field value         |
    | Name        | Francisco           |
    | Address     | Linden Ave #445     |
    | City        | Las Vegas           |
    | State       | Nevada              |
    | Zip         | 89110               |
    | Phone       | 1234567890          |
    | E-mail      | francisco@gmail.com |
    | Credit Card | MasterCard          |
    | Card Number | 1234-5678-1234-5678 |
    | Expiration  | 10/26               |

  Scenario Outline: Leave a required field empty
  Scenario: Enter a non valid zip code
  Scenario: Enter a non valid phone number
  Scenario Outline: Enter a non valid credit card number
  Scenario: Enter an expirated credit card