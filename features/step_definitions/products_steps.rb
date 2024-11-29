# Given I am on the Products page
  Given('I am on the Products page') do
    visit('https://demo.borland.com/gmopost/products.htm')
  end
  
  # When I scroll to the "Padded Socks" section
  When('I scroll to the "Padded Socks" section') do
    page.execute_script("document.querySelector('body > h2:nth-child(33) > a').scrollIntoView();")
  end
  
  
  # Then the product name should be shown
  Then('the product name should be shown') do
    element = find('body > h2:nth-child(33) > a')
    expect(element).to be_visible
  end
  
  # And the slogan should be shown
  Then('the slogan should be shown') do
    expect(page).to have_selector('body > p:nth-child(34) > font > em')
  end
  
  # And an image should be shown
  Then('an image should be shown') do
    expect(page).to have_selector('body > div:nth-child(35) > table > tbody > tr:nth-child(1) > td:nth-child(1) > img')
  end
  
  # And "Unit Price" should be greater than 0
  Then('"Unit Price" should be greater than 0') do
    unit_price = find('body > div:nth-child(35) > table > tbody > tr:nth-child(1) > td:nth-child(3)').text.strip
    unit_price = unit_price.gsub('$', '').to_f
    expect(unit_price).to be > 0
  end
  
  # And "# In Stock" should be equal or greater than 0
  Then('"# In Stock" should be equal or greater than 0') do
    stock = find('body > div:nth-child(35) > table > tbody > tr:nth-child(2) > td:nth-child(2)').text
    expect(stock.to_i).to be >= 0
  end
  
  # And "Item Number" should be equal or greater than 0
  Then('"Item Number" should be equal or greater than 0') do
    item_number = find('body > div:nth-child(35) > table > tbody > tr:nth-child(3) > td:nth-child(2)').text
    expect(item_number.to_i).to be >= 0
  end
  
  # And the description below the image should be shown
  Then('the description below the image should be shown') do
    expect(page).to have_selector('body > p:nth-child(36)')
  end
  