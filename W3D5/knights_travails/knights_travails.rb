require_relative 'poly_tree_node.rb'

class KnightPathFinder

    attr_reader :pos
    @@possible_moves = [[1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,1], [-1,2]]
    
    def self.root_node(pos)
        PolyTreeNode.new(pos)    
    end

    def self.valid_moves(pos)
        future_moves = []
        @@possible_moves.each do |move|
            move_0 = pos[0] + move[0] 
            move_1 = pos[1] + move[1]
            if (move_0 >= 0 && move_0 < 8) && (move_1 >= 0 && move_1 < 8)
                future_moves << [move_0, move_1]
            end
        end

        if future_moves.length == 0
            return nil
        else
            future_moves
        end
    end
        

    def initialize(pos)
        @considered_positions = [pos]
        @pos = pos
        self.build_move_tree
    end

    def new_move_positions(pos)
        # @considered_positions << KnightPathFinder.valid_moves(pos) if !@considered_positions.include?(KnightPathFinder.valid_moves(pos))
        moves = KnightPathFinder.valid_moves(pos)
        moves.each do |pos|
            if !@considered_positions.include?(pos)
                @considered_positions << pos
            end
        end
    end

    # def find_path(pos)

    # end

    def build_move_tree
        root_node = KnightPathFinder.root_node(pos)
        queue = [root_node]

        until queue.empty?
            current_node = queue.shift
            current_pos = current_node.value
            new_move_positions(current_pos).each do |pos|
                new_node = PolyTreeNode.new(pos)
                current_node.add_child(new_node)
                queue << new_node
            end
        end
    end
end