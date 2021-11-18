require_relative 'piece'

class Pawn < Piece

    attr_reader :color

    def symbol
        '♙'
    end

    def moves
        []
    end
    
    private
    
    def at_start_row?
        
    end

    def forward_dir 
        if color == :white
            1
        else
            -1
        end
    end

    def forward_step
        row, col = @pos
        moves << [(row + forward_dir), col]
        # @grid[row, col] = NullPiece.instance
    end

    def side_attacks
        row, col = pos
        if @grid[row + forward_dir][col + 1] != NullPiece.instance
           moves << [(row + forward_dir), (col + 1)]
        elsif @grid[row + forward_dir][col - 1] != NullPiece.instance
           moves << [(row + forward_dir), (col - 1)]
        end
    end

end