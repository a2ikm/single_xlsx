require "test_helper"
require "tempfile"

class SingleXlsxTest < Minitest::Test
  def test_read_xlsx
    actual = SingleXLSX.read(fixture_path("book1.xlsx"))
    expected = [
      ["Name", "Age"],
      ["Einstein", 76],
      ["Feynman", 69],
    ]
    assert_equal expected, actual
  end

  # This test is not good test, but it's hard to compare XLSX files directly
  def test_generate_with_block
    actual = SingleXLSX.generate do |sheet|
      sheet << ["Name", "Age"]
      sheet << ["Einstein", 76]
      sheet << ["Feynman", 69]
    end

    tempfile = Tempfile.new(self.class.name)
    tempfile.write actual
    tempfile.close
    arr_of_arr = SingleXLSX.read(tempfile.path)

    expected = [
      ["Name", "Age"],
      ["Einstein", 76],
      ["Feynman", 69],
    ]
    assert_equal expected, arr_of_arr
  ensure
    tempfile.unlink if tempfile
  end

  def test_generate_without_block
    assert_raises ArgumentError do
      SingleXLSX.generate
    end
  end
end
