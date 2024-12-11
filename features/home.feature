Feature: About The GMO Site

  As a user
  I want to navigate to the "About This Site" page
  So that I can learn more about the GMO Online platform

  Background:
    Given I am on the "GMO Online" homepage


  Scenario: Navigate to "About This Site" page from the homepage
    When I click the "About The GMO Site" button in the homepage
    Then I should be redirected to the "About This Site" page
    And I should see the title "About This Site"

  Scenario: Navigate to "Browser Test Page" page from the homepage
    When I click the "Browser Test Page" button in the homepage
    Then I should be redirected to the "Browser Test Page"
    And I should see the title "All Browsers Are Not Created Equal"
