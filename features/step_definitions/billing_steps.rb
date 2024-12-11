# Given I am on the "Billing Information" page
Given('I am on the "Billing Information" page') do
    @billing_page = BillingPage.new
    @billing_page.visit_billing_page
  end

# And I fill in the Bill To form with the following values:
When('I fill in the Bill To form with the following values:') do |table|
    data = table.rows_hash
    @billing_page.fill_billing_form(data)
  end

# When I click the "Place The Order" button
When('I click the {string} button on the billing page') do |buttonText|
    @billing_page.click_button_by_text(buttonText)
  end

# And I check the Same as "Bill to" option
When('I check the Same as "Bill to" option') do
    @billing_page.check_same_as_bill_to
  end

# Then the "OnLine Store Receipt" page should show all the information I provided
Then('the "OnLine Store Receipt" page should show all the information I provided') do
    @billing_page.verify_receipt_page
  end
  

# Then a popup window should be displayed with the text "This is a required field."
Then('a popup window should be displayed with the text {string}') do |expected_text|
    @billing_page.verify_popup_message(expected_text)
  end