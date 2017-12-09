class Code
  attr_reader :pegs

  def initialize(pegs)
    @pegs=pegs
  end

  PEGS={
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow,
    "O" => :orange,
    "P" => :purple
  }

  def self.random
    pegs=[]
    until pegs.length ==4
      pegs << PEGS.values.sample
    end
    Code.new(pegs)
  end

  def self.parse(input)
    pegs=input.upcase.split("").map do |letter|
      raise_error "Wrong color combination" if PEGS.include?(letter)==false
      PEGS[letter]
    end
    Code.new(pegs)
  end

  def [](idx)
    pegs[idx]
  end

  def ==(guess)
    return false if guess.is_a?(Code)==false
    self.pegs==guess.pegs
  end

  def exact_matches(guess)
    correct_match=0
    pegs.each_index do |idx|
      correct_match+=1 if pegs[idx]==guess[idx]
    end
    correct_match
  end

  def near_matches(guess)
    near_matches=0
    guess_color_count=guess.color_counts
    self.color_counts.each do |color,count|
      next if guess_color_count.include?(color)==false
      near_matches+=[count,guess_color_count[color]].min
    end
    #Returns the number of near matches by subtracting total matches from exact matches
    near_matches-= self.exact_matches(guess)
  end

  def color_counts
    color_counts=Hash.new(0)

    pegs.each do |color|
      color_counts[color]+=1
    end
    color_counts
  end

end

class Game
  attr_reader :secret_code

  def initialize(secret_code=Code.random)
    @secret_code=secret_code
  end

  def play
    num_guesses=0
    until num_guesses==10
      guess = get_guess
      if guess == secret_code
        num_guesses+=1
        puts "You got the right combination!"
        puts "It took you #{num_guesses} guessess!"
        break
      else
        num_guesses+=1
        puts "That was the incorrect color combination"
        display_matches(guess)
      end
    end
    puts "Game over. You lose!" if num_guesses==10
    puts "Thank you for playing! Hope to see you again soon!"
  end

  def get_guess
    puts "----------------------------------------------------"
    puts "Input a guess of four colors in this format 'XXXX'"
    puts "r:red, g:green, b:blue, y:yellow, o:orange, p:purple"
    puts "----------------------------------------------------"
    begin
      guess=gets.chomp
      Code.parse(guess)
    rescue
      puts "Incorrect color combination. Try again"
      retry
    end
  end

  def display_matches(guess)
    exact_matches=secret_code.exact_matches(guess)
    near_matches=secret_code.near_matches(guess)
    puts "The number of exact matches is #{exact_matches}."
    puts "The number of near matches is #{near_matches}."
  end

  if __FILE__ == $PROGRAM_NAME
    Game.new.play
  end

end
