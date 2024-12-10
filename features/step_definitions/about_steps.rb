# Given I am on the "GMO Online" homepage
Given('I am on the "GMO Online" homepage') do
    visit('https://demo.borland.com/gmopost/')
  end
  
  # When I click the "About The GMO Site" button
  When('I click the {string} button') do |button_name|
    about_button_selector = 'body > form > div:nth-child(1) > center > table > tbody > tr > td:nth-child(2) > input[type=button]'
    find(:css, about_button_selector).click
  end
  
  # Then I should be redirected to the "About This Site" page
  Then('I should be redirected to the {string} page') do |page_name|
    expected_url = "https://demo.borland.com/gmopost/about.htm"
    expect(page.current_url).to eq(expected_url), "Expected to be on '#{expected_url}' but was on '#{page.current_url}'"
  end
  
  # And I should see the title "About This Site"
  Then('I should see the title {string}') do |expected_title|
    title_xpath = '/html/body/table/tbody/tr/td[1]/h1'
    actual_title = find(:xpath, title_xpath).text.strip
    expect(actual_title).to eq(expected_title), "Expected title to be '#{expected_title}', but got '#{actual_title}'"
  end
  