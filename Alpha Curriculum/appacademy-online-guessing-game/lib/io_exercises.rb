# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  guess_num = rand(1..100)
  num_guesses=0
  answers=[]
  while true
    puts "Guess a number and input it in the following field:"
    guess = gets.chomp.to_i
    raise_error "You picked this number before!" if answers.include?(guess)
    answers << guess
    puts "You guessed #{guess}!"
    num_guesses+=1

    raise_error  "You can't choose 0" if guess==0
    if guess < guess_num
      puts "The guess was too low. Try again!"
    elsif guess > guess_num
      puts "The guess was too high. Try again!"
    elsif guess==guess_num
      puts "You are correct! You guessed the number!"
      puts "It took you #{num_guesses} guesses!"
      break
    end
  end
end

def shuffle_file(filename)
  base = File.basename(filename, ".*")
  extension = File.extname(filename)
  File.open("#{base}-shuffled#{extension}", "w") do |f|
    File.readlines(filename).shuffle.each do |line|
      f.puts line.chomp
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length == 1
    shuffle_file(ARGV.shift)
  else
    puts "ENTER FILENAME TO SHUFFLE:"
    filename = gets.chomp
    shuffle_file(filename)
  end

end
