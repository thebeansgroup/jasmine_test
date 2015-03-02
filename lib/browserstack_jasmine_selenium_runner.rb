class BrowserstackJasmineSeleniumRunner < JasmineSeleniumRunner::ConfigureJasmine
  def selenium_options
    options = super
    if browser =~ /^firefox/
      options = super
      options[:profile] ||= Selenium::WebDriver::Firefox::Profile.new
      options[:profile]['dom.max_chrome_script_run_time'] = 20
      options[:profile]['dom.max_script_run_time'] = 20
    end
    options
  end
end
