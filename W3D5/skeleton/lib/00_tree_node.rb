class PolyTreeNode

    attr_reader :value, :children
    attr_accessor :parent

    def initialize(value= nil)
        @value = value
        @parent = nil #parent node
        @children = []
    end

    def parent=(parent)
        return if self.parent == parent 
        # detach from the current parent
        if self.parent
            self.parent._children.delete(self)
        end
        @parent = parent




        # @parent.children << new_parent
        # new_parent.children = children
    end

end