class BillingPage < BasePage
  
    def fill_billing_form(data)
      data.each_pair do |key, value|
        case key
        when "Name"
          fill_in 'billName', with: value
        when "Address"
          fill_in 'billAddress', with: value
        when "City"
          fill_in 'billCity', with: value
        when "State"
          fill_in 'billState', with: value
        when "Zip"
          fill_in 'billZipCode', with: value
        when "Phone"
          fill_in 'billPhone', with: value
        when "E-mail"
          fill_in 'billEmail', with: value
        when "Credit Card"
          select value, from: 'CardType'
        when "Card Number"
          fill_in 'CardNumber', with: value
        when "Card Date"
          fill_in 'CardDate', with: value
        end
      end
    end
  
    def check_same_as_bill_to
      find(:xpath, '/html/body/form/table/tbody/tr[2]/td[3]/table/tbody/tr[1]/td[2]/input').set(true)
    end
  
    def verify_receipt_page
      expect(page).to have_content('Thank you for shopping with Green Mountain Outpost')
    end
  
    def verify_popup_message(expected_text)
      alert_text = page.accept_alert
      expect(alert_text).to eq(expected_text)
    end
    
    def set_order_quantity(product_name, quantity)
      input_xpath = "//table//tr//td/a/strong[contains(normalize-space(text()), '#{product_name}')]/ancestor::tr/td[4]/h1/input"
      find(:xpath, input_xpath).set(quantity)
    end
  end
  