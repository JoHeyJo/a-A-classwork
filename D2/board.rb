class Board 
    CARDS = [:A, :A, :B, :B, :C, :C, :D, :D, :E, :E, :F, :F, :G, :G, :H, :H]

    def initialize
        @grid = Array.new(4) {Array.new(4, ' ')}
    end

    def [](pos) 
        row, col = pos
        @grid[row][col]     
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end
    
    def print
        @grid.each do |row|
            p row
        end
    end

    def empty? 
        @grid.flatten.any? {|pos| pos == ' ' }
    end

    def populate
            CARDS.each do |card|
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            pos = [row, col]
            self[pos] = card if self[pos] == " "
        end
    end

    
end