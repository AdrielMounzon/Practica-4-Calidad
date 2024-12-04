# Given I am on the "OnLine Catalog" page
Given('I am on the "OnLine Catalog" page') do
  visit('https://demo.borland.com/gmopost/online-catalog.htm')
end

# And I click on the "<product_name>" item on the item name column
Given('I click on the {string} item on the item name column') do |product_name|
  find(:xpath, "//table//tr//td/a/strong[contains(normalize-space(text()), '#{product_name}')]").click
end

# And I am now on the "Products" page
Given('I am now on the "Products" page') do
  expect(page.current_url).to match(/https:\/\/demo\.borland\.com\/gmopost\/products\.htm/)
end

# And the product "<product_name>" has at least 1 unit
Given('the product {string} has at least 1 unit') do |product_name|
  stock_xpath = "//h2/a[contains(text(), '#{product_name}')]/../following-sibling::div[1]//table//tr[2]/td[2]"
  stock = find(:xpath, stock_xpath).text.strip.to_i
  expect(stock).to be >= 1
end

# And I press the browser's back button
Given('I press the browser\'s back button') do
  page.go_back
end

# When I write "1" on the order quantity of "<product_name>"
When('I write "1" on the order quantity of {string}') do |product_name|
  input_xpath = "//table//tr//td/a/strong[contains(normalize-space(text()), '#{product_name}')]/ancestor::tr/td[4]/h1/input"
  find(:xpath, input_xpath).set(1)
end

# And I click the "Place An Order" button
When('I click the {string} button') do |button_name|
  click_button(button_name)
end

# Then I should be on the "Place Order" page
Then('I should be on the "Place Order" page') do
  expect(page.current_url).to match('https://demo.borland.com/gmopost/cgi-bin/perl.exe?place-order.pl')
end

# And the cart should display "1" in the quantity column and "<product_name>" in the product description column
Then('the cart should display "1" in the quantity column and {string} in the product description column') do |product_name|
  input_xpath = "//table//tr//td/a/strong[contains(normalize-space(text()), '#{product_name}')]"
  actual_product_name = find(:xpath, input_xpath).text.strip
  expect(actual_product_name).to eq(product_name)
end

# And the product total should be "<product_total>"
Then('the product total should be {string}') do |product_total|
  total_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[3]/td[3]"
  expect(find(:xpath, total_xpath).text.strip.gsub('$', '').strip).to eq(product_total)
end

# And the grand total should be "<grand_total>"
Then('the grand total should be {string}') do |grand_total|
  grand_total_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[6]/td[2]/strong"
  expect(find(:xpath, grand_total_xpath).text.strip.gsub('$', '').strip).to eq(grand_total)
end

# Then I should see a message "Please Order Something First"
Then('I should see a message {string}') do |message_text|
  expect(page.driver.browser.switch_to.alert.text).to eq(message_text)
end

# Then the order form should be cleared
Then('the order form should be cleared') do
  input_xpaths = [
    "/html/body/form/table/tbody/tr[2]/td/div/center/table/tbody/tr[2]/td[4]/h1/input",
    "/html/body/form/table/tbody/tr[2]/td/div/center/table/tbody/tr[3]/td[4]/h1/input",
    "/html/body/form/table/tbody/tr[2]/td/div/center/table/tbody/tr[4]/td[4]/h1/input",
    "/html/body/form/table/tbody/tr[2]/td/div/center/table/tbody/tr[5]/td[4]/h1/input",
    "/html/body/form/table/tbody/tr[2]/td/div/center/table/tbody/tr[6]/td[4]/h1/input",
    "/html/body/form/table/tbody/tr[2]/td/div/center/table/tbody/tr[7]/td[4]/h1/input"
  ]

  input_xpaths.each do |xpath|
    actual_value = find(:xpath, xpath).value
    expect(actual_value).to eq('0'), "Expected input at #{xpath} to be '0', but got '#{actual_value}'"
  end
end

# And the product "Padded Socks" has 47 units in stock
Given('the product {string} has 47 units in stock') do |product_name|
  stock_xpath = "//h2/a[contains(text(), '#{product_name}')]/../following-sibling::div[1]//table//tr[2]/td[2]"
  stock = find(:xpath, stock_xpath).text.strip.to_i
  expect(stock).to eq(47)
end

# And I am now on the "OnLine Catalog" page
When ('I am now on the "OnLine Catalog" page') do
  expect(page.current_url).to match('https://demo.borland.com/gmopost/online-catalog.htm')
end

# And I write "50" on the order quantity of "Padded Socks"
When('I write "50" on the order quantity of "Padded Socks"') do
  input_xpath = "//table//tr//td/a/strong[contains(normalize-space(text()), 'Padded Socks')]/ancestor::tr/td[4]/h1/input"
  find(:xpath, input_xpath).set(50)
end

# And the combined product total should be "129.89"
Then('the combined product total should be {string}') do |product_total|
  total_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[4]/td[3]"
  expect(find(:xpath, total_xpath).text.strip.gsub('$', '').strip).to eq(product_total)
end

# And the combined grand total should be "141.38"
Then('the combined grand total should be {string}') do |grand_total|
  grand_total_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[7]/td[2]/strong"
  expect(find(:xpath, grand_total_xpath).text.strip.gsub('$', '').strip).to eq(grand_total)
end