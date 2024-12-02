Given('I am on the {string} page') do |page_name|
    visit('https://demo.borland.com/gmopost/products.htm') if page_name == "OnLine Catalog"
  end
  
  When('I click on the {string} item on the item name column') do |item_name|
    @current_product_name = item_name
    find(:xpath, "//h2/a[contains(text(), '#{item_name}')]").click
  end
  
  Then('the product {string} has at least 1 unit') do |item_name|
    stock_xpath = "//h2/a[contains(text(), '#{item_name}')]/../following-sibling::div[1]//table//tr[2]/td[2]"
    stock = find(:xpath, stock_xpath).text.strip.to_i
    expect(stock).to be >= 1
  end
  
  When('I press the browser\'s back button') do
    page.go_back
  end
  
  When('I write {string} on the order quantity of {string}') do |quantity, item_name|
    input_xpath = "//h2/a[contains(text(), '#{item_name}')]/../following-sibling::div[1]//input[@name='quantity']"
    find(:xpath, input_xpath).set(quantity)
  end
  
  When('I click the {string} button') do |button_text|
    click_button(button_text)
  end
  
  Then('the cart should display {string}') do |cart_item|
    cart_xpath = "//div[@id='cart']/ul/li[contains(text(), '#{cart_item}')]"
    expect(page).to have_selector(:xpath, cart_xpath)
  end
  
  Then('the product total should be {string}') do |product_total|
    total_xpath = "//div[@id='cart']/ul/li[contains(text(), 'Padded Socks')]/span[@class='product-total']"
    expect(find(:xpath, total_xpath).text).to eq(product_total)
  end
  
  Then('the grand total should be {string}') do |grand_total|
    grand_total_xpath = "//div[@id='cart']/div[@id='grand-total']"
    expect(find(:xpath, grand_total_xpath).text).to eq(grand_total)
  end

  Given('I am on the {string} page') do |page_name|
    visit('https://demo.borland.com/gmopost/products.htm') if page_name == 'OnLine Catalog'
  end
  
  When('I click on the {string} item on the item name column') do |product_name|
    @current_product_name = product_name
    find(:xpath, "//h2/a[contains(text(), '#{product_name}')]").click
  end
  
  Then('the product {string} has at least 1 unit') do |product_name|
    stock_xpath = "//h2/a[contains(text(), '#{product_name}')]/../following-sibling::div//tr[2]/td[2]"
    stock = find(:xpath, stock_xpath).text.strip.to_i
    expect(stock).to be >= 1
  end
  
  When('I press the browser\'s back button') do
    page.go_back
  end
  
  When('I write {string} on the order quantity of {string}') do |quantity, product_name|
    quantity_input_xpath = "//h2/a[contains(text(), '#{product_name}')]/../following-sibling::div//input[@name='quantity']"
    find(:xpath, quantity_input_xpath).set(quantity)
  end
  
  When('I click the {string} button') do |button_text|
    click_button(button_text)
  end
  
  Then('the cart should display {string}') do |cart_item|
    expect(page).to have_content(cart_item)
  end
  
  Then('the product total should be {string}') do |product_total|
    product_total_xpath = "//tr[td[contains(text(), 'Padded Socks')]]/td[@class='product-total']"
    expect(find(:xpath, product_total_xpath).text).to eq(product_total)
  end
  
  Then('the grand total should be {string}') do |grand_total|
    grand_total_xpath = "//div[@id='grand-total']"
    expect(find(:xpath, grand_total_xpath).text).to eq(grand_total)
  end
  
  When('I click the "Place An Order" button without adding any product') do
    click_button('Place An Order')
  end
  
  Then('I should see a message "Your cart is empty"') do
    expect(page).to have_content('Your cart is empty')
  end
  
  Then('the order should not be placed') do
    expect(current_path).to eq('/gmopost/products.htm') # Asegúrate de que esto sea correcto
  end
  