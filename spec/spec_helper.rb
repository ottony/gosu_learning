require './config/load.rb'

Dir['./spec/support/**/*.rb'].each {|f| require f}
RSpec.configure do |config|

  config.order = "random"
  config.run_all_when_everything_filtered = true
end
