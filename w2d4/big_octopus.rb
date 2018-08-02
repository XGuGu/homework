fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhhhhhhhh']

# Sluggish Octopus(on^2)
# Dominant Octopus(onlogn)
# Clever Octopus(on)

def sluggish_octopus(fish)
  sorted = false
  until sorted
    sorted = true
    fish[0..-2].each_with_index do |el, i|
      if fish[i].length > fish[i + 1].length
        fish[i], fish[i + 1] = fish[i + 1], fish[i]
        sorted = false
      end
    end
  end
  fish.last
end

# puts sluggish_octopus(fish)

def merge_sort(fish)
  return fish if fish.length == 1

  mid = fish.length / 2
  left = merge_sort(fish.take(mid))
  right = merge_sort(fish.drop(mid))

  merge(left, right)
end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    if left.first.length < right.first.length
      merged << left.shift
    else
      merged << right.shift
    end

  end

  merged + left + right
end

def dominant_octopus(fish)
  merge_sort(fish).last
end

# puts dominant_octopus(fish)

def clever_octopus(fish)
  largest_fish = fish.first

  fish.each do |el|
    if el.length > largest_fish.length
      largest_fish = el
    end
  end
  largest_fish
end

# puts clever_octopus(fish)



# Octopus Dance!
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(move, tiles)
  index = 0
  tiles.each_with_index do |el, i|
    if el == move
      return i
    end
  end
end


hash = Hash[tiles_array.map.with_index { |value, index| [value, index] }]
# p hash

def constant_dance(move, hash)
  hash[move]
end
