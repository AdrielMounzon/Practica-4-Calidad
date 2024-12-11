# features/support/pages/products_page.rb

class ProductsPage < BasePage
  PRODUCTS_URL = 'https://demo.borland.com/gmopost/products.htm'

  def open
    visit_page(PRODUCTS_URL)
  end

  def set_product(product_name)
    @product = product_name
  end

  def product_base_xpath()
    "//h2/a[contains(text(), '#{@product}')]"
  end

  def scroll_to_product
    xpath = product_base_xpath
    scroll_to_element(xpath)
  end

  def product_name
    find(:xpath, product_base_xpath).text.strip
  end

  def marketing_text
    xpath = "#{product_base_xpath}/../following-sibling::p[1]/font/em"
    puts xpath
    find(:xpath, xpath).text.strip
  end

  def product_image_shown?
    xpath = "#{product_base_xpath}/../following-sibling::div[1]//table//tr[1]/td[1]/img"
    has_selector?(:xpath, xpath)
  end

  def unit_price
    xpath = "#{product_base_xpath}/../following-sibling::div[1]//table//tr[1]/td[3]"
    find(:xpath, xpath).text.strip.gsub('$', '').to_f
  end

  def stock
    xpath = "#{product_base_xpath}/../following-sibling::div[1]//table//tr[2]/td[2]"
    find(:xpath, xpath).text.strip.to_i
  end

  def item_number
    xpath = "#{product_base_xpath}/../following-sibling::div[1]//table//tr[3]/td[2]"
    find(:xpath, xpath).text.strip.to_i
  end

  def description
    xpath = "#{product_base_xpath}/../following-sibling::div[1]/following-sibling::p[1]"
    find(:xpath, xpath).text.strip
  end
end
