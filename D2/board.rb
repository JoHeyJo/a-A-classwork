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
    
    def render
        @grid.each do |row|
            p row
        end
    end

    def empty? 
        @grid.flatten.any? {|pos| pos == ' ' }
    end

    def populate
        # while empty?
            CARDS.each do |card|
                flag = true
                while flag
                    row = rand(0...@grid.length)
                    col = rand(0...@grid.length)
                    pos = [row, col]
                    if self[pos] == ' '
                        self[pos] = card
                        flag = false
                    end
                end
            end
    end

    def won?
        @grid.each do |row|
            row.all? { |pos| pos == :X }
        end
    end

    def guessed_pos(position)
        self[position].reveal
    end

    
end