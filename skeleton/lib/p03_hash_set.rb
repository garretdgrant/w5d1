class HashSet
#   def initialize(num_buckets = 8)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end

#   def insert(key)
#   end

#   def include?(key)
#   end

#   def remove(key)
#   end

#   private

#   def [](num)
#     @store[num]
#   end

#   def num_buckets
#     @store.length
#   end

#   def resize!
#   end
# end

attr_accessor :count , :store

def initialize(num_buckets = 20)
  @store = Array.new(num_buckets) { Array.new }
  @count = 0
end

def insert(num)
  num = num.hash
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
  num = num.hash
  i = num % store.length
  if store[i].include?(num)
 @store[i].delete(num)
 @count -= 1
  end
end

def include?(num)
  num = num.hash
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

