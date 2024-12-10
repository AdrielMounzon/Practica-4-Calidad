class BasePage
    include Capybara::DSL
  
    def visit_page(url)
      visit(url)
    end
  
    def click_button_by_text(button_text)
      click_button(button_text)
    end
  end
  