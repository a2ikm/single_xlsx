require "simple_xlsx/version"
require "simple_xlsx/sheet"
require "active_support/core_ext/object/try"
require "active_support/core_ext/object/blank"
require "rubyXL"

module SimpleXLSX
  def self.read(path)
    book = RubyXL::Parser.parse(path)
    book[0].sheet_data.rows.map do |row|
      row.cells.map { |cell| cell.try(:value).presence }
    end
  end

  def self.generate
    raise ArgumentError, "no block given" unless block_given?

    sheet = Sheet.new
    yield sheet
    sheet.rubyxl_workbook.stream.read
  end
end
