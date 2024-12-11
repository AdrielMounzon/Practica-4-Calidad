class HomePage
  include Capybara::DSL
  include RSpec::Matchers
    def current_url
      "https://demo.borland.com/gmopost/"
    end

    def visit_page(url)
      visit(url)
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
  