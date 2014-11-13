require "single_xlsx/sheet"

module SingleXLSX
  module Writing
    def generate
      raise ArgumentError, "no block given" unless block_given?

      book = RubyXL::Workbook.new
      sheet = Sheet.new(book[0])
      yield sheet
      book.stream.read
    end
  end

  extend Writing
end
