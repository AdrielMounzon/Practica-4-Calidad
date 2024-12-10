class ReceiptPage < BasePage
    RECEIPT_URL = 'https://demo.borland.com/gmopost/cgi-bin/perl.exe?confirm-order.pl'
  
    def open
      visit_page(RECEIPT_URL)
    end
  
    def maximize_window
      page.driver.browser.manage.window.maximize
    end
  end
  