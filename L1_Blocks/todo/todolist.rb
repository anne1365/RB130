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

class TodoList #-----------------------------------------------------------------------------
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    todos.length
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo
    todos << todo
  end
  alias_method :add, :<<

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def remove_at(index)
    todos.delete(item_at(index))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    todos.clone
  end

  def each
    todos.each { |todo| yield(todo) if block_given? }
    self
  end

  def select
    results = TodoList.new(title)
    todos.each { |todo| results << todo if yield(todo) } if block_given?
    results
  end

  def find_by_title(title)
    select { |todo| todo.title == title } .first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title(title).done! if find_by_title(title)
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  private

  attr_accessor :todos
end

#--------------------------------------------------------------------------------------------
# todo1 = Todo.new("Buy deli meat")
# todo2 = Todo.new("Clean bathroom")
# todo3 = Todo.new("Order body wash")

# list = TodoList.new("Things to get done!")
# list.add(todo1)                 # adds todo1 to end of list, returns list
# list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(todo3)                 # adds todo3 to end of list, returns list

# puts list
# list.pop
# puts list

# list.mark_done_at(1)
# puts list

# each_result = list.each { |todo| puts todo }
# puts each_result.class
# puts each_result.inspect
# puts list.inspect

# todo2.done!

# results = list.select { |todo| todo.done? }

# puts results.inspect
# puts results.class
# puts list.inspect

# puts list.all_done
# puts list.all_not_done.equal?(list)
# puts list.inspect

# puts list
# puts
# list.find_by_title("Buy deli meat")
# list.mark_done("Buy deli meat")
# puts list
