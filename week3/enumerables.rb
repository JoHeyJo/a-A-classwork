class Array

    def my_each(&prc)

        i = 0
        while i < self.length 
            prc.call(self[i])
            i+=1
        end
        return self
    end

    # arr.each do block
        # new_arr << ele
    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            if prc.call(ele)
                new_arr << ele
            end
        end
        return new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each do |ele|
            if !prc.call(ele)
                new_arr << ele
            end
        end
        return new_arr
    end

    def my_any?(&prc)
      self.my_each do |ele|
        if prc.call(ele)
          return true
        end
      end
      false
    end

    def my_all?(&prc)
      self.my_each do |ele|
        if !prc.call(ele)
          return false
        end
      end
      true
    end

    def my_flatten
      if self.length < 1
        return [self[0]]
      end
      new_arr = []

      self.each do |ele| 
        if ele.instance_of?(Array)
            new_arr += ele.my_flatten
        else
            new_arr << ele
        end
      end
      return new_arr
    end

    def my_zip(*arrays)
      new_arr = Array.new(self.length) {Array.new(arrays.length + 1)}
      arrays.unshift(self)
      # p arrays
      (0...self.length).each do |i|
        (0...arrays.length).each do |j|
          new_arr[i][j] = arrays[j][i]
        end
        end
        return new_arr
    end

    def my_rotate(num=1)
      array = self.dup
      if num > 0
        p num
        # num.times {self.push(self.shift)}
        num.times do
          array.push(array.shift)
        end
      else
        p num
        num.times {array.unshift(array.pop)}
      end
      return array
    end

end


a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


# return_value = [1, 2, 3].my_each do |num|
#     puts num
#   end.my_each do |num|
#     puts num
#   end
#   # => 1
#     #    2
#     #    3
#     #    1
#     #    2
#     #    3
  
#   p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]


# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true
  
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

