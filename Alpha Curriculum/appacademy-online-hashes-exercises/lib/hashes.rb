# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  hash=Hash.new
  word_arr = str.split(" ")
  word_arr.each do |word|
    hash[word]=word.length
  end
  hash
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.sort_by{|k,v|v}[-1][0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |k,v|
    older[k]=v
  end
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  hash=Hash.new(0)
  word.each_char do |ch|
    hash[ch]+=1
  end
  hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  hash=Hash.new(0)
  arr.each do |el|
    hash[el]+=1
  end
  hash.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  hash=Hash.new(0)
  numbers.each do |num|
    if num.even?
      hash[:even]+=1
    else
      hash[:odd]+=1
    end
  end
  hash
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  hash=Hash.new(0)
  vowels=%w{a e i o u}
  string.each_char{|ch|hash[ch]+=1 if vowels.include?(ch)}
  max_freq=hash.sort_by{|k,v|v}[-1][1]
  ch_max=hash.select{|k,v|v==max_freq}
  ch_max.sort_by{|k,v|k}[0][0]
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  arr=[]
  faw_bdays = students.select{|student,month|month>6}
  students=faw_bdays.keys
  students.each_with_index do |el1,idx|
    students.each_with_index do |el2,idy|
      next if idx >=idy
      arr <<[el1,el2]
    end
  end
  arr
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  hash=Hash.new(0)
  specimens.each{|el|hash[el]+=1}
  population=hash.sort_by{|k,v|v}
  bio_index = (hash.length**2)*(population[0][1]/population[-1][1])
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_sign.delete!(".'!?;: ")
  vandalized_sign.delete!(".'!?;: ")
  norm_hash=Hash.new(0)
  vandal_hash=Hash.new(0)
  normal_sign.each_char{|ch|norm_hash[ch.downcase]+=1}
  vandalized_sign.each_char{|ch|vandal_hash[ch.downcase]+=1}
  vandal_hash.each do |k,v|
    return false if v > norm_hash[k]
  end
  true
end

def character_count(str)
end
