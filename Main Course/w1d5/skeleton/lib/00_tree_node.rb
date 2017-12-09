require 'byebug'

class PolyTreeNode
  attr_reader :value, :parent
  attr_accessor :children

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def parent=(parent_node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = parent_node
    return nil if @parent == nil
    if @parent.children.include?(self)==false
      @parent.children << self
    end
  end

  def add_child(child_node)
    # debugger
    child_node.parent = self
  end

  def remove_child(child_node)
    if @children.include?(child_node)
      child_node.parent = nil
    else
      raise "#{child_node} is not a child!!"
    end
  end

  def dfs(target)
    return self if target == self.value
    self.children.each do |child|
      result =  child.dfs(target)
      return child unless result.nil?
    end
    nil
  end

end
