

class Piece
    attr_accessor :pos
    attr_reader :color

    def initialize(color, board, pos, symbol)
        @color = color
        @board = board
        @pos = pos
        @symbol = symbol
    end

    def to_s
        "#{symbol}"
    end

    def empty?
        false
    end

    def valid_moves
        
    end

    def pos=(val)
        
    end

    # def symbol
        
    # end

    private

    def move_into_check?(end_pos)
        
    end


end

