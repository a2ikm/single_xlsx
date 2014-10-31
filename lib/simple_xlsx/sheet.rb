module SimpleXLSX
  class Sheet
    attr_reader :rubyxl_workbook

    def initialize
      @rubyxl_workbook = RubyXL::Workbook.new
    end

    def rubyxl_worksheet
      rubyxl_workbook[0]
    end

    def <<(cells)
      row = rubyxl_worksheet.sheet_data.rows.count
      cells.each_with_index do |value, column|
        rubyxl_worksheet.add_cell(row, column, value)
      end
      cells
    end
  end
end
