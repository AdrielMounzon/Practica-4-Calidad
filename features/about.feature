Feature: About The GMO Site

  As a user
  I want to navigate to the "About This Site" page
  So that I can learn more about the GMO Online platform

  Scenario: Navigate to "About This Site" page from the homepage
    Given I am on the "GMO Online" homepage
    When I click the "About The GMO Site" button
    Then I should be redirected to the "About This Site" page
    And I should see the title "About This Site"
