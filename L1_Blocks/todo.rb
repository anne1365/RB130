class TodoList #-----------------------------------------------------------------------------
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # ---- Adding to the list ----------------------------------------------
  def add(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo
    todos << todo
    system 'cls'
    puts "To Do List:"
    todos.each { |item| puts "=> #{item}" }
  end

  def <<(todo)
    add(todo)
  end

  # ---- Interrogating the list ------------------------------------------
  def size
    todos.length
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos#.map { |todo| todo.title }
  end
  
  def done?
    todos.all? { |todo| todo.done? }
  end

  # ---- Retrieving an item in the list ----------------------------------
  def invalid_index?(index)
    todos[index].nil?
  end
  
  def item_at(index)
    raise IndexError.new("That index is out of range!") if invalid_index?(index)
    puts todos[index]
  end

  def mark_done_at(index)
    raise IndexError.new("That index is out of range!") if invalid_index?(index)
    todos[index].done!
  end

  def mark_undone_at(index)
    raise IndexError.new("That index is out of range!") if invalid_index?(index)
    todos[index].undone!
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  # ---- Deleting from the list ------------------------------------------
  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    raise IndexError.new("That index is out of range!") if invalid_index?(index)
    todos.delete_at(index)
  end

  # ---- Outputting the list ---------------------------------------------
  def to_s
    puts "---- #{title} ----"
    todos.each { |todo| puts todo }
  end

  private

  attr_accessor :todos
end



class Todo #---------------------------------------------------------------------------------
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}" 
  end

  def ==(otherTodo)
    title == otherTodo.title &&
    description == otherTodo.description &&
    done == otherTodo.done
  end
end



#--------------------------------------------------------------------------------------------
todo1 = Todo.new("Buy deli meat")
todo2 = Todo.new("Clean bathroom")
todo3 = Todo.new("Order body wash")

list = TodoList.new("Things to get done!")
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# p list.size
# p list.first
# p list.last
# p list.to_a

puts

p list.done?
list.done!
p list.done?

puts

list.to_s
list.mark_undone_at(1)
list.to_s

# puts

list.item_at(100)
