class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash = { }
  self.each_with_index do |ele , i |
    hash[i] = ele
  end
  acc = 0
  hash.each do |ele,i|
    acc += (ele.hash + i.hash) ^ acc
  end
 acc
end
end

class String
  def hash
    acc = 0
    self.each_char.with_index do|c, i|
      acc = (c.ord + i)
    end
    acc.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    acc = 0
     self.to_a.each do |sub|
    acc += sub.hash
    end
   acc
  end
end
