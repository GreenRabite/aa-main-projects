require_relative "board"
require_relative "player"
require_relative "computer"

class BattleshipGame
  attr_reader :board, :player1, :player2
  attr_accessor :current_player

  def initialize(player1,player2=ComputerPlayer.new("Bob"),board=Board.random)
    @player1=player1
    @player2=player2
    @board=board
    @hit=false
    @current_player=player1
  end

  def play
    until game_over?
      display_status
      play_turn
    end
    puts "Congratulations! You found all the ships!"
  end

  def play_turn
    pos=nil
    until valid_play?(pos)
      if (valid_play?(pos)==false && pos!=nil)
        puts "Invalid coordinates. Please enter valid coordinates."
        puts"----------------------------------------------------"
      end
      pos=current_player.get_play
    end
    attack(pos)
    switch_players!
  end

  def switch_players!
    self.current_player==player1 ? self.current_player=player2 : self.current_player=player1
  end

  def valid_play?(pos)
    pos.is_a?(Array) && board.in_range?(pos) && board[pos]!=:x
  end

  def attack(pos)
    if board[pos]==:s
      @hit=true
    else
      @hit=false
    end
    board[pos]=:x
  end

  def hit?
    @hit
  end

  def count
    board.count
  end

  def game_over?
    board.won?
  end

  def display_status
    system('clear')
    board.display
    puts "It was a direct hit!" if hit?
    puts "The number of ships remaining is #{board.count}!"
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Please enter your name:"
  name= gets.chomp
  BattleshipGame.new(HumanPlayer.new(name)).play
end
