class Map
  def initialize
    @map = []
  end

  def set(k, v)
    index = nil
    @map.each_with_index do |arr, i|
      index = i if arr[0] == k
    end

    if index
      @map[index][1] = v
    else
      @map.push([k,v])
    end
  end

  def delete(k)
    @map.each_with_index do |arr, i|
      if arr[0] == k
        @map.delete(arr)
      end
    end
  end

  def get(k)
    @map.each_with_index do |arr, i|
      if arr[0] == k
        return arr[1]
      end
    end
    nil
  end

  def show
    @map.dup
  end


end
