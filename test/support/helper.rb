module Helper
  FIXTURES_DIR = File.expand_path("../../fixtures", __FILE__)

  def fixture_path(relative_path)
    File.join(FIXTURES_DIR, relative_path)
  end
end

Minitest::Test.send :include, Helper
