class BrowserPage < BasePage

    BROWSER_URL = 'https://demo.borland.com/gmopost/browser-test.htm'

    def current_url
      page.current_url
    end
  end
  