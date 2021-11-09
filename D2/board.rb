class Board 

    def initialize
        @grid = Array.new(4) {Array.new(4, ' ')}
    end

    def print
        @grid.each do |row|
            p row
        end
    end

    def populate
        pair 
    end

end