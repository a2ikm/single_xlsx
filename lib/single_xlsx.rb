require "single_xlsx/version"
require "single_xlsx/sheet"
require "active_support/core_ext/object/try"
require "active_support/core_ext/object/blank"
require "rubyXL"

module SingleXLSX
  def self.read(path)
    book = RubyXL::Parser.parse(path)
    book[0].sheet_data.rows.map do |row|
      row.cells.map { |cell| cell.try(:value).presence }
    end
  end

  def self.generate
    raise ArgumentError, "no block given" unless block_given?

    book = RubyXL::Workbook.new
    sheet = Sheet.new(book[0])
    yield sheet
    book.stream.read
  end
end
