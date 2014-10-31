require "test_helper"
require "tempfile"

class SimpleXlsxTest < Minitest::Test
  def test_read_xlsx
    actual = SimpleXLSX.read(fixture_path("book1.xlsx"))
    expected = [
      ["Name", "Age"],
      ["Einstein", 76],
      ["Feynman", 69],
    ]
    assert_equal expected, actual
  end

  # This test is not good test, but it's hard to compare XLSX files directly
  def test_generate_with_block
    actual = SimpleXLSX.generate do |sheet|
      sheet << ["Name", "Age"]
      sheet << ["Einstein", 76]
      sheet << ["Feynman", 69]
    end

    tempfile = Tempfile.new(self.class.name)
    tempfile.write actual
    tempfile.close
    arr_of_arr = SimpleXLSX.read(tempfile.path)

    expected = [
      ["Name", "Age"],
      ["Einstein", 76],
      ["Feynman", 69],
    ]
    assert_equal expected, arr_of_arr
  ensure
    tempfile.unlink if tempfile
  end
end
