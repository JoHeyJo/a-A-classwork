require_relative 'poly_tree_node'

class KnightPathFinder

    attr_reader :pos

    def self.root_node(pos)
        PolyTreeNode.new(pos)    
    end

    def initialize(pos)
        @pos = pos
        self.build_move_tree
    end

    def find_path(pos)

    end

    def build_move_tree
        KnightPathFinder.root_node
    end
end