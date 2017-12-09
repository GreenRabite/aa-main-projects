require_relative "board"
require_relative "player"
require_relative "computer"

class BattleshipGame
  attr_reader :player1_board, :player2_board, :player1, :player2
  attr_accessor :current_player, :current_board

  def initialize(player1,player2,player1_board,player2_board)
    @player1,@player2=player1,player2
    @player1_board,@player2_board=player1_board,player2_board
    @hit=false
    @current_player,@current_board=player1,player1_board
  end

  def play
    until game_over?
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
      display_status
      pos = current_player.get_play
    end
    attack(pos)
    display_status
    switch_players!
  end

  def switch_players!
    self.current_player==player1 ? self.current_player=player2 : self.current_player=player1
    self.current_board==player1_board ? self.current_board=player2_board : self.current_board=player1_board
  end

  def valid_play?(pos)
    pos.is_a?(Array) && current_board.in_range?(pos) && current_board[pos]!=:x
  end

  def attack(pos)
    if current_board[pos]==:s
      @hit=true
    else
      @hit=false
    end
    current_board[pos]=:x
  end

  def hit?
    @hit
  end

  def count
    current_board.count
  end

  def game_over?
    current_board.won?
  end

  def display_status
    system('clear')
    puts "----------#{current_player.name}'s Board----------"
    current_board.display
    puts "It was a direct hit!" if hit?
    puts "The number of ships remaining is #{current_board.count}!"
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Please enter your name:"
  name= gets.chomp
  puts "Do you want to set up your own ships? (y/n)"
  answer=gets.chomp.downcase
  puts "Is there another player? (y/n)"
  answer2=gets.chomp.downcase

  case answer2
  when "n"
    if answer=="y"
      BattleshipGame.new(HumanPlayer.new(name),ComputerPlayer.new("Computer"),Board.random,Board.setup_ships).play
    elsif answer=="n"
      BattleshipGame.new(HumanPlayer.new(name),ComputerPlayer.new("Computer"),Board.random,Board.random).play
    else
      puts "Incorrect selection. This program will terminate."
    end
  when "y"
    puts "Please enter the other player name:"
    name2= gets.chomp
    if answer=="y"
      puts "---------------------------------------"
      puts "#{name}, please setup your ships first:"
      BattleshipGame.new(HumanPlayer.new(name),HumanPlayer.new(name2),Board.setup_ships,Board.setup_ships).play
    elsif answer=="n"
      BattleshipGame.new(HumanPlayer.new(name),HumanPlayer.new(name2),Board.random,Board.random).play
    else
      puts "Incorrect selection. This program will terminate."
    end
  else
    puts "Incorrect selection. This program will terminate."
  end
end
