# shopping_cart_steps.rb
Given('I am on the "OnLine Catalog" page') do
  @shopping_cart_page = ShoppingCartPage.new
  @shopping_cart_page.visit_catalog
end

Given('I click on the {string} item on the item name column') do |product_name|
  @shopping_cart_page.select_product(product_name)
end

Given('I am now on the "Products" page') do
  @shopping_cart_page.verify_products_page
end

Given('the product {string} has at least 1 unit') do |product_name|
  @shopping_cart_page.verify_product_stock(product_name, 1)
end

Given('I press the browser\'s back button') do
  page.go_back
end

When('I write "{string}" on the order quantity of {string}') do |quantity, product_name|
  @shopping_cart_page.set_order_quantity(product_name, quantity)
end

When('I click the {string} button') do |button_name|
  @shopping_cart_page.place_order
end

Then('I should be on the "Place Order" page') do
  @shopping_cart_page.verify_order_page
end

Then('the cart should display "{string}" in the quantity column and {string} in the product description column') do |quantity, product_name|
  @shopping_cart_page.verify_cart_quantity(product_name, quantity)
end

Then('the product total should be {string}') do |product_total|
  @shopping_cart_page.verify_product_total(product_total)
end

Then('the grand total should be {string}') do |grand_total|
  @shopping_cart_page.verify_grand_total(grand_total)
end

Then('I should see a message {string}') do |message_text|
  @shopping_cart_page.verify_alert_message(message_text)
end

Then('the order form should be cleared') do
  @shopping_cart_page.clear_order_form
end
