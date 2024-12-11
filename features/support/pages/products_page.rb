class ProductsPage
  include Capybara::DSL
  include RSpec::Matchers

  def visit_page
    visit("https://demo.borland.com/gmopost/products.htm")
  end
  
  def current_url
    page.current_url.split('#').first  # Esto elimina cualquier fragmento de la URL
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

  def has_content?
    page_content = page.body.strip # Obtiene el contenido HTML de la página
    !(page_content.empty? || page_content.scan(/\w+/).empty?)
  end

  def click_button_by_text(button_text)
    click_button(button_text)
  end

  def scroll_to_element(xpath)
    page.execute_script("document.evaluate(\"#{xpath}\", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView();")
  end
end
