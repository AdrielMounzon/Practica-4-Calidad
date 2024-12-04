# Define un método para obtener el XPath base del producto actual
def product_base_xpath
  "//h2/a[contains(text(), '#{@current_product_name}')]"
end

# Given I am on the Products page
Given('I am on the Products page') do
  visit('https://demo.borland.com/gmopost/products.htm')
end

# When I scroll to the "<product_name>" section
When('I scroll to the {string} section') do |product_name|
  @current_product_name = product_name
  page.execute_script("document.evaluate(\"#{product_base_xpath}\", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView();")
end

# Then the product name should be "<product_name>"
Then('the product name should be {string}') do |expected_product_name|
  actual_product_name = find(:xpath, product_base_xpath).text.strip
  expect(actual_product_name).to eq(expected_product_name)
end

# And the marketing text should be "<marketing_text>"
Then('the marketing text should be {string}') do |expected_marketing_text|
  slogan_xpath = "#{product_base_xpath}/../following-sibling::p[1]/font/em"
  actual_marketing_text = find(:xpath, slogan_xpath).text.strip
  expect(actual_marketing_text).to eq(expected_marketing_text)
end

# And an image should be shown
Then('an image should be shown') do
  image_xpath = "#{product_base_xpath}/../following-sibling::div[1]//table//tr[1]/td[1]/img"
  expect(page).to have_selector(:xpath, image_xpath)
end

# And "Unit Price" should be "<unit_price>"
Then('"Unit Price" should be {string}') do |expected_unit_price|
  unit_price_xpath = "#{product_base_xpath}/../following-sibling::div[1]//table//tr[1]/td[3]"
  actual_unit_price = find(:xpath, unit_price_xpath).text.strip.gsub('$', '').to_f
  expect(actual_unit_price).to eq(expected_unit_price.to_f)
end

# And "# In Stock" should be "<in_stock>"
Then('"# In Stock" should be {string}') do |expected_in_stock|
  stock_xpath = "#{product_base_xpath}/../following-sibling::div[1]//table//tr[2]/td[2]"
  actual_stock = find(:xpath, stock_xpath).text.strip.to_i
  expect(actual_stock).to eq(expected_in_stock.to_i)
end

# And "Item Number" should be "<item_number>"
Then('"Item Number" should be {string}') do |expected_item_number|
  item_number_xpath = "#{product_base_xpath}/../following-sibling::div[1]//table//tr[3]/td[2]"
  actual_item_number = find(:xpath, item_number_xpath).text.strip.to_i
  expect(actual_item_number).to eq(expected_item_number.to_i)
end

# And the description below the image should be "<description>"
Then('the description below the image should be {string}') do |expected_description|
  description_xpath = "#{product_base_xpath}/../following-sibling::div[1]/following-sibling::p[1]"
  actual_description = find(:xpath, description_xpath).text.strip
  expect(actual_description).to eq(expected_description)
end
