class BasePage
    include Capybara::DSL
  
    def visit_page(url)
      visit(url)
    end
  
    def click_button_by_text(button_text)
      click_button(button_text)
    end

    def scroll_to_element(xpath)
      page.execute_script("document.evaluate(\"#{xpath}\", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView();")
    end
  end
  