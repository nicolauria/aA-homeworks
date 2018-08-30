# O(n^2)

def sluggish_octopush(fishes)
  fishes.each_with_index do |fish1, idx1|
    max_length = true
    fishes.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      max_length = false if fish2.length > fish1.length
    end
    return fish1 if max_length
  end
end

def dominant_octopush(fishes)
  fishes.merge_sort[-1]
end

class Array
  def merge_sort
    return self if length <= 1
    mid = self.length / 2

    left = merge_sort(self.take(mid))
    right = merge_sort(self.drop(mid))

    Array.merge(left, right)
  end

  def self.merge(left, right)
    merged = []
    until left.empty? || right.empty?
      if left.first > right.first
        merged << right.shift
      else
        merged << left.shift
      end
    end
    merged + left + right
  end
end

def clever_octopus(fishes)
  biggest_fish = fishes.firt

  fishes.each do |fish|
    if fish.length > biggest_fish.length
      biggest_fish = fish
    end
  end

  fish
end

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def constant_dance(direction, tiles_hash)
  tiles_hash[direction]
end
