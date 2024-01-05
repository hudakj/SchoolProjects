class Tree
  attr_accessor :children, :node_name

  def initialize(tree_hash)
    @node_name, children_hash = tree_hash.first
    @children = children_hash.map { |name, child_hash| Tree.new(name => child_hash) }
  end

  def visit_all(&block)
    visit(&block)
    children.each { |child| child.visit_all(&block) }
  end

  def visit(&block)
    block.call(self)
  end

  def total_nodes
    1 + children.map(&:total_nodes).reduce(0, :+)
  end

  def total_leaves
    children.empty? ? 1 : children.map(&:total_leaves).reduce(0, :+)
  end
end

# Example usage
ruby_tree = Tree.new({
  'ggp' => {
    'gp1' => {
      'p1' => { 'c1' => {}, 'c2' => {} },
      'p2' => { 'c3' => {} }
    },
    'gp2' => {
      'p3' => { 'c4' => {} },
      'p4' => { 'c5' => {}, 'c6' => {} }
    },
    'gp3' => {
      'p5' => { 'c7' => {} },
      'p6' => { 'c8' => {} }
    }
  }
})

# Traverse and print node names
ruby_tree.visit_all { |node| puts node.node_name }

# Count total nodes and leaves
puts "Total Nodes: #{ruby_tree.total_nodes}"
puts "Total Leaves: #{ruby_tree.total_leaves}"
