# Given I am on the OnLine Store Receipt page
Given('I am on the OnLine Store Receipt page') do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/cgi-bin/perl.exe?confirm-order.pl')
  end
  
  # When I click the "Return to Home Page" button
  When('I click the {string} button') do |buttonText|
    click_button(buttonText)
  end
  
  # Then I should be redirected to the home page
  Then('I should be redirected to the home page') do
    expect(page.current_url).to eq(Capybara.app_host)
  end
  