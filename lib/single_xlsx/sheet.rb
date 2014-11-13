module SingleXLSX
  class Sheet
    attr_reader :rubyxl_worksheet

    def initialize(rubyxl_worksheet)
      @rubyxl_worksheet = rubyxl_worksheet
    end

    def <<(cells)
      row = rubyxl_worksheet.sheet_data.rows.count
      cells.each_with_index do |value, column|
        rubyxl_worksheet.add_cell(row, column, value.presence)
      end
      cells
    end
  end
end
