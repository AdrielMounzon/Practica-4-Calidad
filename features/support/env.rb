begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
    require 'capybara'
    require 'capybara/dsl'
    require 'capybara/cucumber'
    require 'capybara-screenshot/cucumber'

    require_relative 'pages/home_page'
    require_relative 'pages/products_page'
    require_relative 'pages/billing_page'
    require_relative 'pages/shopping_cart_page'
    
    
    Capybara.default_driver = :selenium
    Capybara.save_path = File.join(Dir.pwd, 'reports')
    
    # Set the host the Capybara tests should be run against
    Capybara.app_host = ENV["CAPYBARA_HOST"]
    
    # Set the time (in seconds) Capybara should wait for elements to appear on the page
    Capybara.default_max_wait_time = 5
    Capybara.default_driver = :selenium
    Capybara.app_host = "https://demo.borland.com/gmopost/"
    
    class CapybaraDriverRegistrar
      # register a Selenium driver for the given browser to run on the localhost
      def self.register_selenium_driver(browser)
        Capybara.register_driver :selenium do |app|
          Capybara::Selenium::Driver.new(app, :browser => browser)
        end
      end
    
    end
    # Register various Selenium drivers
    #CapybaraDriverRegistrar.register_selenium_driver(:internet_explorer)
    #CapybaraDriverRegistrar.register_selenium_driver(:firefox)
    CapybaraDriverRegistrar.register_selenium_driver(:chrome)
    Capybara.run_server = false
    #World(Capybara)
    
    