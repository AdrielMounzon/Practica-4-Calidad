# features/step_definitions/products_steps.rb

# Given I am on the Products page
Given('I am on the Products page') do
  @products_page = ProductsPage.new
  @products_page.open
end

# When I scroll to the "<product_name>" section
When('I scroll to the {string} section') do |product_name|
  @products_page.set_product(product_name)
  @products_page.scroll_to_product
end

# Then the product name should be "<product_name>"
Then('the product name should be {string}') do |expected_product_name|
  actual_product_name = @products_page.product_name
  expect(actual_product_name).to eq(expected_product_name)
end

# And the marketing text should be "<marketing_text>"
Then('the marketing text should be {string}') do |expected_marketing_text|
  actual_marketing_text = @products_page.marketing_text
  expect(actual_marketing_text).to eq(expected_marketing_text)
end

# And an image of the product should be shown
Then('an image of the product should be shown') do
  expect(@products_page.product_image_shown?).to be true
end

# And "Unit Price" should be "<unit_price>"
Then('"Unit Price" should be {string}') do |expected_unit_price|
  actual_unit_price = @products_page.unit_price
  expect(actual_unit_price).to eq(expected_unit_price.to_f)
end

# And "# In Stock" should be "<in_stock>"
Then('"# In Stock" should be {string}') do |expected_in_stock|
  actual_stock = @products_page.stock
  expect(actual_stock).to eq(expected_in_stock.to_i)
end

# And "Item Number" should be "<item_number>"
Then('"Item Number" should be {string}') do |expected_item_number|
  actual_item_number = @products_page.item_number
  expect(actual_item_number).to eq(expected_item_number.to_i)
end

# And the description below the image should be "<description>"
Then('the description below the image should be {string}') do |expected_description|
  actual_description = @products_page.description
  expect(actual_description).to eq(expected_description)
end
