$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))
$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new]

Dir[File.expand_path("../support/*.rb", __FILE__)].each { |file| require file }

require "single_xlsx"
