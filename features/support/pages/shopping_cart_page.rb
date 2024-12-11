# shopping_cart_page.rb
class ShoppingCartPage
    include Capybara::DSL
  
    def visit_catalog
      visit('https://demo.borland.com/gmopost/online-catalog.htm')
    end
  
    def select_product(product_name)
      find(:xpath, "//table//tr//td/a/strong[contains(normalize-space(text()), '#{product_name}')]").click
    end
  
    def verify_products_page()expect
        expect(page).to have_current_path('/products')
    end
  
    def verify_product_stock(product_name, min_stock = 1)
      stock_xpath = "//h2/a[contains(text(), '#{product_name}')]/../following-sibling::div[1]//table//tr[2]/td[2]"
      stock = find(:xpath, stock_xpath).text.strip.to_i
      expect(stock).to be >= min_stock
    end
  
    def set_order_quantity(product_name, quantity)
      input_xpath = "//table//tr//td/a/strong[contains(normalize-space(text()), '#{product_name}')]/ancestor::tr/td[4]/h1/input"
      find(:xpath, input_xpath).set(quantity)
    end
  
    def place_order
      click_button('Place An Order')
    end
  
    def verify_order_page
      expect(page.current_url).to match('https://demo.borland.com/gmopost/cgi-bin/perl.exe?place-order.pl')
    end
  
    def verify_cart_quantity(product_name, expected_quantity)
      input_xpath = "//table//tr//td/a/strong[contains(normalize-space(text()), '#{product_name}')]"
      actual_product_name = find(:xpath, input_xpath).text.strip
      expect(actual_product_name).to eq(product_name)
    end
  
    def verify_product_total(expected_total)
      total_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[3]/td[3]"
      actual_total = find(:xpath, total_xpath).text.strip.gsub('$', '').strip
      expect(actual_total).to eq(expected_total)
    end
  
    def verify_grand_total(expected_grand_total)
      grand_total_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[6]/td[2]/strong"
      actual_grand_total = find(:xpath, grand_total_xpath).text.strip.gsub('$', '').strip
      expect(actual_grand_total).to eq(expected_grand_total)
    end
  
    def clear_order_form
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
  
    def verify_alert_message(expected_message)
      expect(page.driver.browser.switch_to.alert.text).to eq(expected_message)
    end
  end
  