class Piece

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        
    end

    def empty?
        @board[pos].empty?
    end


end


class NullPiece < Piece 
    # super()
end