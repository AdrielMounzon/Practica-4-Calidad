# Given I am on the OnLine Store Receipt page
Given('I am on the OnLine Store Receipt page') do
  @receipt_page = ReceiptPage.new
  @receipt_page.visit_page
  unless @receipt_page.has_content?
    fail("La página no tiene contenido")
  end
end

  # When I click the "Return to Home Page" button below the Online Store Receipt
When('I click the {string} button below the Online Store Receipt') do |buttonText|
  @receipt_page.click_button_by_text(buttonText)
end
  
  # Then I should be redirected to the home page
Then('I should be redirected to the home page') do
  @home_page = HomePage.new
  expect(@home_page.current_url).to eq(Capybara.app_host)
end
  