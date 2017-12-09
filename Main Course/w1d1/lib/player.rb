require_relative "ghost"

class Player
  attr_reader name

  def initialize(name)
    @name=name
  end

  def guess
    puts "#{@name}, please input a letter:"
    guess = gets.chomp.downcase
    until valid_play?(guess)
      alert_invalid_guess
      guess = gets.chomp.downcase
    end
  end

  def alert_invalid_guess(guess)
    puts "#{guess} is an invalid character"
    puts "Please try again."
  end

end
