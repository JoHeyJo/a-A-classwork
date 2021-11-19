fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

#Sliggish Octopus
# quadratic O(n^2)
#bubble sort
# def bubble_fish(arr)
#     sorted = false
#     while !sorted
#     sorted = true
#         (0...arr.length-1).each do |i|
#         if arr[i].length > arr[i+1].length 
#             arr[i], arr[i+1] = arr[i+1], arr[i]
#             sorted = false
#             end
#         end
#     end
#     arr.last
# end

#"=========================================="

# Dominant Octocpus
#linearrithmic
# merge sort

    # def merge_fish(array)
#         return array if array.length <= 1

#         mid_val = array.length / 2
#         left = array[0..mid_val]
#         right = array[mid_val+1..-1]

#         sorted_left = merge_fish(left)
#         sorted_right = merge_fish(right)

        
#         merge(sorted_left, sorted_right)

#     end

# def merge(left, right) 
#     merged = []
#     while !left.empty? && !right.empty?
#         merged << left[0].length < right[0].length ? left.shift : right.shift
#     end
#     mered.concact(left).concact(right)
# end

# p merge_fish(fish_array)


#"=========================================="

#Clever Octopus
#linear
# binary search

def binary_octopus(arr, target)
    return nil if arr.empty?
    
    mid_val = arr.length / 2
    left = arr[0...mid_val]
    right = arr[mid_val+1..-1]

    return mid_val if arr[mid_val] == target
    if target.length > arr[mid_val].length
        nil_check = right.binary_octopus(target)
        if nil_check != nil
            nil_check + mid_val + 1
        else
            nil
        end
    else
        left.binary_octopus(target)
    end
end


p binary_octopus(fish_array, "fiiiissshhhhhh")
