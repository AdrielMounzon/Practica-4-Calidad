# shopping_cart_page.rb
class ShoppingCartPage < BasePage
    include Capybara::DSL
  
    def visit_catalog
      visit('https://demo.borland.com/gmopost/online-catalog.htm')
    end
  
    def select_product(product_name)
      find(:xpath, "//table//tr//td/a/strong[contains(normalize-space(text()), '#{product_name}')]").click
    end
  
    def verify_product_stock(product_name)
       stock_xpath = "//h2/a[contains(text(), '#{product_name}')]/../following-sibling::div[1]//table//tr[2]/td[2]"
       find(:xpath, stock_xpath).text.strip.to_i
    end
  
    def set_order_quantity(quantity)
        find('body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(3) > td:nth-child(4) > h1 > input[type=text]').set(quantity)
    end
  
    def click_custom_button(button_name)
      click_button(button_name)
    end
  
    def verify_order_page
        page.current_url.match('https://demo.borland.com/gmopost/cgi-bin/perl.exe?place-order.pl')
    end
  
    def verify_cart_quantity(product_name, expected_quantity)
      input_xpath = "//table//tr//td/a/strong[contains(normalize-space(text()), '#{product_name}')]"
      find(:xpath, input_xpath).text.strip
    end
  
    def verify_product_total(expected_total)
      total_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[3]/td[3]"
      find(:xpath, total_xpath).text.strip.gsub('$', '').strip
    end
  
    def verify_grand_total(expected_grand_total)
      grand_total_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[6]/td[2]/strong"
      find(:xpath, grand_total_xpath).text.strip.gsub('$', '').strip
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
        find(:xpath, xpath).value
      end
    end
  
    def verify_alert_message
        find('.alert').text.strip
    end

    def set_order_quantity(product_name, quantity)
        input_xpath = "//table//tr//td/a/strong[contains(normalize-space(text()), '#{product_name}')]/ancestor::tr/td[4]/h1/input"
        find(:xpath, input_xpath).set(quantity)
      end
  end
  