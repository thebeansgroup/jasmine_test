require 'jasmine_selenium_runner/configure_jasmine'

class BrowserstackJasmineSeleniumRunner < JasmineSeleniumRunner::ConfigureJasmine

  def remote_webdriver(server_url) 
    options = selenium_options

    Selenium::WebDriver.for :remote, :url => server_url, :desired_capabilities => options
  end


  def selenium_options
    options = super
    options['tunnel_identifier'] = "test"

    options
  end
end
