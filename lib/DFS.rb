require 'silicium'

def depth_first_search?(graph, start, goal)
  visited = {}
  stack = [start]
  until stack.empty?
    node = stack.pop
    raise ArgumentError if graph.vertices[node].nil?
    return true if node == goal

    unless visited[node]
      add_to_stack(graph, node, stack, visited)
    end
  end
  false
end

def add_to_stack(graph, node, stack, visited)
  visited[node] = true
  graph.vertices[node].each {|child| stack.push(child)}
end

def dfs_traverse(graph, start)
  visited = Hash.new(false)
  traversed = []
  dfs_traverse_recursive(graph, start, visited, traversed)
  traversed
end

def dfs_traverse_recursive(graph, node, visited, traversed)
  visited[node] = true
  traversed.push(node)
  graph.vertices[node].each do |child|
    dfs_traverse_recursive(graph, child, visited, traversed) unless visited[child]
  end
end
