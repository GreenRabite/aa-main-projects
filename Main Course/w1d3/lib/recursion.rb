require 'byebug'

def range(start, max)
  arr =[]
  return arr if max < start
  [start] + range(start+1,max)
end

def sum_array(arr)
  arr.reduce(:+)
end

def sum_recursive(arr)
  return arr.first if arr.length < 2
  arr.first + sum_recursive(arr[1..-1])
end

def recursion1(b,exp)
  return 1 if exp == 0
  b * recursion1(b,exp-1)
end

def recursion2(b,exp)
  #base case
  return 1 if exp == 0
  return b if exp == 1
  #inductive case
  if exp.even?
    recursion2(b, exp/2) ** 2
  else
    var = (recursion2(b,(exp-1) / 2))
    b *  var * var
  end
end
# [1,2,:sym, "str"].deep_dup
class Array
  def deep_dup
    arr = []
    self.each do |element|
      if element.is_a? (Array)
        arr << element.deep_dup
      else
        arr << element
      end
    end
    arr
  end
end

#Fibpnacci Series
def fib_seq_iterative(n)
  return nil if n < 1
  fib_seq = [0,1]
  return [fib_seq[0]] if n == 1
  return fib_seq if n == 2
  while fib_seq.length < n
    fib_seq << fib_seq[-1] + fib_seq[-2]
  end
  fib_seq
end

def fib_seq_recursion(n)
  return [0] if n==1
  return [0,1] if n==2
  old_seq = fib_seq_recursion(n-1)
  old_seq + [old_seq[-2] + old_seq[-1]]
  # return [0] if n == 1
  # return [0,1] if n == 2
  #  old_seq = fib_seq_recursion(n-1)
  #  next_value = old_seq[-2] + old_seq[-1]
  #  old_seq + [next_value]
end

p fib_seq_recursion(5)

# [1,2,3].subsets
class Array
  def subsets
    return [[]] if self.empty?

    first = self.shift
    old_seq = self.subsets
    new_seq = old_seq.map do |el|
      el + [first]
    end
    old_seq + new_seq
  end
end

p [1,2,3].subsets

#Permutations

def permutations(array)
  return [array] if array.length < 1
  first = array.shift
  perms = permutations(array)
  total_permutations = []

  perms.each do |perm|
    (0..perm.length).each do |index|
      total_permutations << perm[0...index] + [first] + perm[index..-1]##perm.insert(index,first)
    end
  end

  total_permutations

end

# p permutations([1,2,3])
#test
#Binary Search
def binary_search(arr,tar)
  return nil if arr.length < 1
  mid_idx = arr.length / 2
  if arr[mid_idx] == tar
    return mid_idx
  elsif arr[mid_idx] > tar
    binary_search(arr[0...mid_idx],tar)
  elsif arr[mid_idx] < tar
    subanswer = binary_search(arr[mid_idx+1..-1],tar)
    subanswer.nil? ? nil : (mid_idx+1) + subanswer
  end
end

# p binary_search([1, 2, 3], 1) # => 0
# p binary_search([2, 3, 4, 5], 3) # => 1
# p binary_search([2, 4, 6, 8, 10], 6) # => 2
# p binary_search([1, 3, 4, 5, 9], 5) # => 3
# p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    return arr if arr.length < 2
    middle_index = arr.length / 2
    left_arr = merge_sort(arr[0...middle_index])
    right_arr = merge_sort(arr[middle_index..-1])
    merge_fn(left_arr,right_arr)
end

def merge_fn(left_arr,right_arr)
  merged_array = []
  until left_arr.empty? || right_arr.empty?
    if left_arr[0] < right_arr[0]
      merged_array << left_arr.shift
    elsif right_arr[0] < left_arr[0]
      merged_array << right_arr.shift
    end
  end
  merged_array + left_arr + right_arr
end

# p merge_sort([3,2,5,6,7,1])
