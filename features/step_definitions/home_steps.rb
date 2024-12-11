# Given I am on the "GMO Online" homepage
Given('I am on the "GMO Online" homepage') do
  @home_page=HomePage.new
  @home_page.visit_page('https://demo.borland.com/gmopost/')
  end
  
  # When I click the {string} button
  When('I click the {string} button in the homepage' ) do |button_name|
    @home_page.click_button_by_text(button_name)
  end
  
  # Then I should be redirected to the "About This Page" page
  Then('I should be redirected to the "About This Site" page') do
    @about_page = AboutPage.new
    expect(@about_page.current_url).to eq(AboutPage::ABOUT_URL)
  end

   # Then I should be redirected to the "Broser Test Page" page
  Then('I should be redirected to the "Browser Test Page"') do
    @browser_page = AboutPage.new
    expect(@browser_page.current_url).to eq(BrowserPage::BROWSER_URL)
  end
  
  # And I should see the title {string}
  Then('I should see the title {string}') do |expected_title|
    title_xpaths = {
      "About This Site" => '/html/body/table/tbody/tr/td[1]/h1',
      "All Browsers Are Not Created Equal" => '/html/body/h1/font'
    }
    
    title_xpath = title_xpaths[expected_title]
    if title_xpath.nil?
      raise "XPath not found for title '#{expected_title}'"
    end
  
    actual_title = find(:xpath, title_xpath).text.strip
    expect(actual_title).to eq(expected_title), "Expected title to be '#{expected_title}', but got '#{actual_title}'"
  end
  