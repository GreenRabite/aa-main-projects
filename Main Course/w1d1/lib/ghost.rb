require_relative "player"
ALPHA = ("a".."z").to_a

class Ghost
  attr_reader :player1, :player2, :dictionary
  attr_accessor :current_player, :fragment

  def initialize(player1,player2)
    @player1,@player2 = player1,player2
    @current_player = player1
    @previous_player = nil
    @fragment = ""
    @dictionary = File.readlines("dictionary.txt").map(&:chomp)
  end

  def play
    take_turn(current_player)
    next_player!
  end

  def valid_play?(str)
    if ALPHA.include?(str.downcase)
      fragment << str
      possible_words=dictionary.select{|word| word.include?(fragment)}
      boolean = possible_words.any? do |word|
        word[0..fragment.length-1].include?(str)
      end
      if boolean
        true
      else
        word = fragment.split("")
        word.pop
        @fragment = word.join("")
        false
      end
    else
      false
    end
  end

  def play_round

  end

  def take_turn(current_player)
    current_player.guess
  end

  def next_player!
    self.current_player==player1 ? self.current_player = player2 : self.current_player = player1
  end

  def previous_player

  end

end

if __FILE__ == $PROGRAM_NAME
  puts "What is your name?"
  player1 = gets.chomp
  puts "What is Player 2 name?"
  player2 = gets.chomp
  Ghost.new(Player.new(player1),Player.new(player2)).play
end
