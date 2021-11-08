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



  