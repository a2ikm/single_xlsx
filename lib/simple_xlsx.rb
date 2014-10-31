require "simple_xlsx/version"
require "simple_xlsx/sheet"
require "active_support/core_ext/object/try"
require "rubyXL"

module SimpleXLSX
  def self.read(path)
    book = RubyXL::Parser.parse(path)
    book[0].sheet_data.rows.map do |row|
      row.cells.map { |cell| cell.try(:value) }
    end
  end

  def self.generate
    sheet = Sheet.new
    yield sheet
    sheet.rubyxl_workbook.stream.read
  end
end
