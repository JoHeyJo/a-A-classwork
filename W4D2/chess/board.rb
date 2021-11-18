require_relative './pieces/piece'
require_relative './pieces/null_piece'
require_relative './pieces/pawn'
require_relative './pieces/rook_bishop_queen'
require_relative './pieces/king'
require_relative './pieces/knight'

class Board
    
    def initialize
        @grid = Array.new(8) {Array.new(8) { NullPiece.instance } }
        @grid[1].map! { |pos| pos = Pawn.new(:white, @grid, pos, :pawn) } 
        @grid[6].map! { |pos| pos = Pawn.new(:black, @grid, pos, :pawn) }
            @grid[0][0] = RookBishopQueen.new(:white, @grid, [0, 0], :rook)
            @grid[0][1] = Knight.new(:white, @grid, [0, 1], :knight)
            @grid[0][2] = RookBishopQueen.new(:white, @grid, [0, 2], :bishop)
            @grid[0][3] = RookBishopQueen.new(:white, @grid, [0, 3], :queen)
            @grid[0][4] = King.new(:white, @grid, [0, 4], :king)
            @grid[0][5] = RookBishopQueen.new(:white, @grid, [0, 5], :bishop)
            @grid[0][6] = Knight.new(:white, @grid, [0, 6], :knight)
            @grid[0][7] = RookBishopQueen.new(:white, @grid, [0, 7], :rook)

            @grid[7][0] = RookBishopQueen.new(:black, @grid, [7, 0], :rook)
            @grid[7][1] = Knight.new(:black, @grid, [7, 1], :knight)
            @grid[7][2] = RookBishopQueen.new(:black, @grid, [7, 2], :bishop)
            @grid[7][3] = King.new(:black, @grid, [7, 3], :king)
            @grid[7][4] = RookBishopQueen.new(:black, @grid, [7, 4], :queen)
            @grid[7][5] = RookBishopQueen.new(:black, @grid, [7, 5], :bishop)
            @grid[7][6] = Knight.new(:black, @grid, [7, 6], :knight)
            @grid[7][7] = RookBishopQueen.new(:black, @grid, [7, 7], :rook)
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
        
        #null piece to replace 
    end

    def valid_pos?(pos)
        pos.map.all? { |n| (0...@grid.length).include?(n) }
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end
    
    def empty_pos?(pos)
        self[pos].empty?
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

    def display
        @grid.each do |row|
            arr = []
            row.each do |piece|
            arr << piece.symbol
            puts arr.join('  ')
            end
        end
    end

end
