
class Array
  # My Each
  #
  # Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and returns the original array. Do not use Enumerable's each method. I want to be able to write:
  #
  #  # calls my_each twice on the array, printing all the numbers twice.

  def my_each(&prc)
    i=0
    while i < self.length
      prc.call(self[i])
      i+=1
    end
    self
    # self.length.times do |el|
    #   prc.call(self[el])
    # end
    # self
  end

  # My Select
  #
  # Now extend the Array class to include my_select that takes a block and returns a new array containing only elements that satisfy the block. Use your my_each method!

  def my_select(&prc)
    select_arr=[]
    self.my_each do |el|
      select_arr << el if prc.call(el)
    end
    select_arr
  end

  # My Reject
  #
  # Write my_reject to take a block and return a new array excluding elements that satisfy the block.

  def my_reject(&prc)
    reject_arr=[]
    self.my_each do |el|
      reject_arr << el if prc.call(el)==false
    end
    reject_arr
  end

  # My Any / My All
  #
  # Write my_any? to return true if any elements of the array satisfy the block and my_all? to return true only if all elements satisfy the block.

  def my_any?(&prc)
    any=false
    self.my_each do |el|
      any=true if prc.call(el)
    end
    any
  end

  def my_all?(&prc)
    all=true
    self.my_each do |el|
      all=false if prc.call(el)==false
    end
    all
  end

  # My Flatten
  #
  # my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!

  def my_flatten
    flatten=[]
    self.my_each do |el|
      if el.is_a?(Array)
        flatten += el.my_flatten
      else
        flatten << el
      end
    end
    flatten
  end

  # My Zip
  #
  # Write my_zip to take any number of arguments. It should return a new array containing self.length elements. Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged elements at that index. If the size of any argument is less than self, nil is returned for that location.

  def my_zip(*args)
    zip=[]
    fin_zip=[]
    (0..self.length-1).to_a.my_each do |idx|
      zip << self[idx]
      args.my_each do |arg|
        zip << arg[idx]
      end
      fin_zip << zip
      zip = []
    end
    fin_zip
  end



end


# ------------------------------------------
# Testing my_each
arr=[1,2,3]
puts "my_each solutions"
puts "---------------------"
return_value = arr.my_each {|num| puts num}
p return_value
# ------------------------------------------
# Testing my_select
#
a = [1, 2, 3]
p "my_select solutions"
puts "---------------------"
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []
# ------------------------------------------
# Testing my_reject
#
p "my_reject solutions"
puts "---------------------"
a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]
# ------------------------------------------
# Testing my_any and my_all
#
a = [1, 2, 3]
p "my_any and my_all solutions"
puts "---------------------"
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true
# ------------------------------------------
# Testing my flatten
#
p "my_flatten solutions"
puts "---------------------"
p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# ------------------------------------------
# Testing my_zip
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p "my_zip solutions"
puts "---------------------"
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
# ------------------------------------------

# My Rotate
#
# Write a method my_rotate that returns self rotated. By default, the array should rotate by one element. If a negative value is given, the array is rotated in the opposite direction.
#
# Example:
#
# a = [ "a", "b", "c", "d" ]
# a.my_rotate         #=> ["b", "c", "d", "a"]
# a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# a.my_rotate(15)     #=> ["d", "a", "b", "c"]
# My Join
#
# my_join returns a single string containing all the elements of the array, separated by the given string separator. If no separator is given, an empty string is used.
#
# Example:
#
# a = [ "a", "b", "c", "d" ]
# a.my_join         # => "abcd"
# a.my_join("$")    # => "a$b$c$d"
# My Reverse
#
# Write a method that returns a new array containing all the elements of the original array in reverse order.
#
# Example:
#
# [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# [ 1 ].my_reverse               #=> [1]
