puts "With Block"

File.open('day2.rb', 'r') do |f|
  f.each_line do |line|
    puts line
  end
end

puts "Without Block"

f = File.open('day2.rb', 'r')
f.each_line do |line|
  puts line
end
f.close

hash = { 1 => 'one', 2 => 'two'}
hash_array = hash.to_a
puts hash_array

hash.each_pair { |key,value| puts "key => #{key}, value => #{value}"}

sixteen_numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

stack = []
sixteen_numbers.each do |a|
  stack.push(a)
  if stack.length == 4
    puts "#{stack[0]},#{stack[1]},#{stack[2]},#{stack[3]}"
    stack = []
  end
end

sixteen_numbers.each_slice(4) {|a,b,c,d| puts "#{a},#{b},#{c},#{d}"}

class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

class Tree2
  attr_accessor :children, :node_name

  def initialize(hash)
    hash.each_pair do |name, children|
      @node_name = name
      @children = children.map { |k,v|  Tree2.new(k => v) }
    end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new("Ruby", [Tree.new("Reis"), Tree.new("MacRuby")])
puts "Visiting first tree"
ruby_tree.visit_all {|node| puts node.node_name}

ruby_tree2 = Tree2.new({'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}})
puts "Visiting second tree"
ruby_tree2.visit_all {|node| puts node.node_name}

File.open('day2.rb', 'r') do |f|
  f.each_line do |line|
    if line.index('ruby') != nil
      puts line
    end
  end
end
