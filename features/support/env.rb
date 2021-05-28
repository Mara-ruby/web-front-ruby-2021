require 'rspec'
require 'capybara'
require 'site_prism'
require 'cucumber'
require 'selenium-webdriver'

Capybara.register_driver :site_prism do |app|
    Capybara::Selenium::Driver.new(app, browser::remoto, :url =>'http://localhost:4444/wd/hub',:desired_capatilities => : chrome)
end

Capybara.configure do |config|
    config.run_server = false
    Capybara.default_driver = :site_prism
    Capybara.page.driver.browser.manage.window.maximize
    config.default_max_waite_time = 10
    config.app_host = 'http://automationpractice.com/index.php'
end
