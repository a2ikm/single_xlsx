require "single_xlsx/sheet"

module SingleXLSX
  module Writing
    def generate(&block)
      create_book(&block).stream.read
    end

    def open(path, &block)
      create_book(&block).write(path)
    end

    private

      def create_book(&block)
        raise ArgumentError, "no block given" if block.nil?

        book = RubyXL::Workbook.new
        sheet = Sheet.new(book[0])
        block.call(sheet)
        book
      end
  end

  extend Writing
end
