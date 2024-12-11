# shopping_cart_steps.rb
Given('I am on the "OnLine Catalog" page') do
  @shopping_cart_page = ShoppingCartPage.new
  @shopping_cart_page.visit_page
  @billing_page = BillingPage.new
  unless @shopping_cart_page.has_content?
    fail("La página no tiene contenido")
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

When('I write {string} on the order quantity of {string} for shopping cart') do |quantity, product_name|
  @shopping_cart_page.set_order_quantity(product_name, quantity)
end

When('I click the {string} button for shopping cart') do |button_name|
  @shopping_cart_page.click_button_by_text(button_name)
end

Then('I should be on the "Place Order" page') do
  @shopping_cart_page.verify_order_page
end

Then('the cart should display {string} in the quantity column and {string} in the product description column') do |quantity, product_name|
  @shopping_cart_page.verify_cart_quantity(product_name, quantity)
end

Then('the product total should be {string}') do |product_total|
  expect(@shopping_cart_page.verify_product_total).to eq(product_total)
end

Then('the grand total should be {string}') do |grand_total|
  expect(@shopping_cart_page.verify_grand_total).to eq(grand_total)
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

Then('the product {string} has 47 units in stock') do |product_name|
  stock = @shopping_cart_page.verify_product_stock(product_name)
  expect(stock).to eq(47)
end

Then('the combined product total should be {string}') do |combined_product_total|
  expect(@shopping_cart_page.verify_combined_product_total).to eq(combined_product_total)
end

Then('the combined grand total should be {string}') do |combined_grand_total|
  expect(@shopping_cart_page.verify_combined_grand_total).to eq(combined_grand_total)
end

Then('I see the correct Sales Tax as {string}') do |sale_tax|
  expect(@shopping_cart_page.verify_sales_tax).to eq(sale_tax)
end

Then('I see the Shipping & Handling as {string}') do |expected_shipping_handling|
  actual_shipping_hadling = @shopping_cart_page.verify_shipping_and_handling
  expect(actual_shipping_hadling).to eq(expected_shipping_handling)
end