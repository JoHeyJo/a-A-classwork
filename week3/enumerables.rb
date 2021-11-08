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
end

    


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
