  Given('I am on the {string} page') do |page_name|
    visit('https://demo.borland.com/gmopost/online-catalog.htm') if page_name == "OnLine Catalog"
  end
  
  When('I click on the {string} item on the item name column') do |item_name|
    @current_product_name = item_name
    find(:xpath, "//form//a/strong[contains(text(), '#{item_name}')]").click
  end
  
  Then('the product {string} has at least 1 unit') do |item_name|
    stock_xpath = "//h2/a[contains(text(), '#{item_name}')]/../../following-sibling::table/tbody/tr[2]/td[2]"
    stock = find(:xpath, stock_xpath).text.strip.to_i
    expect(stock).to be >= 1
  end
  
  When('I press the browser\'s back button') do
    page.go_back
  end
  
  When('I write {string} on the order quantity of {string}') do |quantity, item_name|
    input_xpath = "//a/strong[contains(text(), '#{item_name}')]/../../following-sibling::h1/input[@name='QTY_SOCKS']"
    find(:xpath, input_xpath).set(quantity)
  end
  
  When('I click the {string} button') do |button_text|
    click_button(button_text)
  end
  
  Then('the cart should display {string} in the quantity column and {string} in the product description column') do |quantity, product_name|
    quantity_xpath = "//td[contains(text(), '#{quantity}')]"
    product_name_xpath = "//td/a/strong[contains(text(), '#{product_name}')]"
    
    # Verificar que ambos elementos estén presentes en el carrito
    expect(page).to have_selector(:xpath, quantity_xpath)
    expect(page).to have_selector(:xpath, product_name_xpath)
  end
  
  
  Then('the product total should be {string}') do |product_total|
    total_xpath = "//td[contains(text(), '#{product_total}')]"
    expect(find(:xpath, total_xpath).text).to eq(product_total)
  end
  
  Then('the grand total should be {string}') do |grand_total|
    grand_total_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[6]/td[2]/strong"
    expect(find(:xpath, grand_total_xpath).text).to eq(grand_total)
  end
  
  Given('I am on the {string} page') do |page_name|
    visit('https://demo.borland.com/gmopost/online-catalog.htm') if page_name == "OnLine Catalog"
  end
  
  When('I click the "Place An Order" button without adding any product') do
    # Simula el clic en el botón "Place An Order" sin agregar productos al carrito
    click_button('Place An Order')
  end
  
  Then('I should see a message "Please Order Something First"') do
    # Verifica que aparezca el mensaje "Please Order Something First"
    expect(page).to have_content('Please Order Something First')
  end
  
