require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  arr.reduce(0){|acc,el|acc+=el}
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.all? do |string|
    string.include?(substring)
  end
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  arr=[]
  string.each_char do |ch|
    arr << ch if string.count(ch)>1 && ch!=" "
  end
  arr.sort.uniq
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  biggest_word=string.delete("!?.,;:").split(" ").sort_by{|word|word.length}.reverse
  [biggest_word[0],biggest_word[1]]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  alpha=("a".."z").to_a
  string.each_char do |ch|
    alpha.delete(ch)
  end
  alpha
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  arr=[]
  while first_yr<=last_yr
    arr << first_yr if not_repeat_year?(first_yr)
    first_yr+=1
  end
  arr
end

def not_repeat_year?(year)
  year.to_s.split("").uniq.length==4
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  arr=[]
  songs.each do |song|
    arr << song if no_repeats?(song,songs)
  end
  arr.uniq
end

def no_repeats?(song_name, songs)
  songs.each_with_index do |song,idx|
    next if idx==songs.length-1
    return false if song_name==song && song_name==songs[idx+1]
  end
  true
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  string.delete!(".!?,;:")
  sorted=string.split(" ").sort_by do |word|
    c_distance(word)
  end
  sorted[0]
end

def c_distance(word)
  return 99 if word.include?("c")==false
  word.reverse.index("c")
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
  fin_arr=[]
  start=nil
  arr.each_with_index do |num,idx|
    start=idx if num==arr[idx+1] && start==nil
    if (num!=arr[idx+1] && start!=nil)
      fin_arr << [start,idx]
      start=nil
    end
  end
  fin_arr
end
