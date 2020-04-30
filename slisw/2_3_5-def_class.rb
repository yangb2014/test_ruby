#!/usr/bin/ruby -w

# Integer -> Numeric -> Object -> BasicObject -> nil
puts 4.class
puts 4.class.superclass
puts 4.class.superclass.superclass
puts 4.class.superclass.superclass.superclass
puts 4.class.superclass.superclass.superclass.superclass

# Class -> Module -> Object -> BasicObject
puts 4.class.class
puts 4.class.class.superclass
puts 4.class.class.superclass.superclass
puts 4.class.class.superclass.superclass.superclass

# Class Tree
class Tree
    attr_accessor :children, :node_name

    def initialize(name, children=[])
        @children = children
        @node_name = name
    end

    def visit_all(&block)
    end

    def visit(&block)
        block.call self
    end
end

ruby_tree = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacRuby")])

puts "Visit a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "Visit entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
puts
