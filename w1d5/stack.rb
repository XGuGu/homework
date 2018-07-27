class Stack
  def initialize
    @stack = []
    @size = 0
  end

  def add(num)
    @stack << num
    @size += 1
  end

  def remove
    @size -= 1
    @stack.pop
  end

  def show
    @stack.dup
  end

  def peek
    @stack.last
  end

end
