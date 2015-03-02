require 'jasmine_selenium_runner/configure_jasmine'

class BrowserstackJasmineSeleniumRunner < JasmineSeleniumRunner::ConfigureJasmine

  def remote_webdriver(server_url) 
    options = {}
    options['browserstack.local'] = 'true'
    options['project'] = ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT']
    options['build'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']
    options['platform'] = ENV['SELENIUM_PLATFORM'] || 'ANY'
    options['browser'] = ENV['SELENIUM_BROWSER'] || 'chrome'
    options['browser_version'] = ENV['SELENIUM_VERSION'] if ENV['SELENIUM_VERSION']

    Selenium::WebDriver.for :remote, :url => server_url, :desired_capabilities => options
  end


  def selenium_options
    options = super
    options['browserstack.local'] = 'true'
    if browser =~ /^firefox/
      options = super
      options['project'] = ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT']
      options['build'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']
      options['platform'] = ENV['SELENIUM_PLATFORM'] || 'ANY'
      options['browser'] = ENV['SELENIUM_BROWSER'] || 'chrome'
      options['browser_version'] = ENV['SELENIUM_VERSION'] if ENV['SELENIUM_VERSION']
    end
    options
  end
end
