# Given I am on the "GMO Online" homepage
Given('I am on the "GMO Online" homepage') do
  @billing_page = BillingPage.new
  @billing_page.visit_page
  unless @billing_page.has_content?
    fail("La página no tiene contenido")
  end
end

# And I fill in the Bill To form with the next values:
When('I fill in the Bill To form with the next values:') do |table|
  data = table.rows_hash
  @billing_page.fill_billing_form(data)
end

When('I click the {string} button for billing') do |button_name|
  @billing_page.click_button_by_text(button_name)
end

# And I check the Same as "Bill to" option
When('I check the Same as "Bill to" option') do
  @billing_page.check_same_as_bill_to
end

# Then the "OnLine Store Receipt" page should show all the information I provided
Then('the "OnLine Store Receipt" page should show all the information I provided') do
  @billing_page.verify_receipt_page
end

When('I write {string} on the order quantity of {string} for billing') do |quantity, product_name|
  @billing_page.set_order_quantity(product_name, quantity)
end

# Then a popup window should be displayed with the text "This is a required field."
Then('a popup window should be displayed with the text {string}') do |expected_text|
  @billing_page.verify_popup_message(expected_text)
end