class Stack
  def initialize
    @array = []
  end

  def push(el)
    @array << el
    el
  end

  def pop
    @array.pop
  end

  def peek
    @array.last
  end

  private
  attr_reader :array
end

class Queue
  def initialize
    @array = array
  end

  def enqueue(el)
    @array << el
    el
  end

  def dequeue
    @array.shift
  end

  def peek
    @array.first
  end

  private
  attr_reader :array
end

class Map
  def initialize
    @array = []
  end

  def set(key, value)
    pair_idx = array.index { |pair| pair[0] == key }
    if pair_idx
      array[pair_idx][1] = value
    else
      array.push([key, value])
    end
    value
  end

  def get(key)
    array.each { |pair| return pair[1] if pair[0] == key }
  end

  def delete(key)
    value = get(key)
    array.reject! { |pair| pair[0] == key }
    value
  end

  def show
    deep_dup(array)
  end

  private

  attr_reader :array

  def deep_dup
    duped = []
    self.each do |el|
      if el.is_a?(Array)
        duped << el.deep_dup
      else
        duped << el
      end
    end
    duped
  end
end
