dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(File.expand_path("#{dir}/../../lib"))
require "fitnesse"

require "rubygems"
require "spec"
require "lsof"
require "timeout"
require "selenium"
require "polonium"

Spec::Runner.configure do |config|
  config.mock_with :rr
end

