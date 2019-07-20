# def my_min(list)
#   list.each_with_index do |ele, idx|
#     eles = list[0...idx] + list[idx + 1..-1]
#     return ele if eles.none? { |val| val < ele }
#   end
# end

def my_min(list)
  min = 0
  (1...list.length).each { |idx| min = idx if list[idx] < list[min] }
  list[min]
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)


# sums = []
# (0...list.length).each do |idx1|
#   (idx1+1..list.length).each do |idx2|
#     sums << list[idx1..idx2]
#   end
# end
# # p sums
# sums.map { |arr| arr.sum }.max

def lcs(list)
  current_sum = list[0]
  max_sum = list.max
  list[1..-1].each do |el|
    new_sum = current_sum + el
    if new_sum < 0
      current_sum = 0
    else
      max_sum = new_sum if new_sum > max_sum
      current_sum = new_sum
    end
  end
  max_sum
end


# list = [2, 3, -6, 7, -6, 7]
# p lcs(list)


def anagram?(word1, word2)
  # word2_dup = word2.split("")
  # word1.each_char do |char|
  #   idx = word2_dup.index(char)
  #   return false if idx == nil
  #   word2_dup.delete_at(idx)
  # end
  # word2_dup.empty? 


  # sorted_1 = word1.chars.sort.join("")
  # sorted_2 = word2.chars.sort.join("")
  # sorted_1 == sorted_2

  hash = Hash.new(0)

  word1.each_char { |char| hash[char] += 1 }
  word2.each_char { |char| hash[char] -= 1 }
  hash.values.all? { |value| value == 0 }

end

p anagram?("elvis", "lives")
p anagram?("gizmo", "sally")

# sorted_arr = arr.sort
# sorted_arr.each do |ele|
#   return true if sorted_arr.include?(target - ele)
# end
# false

def two_sum?(arr, target)
  hash = Hash.new(nil)
  arr.each { |ele| hash[ele] = true }
  hash.each_key { |key| return true if hash[target - key] }
end



def wmr(arr, window)
  windows = []
  max_window = arr[window - 1] - arr[0]
  (1..arr.length - window).each do |idx|
    max_window = arr[window - 1 + idx] - arr[idx]
  end

end