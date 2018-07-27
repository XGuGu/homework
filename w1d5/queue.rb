class Queue
  def initialize
    @queue = []
    @size = 0
  end

  def  enqueue(el)
    @queue.unshift(el)
    @size += 1
  end

  def dequeue
    @size -= 1
    @queue.shift
  end

  def peek
    @queue.first
  end

  def show
    @queue.dup
  end


end
