class PolyTreeNode

    attr_reader :value
    attr_accessor :parent, :children

    def initialize(value)
        @value = value
        @children = []
        @parent = nil 
    end

    def parent=(parent)
        return if self.parent == parent

        if self.parent
            self.parent.children.delete(self)
        end

        @parent = parent
        self.parent.children << self unless self.parent.nil?

        self
    end

    def add_child(child_node)
        child_node.parent = self
    end



end