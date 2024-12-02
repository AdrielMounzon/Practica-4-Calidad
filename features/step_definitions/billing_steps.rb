# Given I am on the "Billing Information" page
Given('I am on the "Billing Information" page') do
    visit('https://demo.borland.com/gmopost/cgi-bin/perl.exe?ship-info.pl')
  end

# And I fill in the Bill To form with the following values:
When('I fill in the Bill To form with the following values:') do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
    case key
    when "Name"
        fill_in 'billName', :with => value
        @billName = value
    when "Address"
        fill_in 'billAddress', :with => value
        @billAddress = value
    when "City"
        fill_in 'billCity', :with => value
        @billCity = value
    when "State"
        fill_in 'billState', :with => value
        @billState = value
    when "Zip"
        fill_in 'billZipCode', :with => value
        @billZipCode = value
    when "Phone"
        fill_in 'billPhone', :with => value
        @billPhone = value
    when "E-mail"
        fill_in 'billEmail', :with => value
        @billEmail = value
    when "Credit Card"
        select value, from: 'CardType'
        @CardType = value
    when "Card Number"
        fill_in 'CardNumber', :with => value
        @CardNumber = value
    when "Card Date"
        fill_in 'CardDate', :with => value
        @CardDate = value
    end
    end
end

# And I check the Same as "Bill to" option
When('I check the Same as "Bill to" option') do
    find(:xpath, '/html/body/form/table/tbody/tr[2]/td[3]/table/tbody/tr[1]/td[2]/input').set(true)
end

# Then the "OnLine Store Receipt" page should show all the information I provided
Then('the "OnLine Store Receipt" page should show all the information I provided') do
    expect(page).to have_content('Thank you for shopping with Green Mountain Outpost')
  end

# Then a popup window should be displayed with the text "This is a required field."
Then('a popup window should be displayed with the text {string}') do |expected_text|
    alert_text = page.accept_alert
    expect(alert_text).to eq(expected_text)
  end