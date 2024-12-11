# Given I am on the "GMO Online" homepage
Given('I am on the "GMO Online" homepage for general use') do
    @home_page=HomePage.new
    @home_page.visit_page
    end
    
    # When I click the {string} button
    When('I click the {string} button in the homepage' ) do |button_name|
      # button_selectors = {
      #   "About The GMO Site" => 'body > form > div:nth-child(1) > center > table > tbody > tr > td:nth-child(2) > input[type=button]',
      #   "Browser Test Page" => 'body > form > div:nth-child(3) > center > table > tbody > tr > td > input[type=button]'
      # }
      
      # button_selector = button_selectors[button_name]
      # if button_selector.nil?
      #   raise "Button selector not found for '#{button_name}'"
      # end
      @home_page.click_button_by_text(button_name)
    end
    
    # Then I should be redirected to the {string} page
    Then('I should be redirected to the {string} page') do |page_name|
      expected_urls = {
        "About This Site" => "https://demo.borland.com/gmopost/about.htm",
        "Browser Test Page" => "https://demo.borland.com/gmopost/browser-test.htm"
      }
    
      expected_url = expected_urls[page_name]
      if expected_url.nil?
        raise "URL not found for '#{page_name}'"
      end
    
      expect(page.current_url).to eq(expected_url), "Expected to be on '#{expected_url}' but was on '#{page.current_url}'"
    end
    
    # And I should see the title {string}
    Then('I should see the title {string}') do |expected_title|
      title_xpaths = {
        "About This Site" => '/html/body/table/tbody/tr/td[1]/h1',
        "All Browsers Are Not Created Equal" => '/html/body/h1/font'
      }
      
      title_xpath = title_xpaths[expected_title]
      puts title_xpath
      if title_xpath.nil?
        raise "XPath not found for title '#{expected_title}'"
      end
    
      actual_title = find(:xpath, title_xpath).text.strip
      expect(actual_title).to eq(expected_title), "Expected title to be '#{expected_title}', but got '#{actual_title}'"
    end  