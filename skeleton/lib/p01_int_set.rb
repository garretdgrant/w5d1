class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(max,false)
  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num < @max && num >= 0
  end

  def validate!(num)

  end
end


class IntSet
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % store.length
    @store[i] << num
  end

  def remove(num)
    i = num % store.length
    store[i].delete(num)
  end

  def include?(num)
    i = num % store.length
    store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`

  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count , :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    i = num % @store.length
    return false if store[i].include?(num)
    if @count < @store.length
      @store[i] << num
      @count += 1

    else
     resize!
     i = num % @store.length
     @store[i] << num
     @count +=1
    end
    true
  end

  def remove(num)
    if self.include?(num)
    i = num % store.length
   @store[i].delete(num)
   @count -= 1
    end
  end

  def include?(num)
    i = num % @store.length
   @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = Array.new(@store.length*2) { Array.new }
    @store.dup.flatten.each do  |num| 
      i = num % temp.length
      temp[i] << num
    end
    @store = temp

  end
end
