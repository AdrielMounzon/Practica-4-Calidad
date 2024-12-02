Feature: Fill in personal information
  As a customer
  I want to provide my information
  So that I can pay and recieve my order

  @maximize
  Scenario: Fill out Bill To information correctly
    Given I am on the "Billing Information" page
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

  Scenario: Leave a required field empty
    Given I am on the "Billing Information" page
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

  Scenario: Enter a non valid zip code
    Given I am on the "Billing Information" page
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

  Scenario: Enter a non valid phone number
    Given I am on the "Billing Information" page
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

  Scenario: Enter a non valid credit card number
    Given I am on the "Billing Information" page
    And I fill in the Bill To form with the following values:
      | Name        | Francisco           |
      | Address     | Linden Ave #445     |
      | City        | Las Vegas           |
      | State       | Nevada              |
      | Zip         | 89110               |
      | Phone       | 1234567890          |
      | E-mail      | francisco@gmail.com |
      | Credit Card | American Express    |
      | Card Number | 1234-5678-1234-5678 |
      | Card Date   | 11/26               |
    And I check the Same as "Bill to" option
    When I click the "Place The Order" button
    Then a popup window should be displayed with the text "Please enter a valid card number of the form '1234-123456-12345' in this field."

  Scenario: Enter an expirated credit card
    Given I am on the "Billing Information" page
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
