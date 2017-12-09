require 'byebug'

def range(range_start, range_end)
  return [] if range_end < range_start
  [range_start] + range(range_start + 1, range_end)
end

def sum_arr(arr)
  return nil if arr.empty?
  return arr[0] if arr.size == 1
  arr.first + sum_arr(arr[1..-1])
end

def sum_arr2(arr)
  arr.reduce(:+)
end

def exp(base, n)
  return 1 if n == 0
  base * exp(base, n-1)
end

def exp2(base, n)
  return 1 if n == 0
  # return base if n == 1
  value1 = exp2(base, n / 2)
  value2 = exp2(base, (n - 1) / 2)
  n.even? ? value1 * value1 : base * value2 * value2
end

class Array
  def deep_dup
    new_arr = []
    self.each do |el|
      if el.is_a?(Array)
        new_arr << el.deep_dup
      else
        new_arr << el
      end
      # new_arr << el unless el.is_a?(Array)
      # new_arr << el.deep_dup if el.is_a?(Array)
    end
    new_arr
  end
end

def fib(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2
  old_fib = fib(n - 1)
  next_value = old_fib[-1] + old_fib[-2]
  old_fib + [next_value]
end

def fib2(n)
  fib_seq = [] if n == 0
  fib_seq = [0] if n == 1
  if n > 1
    fib_seq = [0, 1]
    (n-2).times {fib_seq << fib_seq[-1] + fib_seq[-2]}
  end
  fib_seq
end

def subsets(arr)
  if arr.empty?
    [[]]
  else
    last = arr.last
    pre_subsets = subsets(arr[0..-2])
    new_subsets = []
    pre_subsets.each do |subset|
      new_subsets << subset + [last]
    end
    pre_subsets + new_subsets
  end
end

def permutations(arr)
  # debugger
  return [arr] if arr.size <= 1
  new_arr = []
  arr.each_index do |i|
    sub_arr = arr[0...i]+ arr[i+1..-1]
    insertion = arr[i]
    sub_permutations = permutations(sub_arr)
    sub_permutations.each do |sub_permunation|
      sub_permunation.size+1.times do |i|
        new_arr << sub_permunation.insert(i, insertion)
      end
    end
  end
  new_arr
end

def permutations_pseudo(arr)
  return [arr] if arr.size < 2
  last = arr.last
  prev_perms = permutations_pseudo(arr[0...-1])
  answer = []
  prev_perms.each do |sub_array|
    (sub_array.size + 1).times do |idx|
      answer << sub_array[0...idx] + [last] + sub_array[idx..-1]
    end
  end
  answer
end

def bsearch(arr, target)
  # debugger
  return nil if arr.empty?
  mid_idx = arr.size / 2
  return mid_idx if arr[mid_idx] == target
  if arr[mid_idx] > target
    bsearch(arr[0...mid_idx], target)
  else
    found_index = bsearch(arr[mid_idx+1..-1], target)
    found_index ? found_index + mid_idx + 1 : nil
  end
end

def merge_sort(arr)
  return arr if arr.length < 2
  mid_idx = arr.length / 2
  left_arr = merge_sort(arr[0...mid_idx])
  right_arr = merge_sort(arr[mid_idx..-1])
  merge(left_arr,right_arr)
end

def merge(left_arr, right_arr)
  merged_arr = []
  until left_arr.empty? || right_arr.empty?
    if left_arr[0] < right_arr[0]
      merged_arr << left_arr.shift
    else
      merged_arr << right_arr.shift
    end
  end
  merged_arr + left_arr + right_arr
end

p merge_sort([4,5,8,2,4])
