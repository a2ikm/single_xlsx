require "active_support/core_ext/object/try"
require "active_support/core_ext/object/blank"

module SingleXLSX
  module Reading
    def read(path)
      book = RubyXL::Parser.parse(path)
      book[0].sheet_data.rows.map do |row|
        row.cells.map { |cell| cell.try(:value).presence }
      end
    end
  end

  extend Reading
end
