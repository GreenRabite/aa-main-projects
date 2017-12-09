# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  lower_alpha=("a".."z").to_a
  lower_alpha.each do |ch|
    str.delete!(ch)
  end
  str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  if str.length%2==1
    return str[str.length/2]
  else
    return str[(str.length/2-1)..str.length/2]
  end
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  count=0
  str.each_char do |ch|
    count+=1 if VOWELS.include?(ch)
  end
  count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  return 1 if num==0
  sum=1
  sum*=num*factorial(num-1)
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  str=""
  arr.each_with_index do |el,idx|
    str << el
    next if idx==arr.length-1
    str << separator
  end
  str
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  weird_str=""
  str.each_char.with_index do |ch,idx|
    if idx%2==1
      weird_str+=ch.upcase
    else
      weird_str+=ch.downcase
    end
  end
  weird_str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  word_arr = str.split(" ")
  fin_arr=[]
  word_arr.each do |word|
    if word.length >= 5
      fin_arr << word.reverse
    else
      fin_arr << word
    end
  end
  fin_arr.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  i=1
  arr=[]
  while i <=n
    if i%3==0 && i%5==0
      arr << "fizzbuzz"
    elsif i%3==0
      arr << "fizz"
    elsif i%5==0
      arr << "buzz"
    else
      arr << i
    end
    i+=1
  end
  arr
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  reverse_arr=[]
  arr.each do |el|
    reverse_arr.unshift(el)
  end
  reverse_arr
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  return false if num==1
  i=2
  while i < num
    return false if num%i==0
    i+=1
  end
  true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  i=1
  arr=[]
  while i <=num
    arr << i if num%i==0
    i+=1
  end
  arr
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  arr=[]
  i=2
  while i <= num
    arr << i if prime?(i) && factors(num).include?(i)
    i+=1
  end
  arr
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  odds=[]
  evens=[]
  arr.each do |el|
    if el.even?
      evens << el
    else
      odds << el
    end
  end
  if evens.length==1
    return evens[0]
  else
    return odds[0]
  end
end
