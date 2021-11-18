require_relative 'piece'

class Knight < Piece
    attr_accessor :pos

    # def symbol
    #     # '♘'.colorize(color)
    # end

    def move

    end

    protected
    def move_diffs
        valid_positions = []
        moves = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], 
                [-2, -1],  [-2, 2], [-1, 2]]

        moves.each do |move|
            idx_0 = pos[0] + move[0]
            idx_1 = pos[1] + move[1]

            if (idx_0 >= 0 && idx_0 < 8) &&
                (idx_1 >= 0 && idx_1 < 8) 
                valid_positions << [idx_0, idx_1]
            end
        end
        valid_positions
    end

end