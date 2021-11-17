require 'singleton'

class Piece

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        
    end

    def empty?
        false
    end


end

