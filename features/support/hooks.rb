Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

Before do
  page.driver.browser.manage.delete_all_cookies
  Capybara.default_max_wait_time = 5 #segundos
end

After do |scenario|
  if scenario.failed?
    timestamp = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
    page.save_screenshot("screenshots/failure_#{timestamp}.png")
  end
end

After do 
    Capybara.current_session.driver.quit
end