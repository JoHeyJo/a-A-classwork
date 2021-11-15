require_relative 'poly_tree_node'

class KnightPathFinder

    attr_reader :pos
    @@possible_moves = [[1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,1], [-1,2]]
    
    def self.root_node
        # PolyTreeNode.new(pos)    
    end

    def self.valid_moves(pos)

        @@possible_moves.each do |move|
            move_0 = pos[0] + move[0] 
            move_1 = pos[1] + move[1]
            if (move_0 >= 0 && move_0 < 8) && (move_1 >= 0 && move_1 < 8)
                return [move_0, move_1]
            end
        end
    end
        

    def initialize(pos)
        @considered_positions = [pos]
        @pos = pos
        self.build_move_tree
    end

    def new_move_positions(pos)
        @considered_positions << KnightPathFinder.valid_moves(pos) if !@considered_positions.include?(KnightPathFinder.valid_moves(pos))
    end

    def find_path(pos)

    end

    def build_move_tree
        KnightPathFinder.root_node
    end
end