# shopping_cart_steps.rb
Given('I am on the "OnLine Catalog" page') do
  @shopping_cart_page = ShoppingCartPage.new
  @shopping_cart_page.visit_catalog
end

Given('I click on the {string} item on the item name column') do |product_name|
  @shopping_cart_page.select_product(product_name)
end

Given('I am now on the "Products" page') do
  @products_page = ProductsPage.new
  expect(@products_page.current_url).to eq(ProductsPage::PRODUCTS_URL)
end

Given('the product {string} has at least 1 unit') do |product_name|
  shopping_cart_page = ShoppingCartPage.new
  stock = shopping_cart_page.verify_product_stock(product_name)
  expect(stock).to be >= 1
end

Given('I press the browser\'s back button') do
  page.execute_script('window.history.back()')
end

When('I write "{string}" on the order quantity') do |quantity|
  @shopping_cart_page.set_order_quantity_with_css(quantity)
end

When('I click the {string} button in the shopping cart') do |button_name|
  @shopping_cart_page.click_custom_button(button_name)
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

Then('I should see a message {string}') do |expected_message|
  alert = page.driver.browser.switch_to.alert
  alert_text = alert.text
  expect(alert_text).to eq(expected_message)
  alert.accept
end

Then('the order form should be cleared') do
  @shopping_cart_page.clear_order_form
end
