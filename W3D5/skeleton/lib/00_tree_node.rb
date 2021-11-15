class PolyTreeNode

    attr_reader :value
    attr_accessor :parent, :children

    def initialize(value)
        @value = value
        @children = []
        @parent = nil #parent node
    end

 

    def parent=(parent)
        # self.parent is the previous parent
        # parent == the arg -> new parent
        return if self.parent == parent

        # First, detach from current parent.
        # we are detaching from the current parent's children so that we can become the parent
        if self.parent
            self.parent.children.delete(self)
        end

        # No new parent to add this to.
        # self becomes a child of the new parent
        @parent = parent
        self.parent.children << self unless self.parent.nil?

        self
    end

    def add_child(child_node)

        # self.children.each { |child| child.parent = child_node.parent if child != child_node }



        #         # return if self.child_node == children.child_node
        # # self.children.each do |child|
        # #     if child == child_node
        # #         child.parent = self
        # #     end
        # # end
        # # parent = child_node(child_node)
        # self.parent

        child.parent = self

    end



end

# t = PolyTreeNode.new
# p t   # def parent=(parent)
    #     # self.parent is the previous parent
    #     # parent == the arg -> new parent
    #     return if self.parent == parent

    #     # First, detach from current parent.
    #     # we are detaching from the current parent's children so that we can become the parent
    #     if self.parent
    #     self.parent._children.delete(self)
    #     end

    #     # No new parent to add this to.
    #     # self becomes a child of the new parent
    #     @parent = parent
    #     self.parent._children << self unless self.parent.nil?

    #     self
    # end

    # def initialize(value = nil)
    #     @value, @parent, @children = value, nil, []
    # end

    # def children
    #     # We dup to avoid someone inadvertently trying to modify our
    #     # children directly through the children array. Note that
    #     # `parent=` works hard to make sure children/parent always match
    #     # up. We don't trust our users to do this.
    #     @children.dup
    # end