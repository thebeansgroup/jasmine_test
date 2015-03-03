Sauce.config do |c|
  if !ENV['TRAVIS']
    c[:sauce_connect_4_executable] = "#{Rails.configuration.root}/lib/sc/bin/sc"
  end
end
