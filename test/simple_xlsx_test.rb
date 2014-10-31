require "test_helper"

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
end
