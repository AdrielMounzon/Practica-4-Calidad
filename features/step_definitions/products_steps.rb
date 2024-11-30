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

# Then the product name should be shown
Then('the product name should be shown') do
  expect(page).to have_selector(:xpath, product_base_xpath)
end

# And the slogan should be shown
Then('the slogan should be shown') do
  slogan_xpath = "#{product_base_xpath}/../following-sibling::p/font/em"
  expect(page).to have_selector(:xpath, slogan_xpath)
end

# And an image should be shown
Then('an image should be shown') do
  image_xpath = "#{product_base_xpath}/../following-sibling::div[1]//table//tr[1]/td[1]/img"
  expect(page).to have_selector(:xpath, image_xpath)
end

# And "Unit Price" should be greater than 0
Then('"Unit Price" should be greater than 0') do
  unit_price_xpath = "#{product_base_xpath}/../following-sibling::div[1]//table//tr[1]/td[3]"
  unit_price = find(:xpath, unit_price_xpath).text.strip
  unit_price = unit_price.gsub('$', '').to_f
  expect(unit_price).to be > 0
end

# And "# In Stock" should be equal or greater than 0
Then('"# In Stock" should be equal or greater than 0') do
  stock_xpath = "#{product_base_xpath}/../following-sibling::div[1]//table//tr[2]/td[2]"
  stock = find(:xpath, stock_xpath).text.strip
  expect(stock.to_i).to be >= 0
end

# And "Item Number" should be equal or greater than 0
Then('"Item Number" should be equal or greater than 0') do
  item_number_xpath = "#{product_base_xpath}/../following-sibling::div[1]//table//tr[3]/td[2]"
  item_number = find(:xpath, item_number_xpath).text.strip
  expect(item_number.to_i).to be >= 0
end

# And the description below the image should be shown
Then('the description below the image should be shown') do
  description_xpath = "#{product_base_xpath}/../following-sibling::div[1]/following-sibling::p"
  expect(page).to have_selector(:xpath, description_xpath)
end
