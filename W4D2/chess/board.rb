require_relative 'piece'

class Board
    
    def initialize
        @grid = Array.new(8) {Array.new(8)}
        # @null_piece = NullPiece.new
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end


    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def move_piece(color, start_pos, end_pos)
        raise 'NO PIECE THERE' if start_pos.empty?
        raise 'invalid destination' if !valid_pos?(end_pos)
    end

    def valid_pos?(pos)
        pos.map.all? { |n| (0...@grid.length).include?(n) }
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end
    
    def checkmate?(color)

    end

    def in_check?(color)

    end

    def find_king(color)

    end

    def pieces

    end

    def dup

    end

    def move_piece!(color, start_pos, end_pos)

    end

end