require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :player1, :player2
  attr_reader :current_player

  def initialize(player1,player2)
    @board=Board.new
    @player1=player1
    @player2=player2
    player1.mark=:X
    player2.mark=:O
    @current_player=player1
  end

  def play
    current_player.display(board)
    until board.over?
      play_turn
    end
    if game_winner
      game_winner.display(board)
      puts "The winner is #{game_winner.name}!"
    else
      current_player.display(board)
      puts "Cat's Game"
    end
  end

  def game_winner
    if board.winner==player1.mark
      player1
    elsif board.winner==player2.mark
      player2
    end
  end

  def play_turn
    pos=current_player.get_move
    # while true
    #   break if valid_move?(pos)
    #   pos=current_player.get_move
    # end
    board.place_mark(pos,current_player.mark)
    switch_players!
    current_player.display(board)
  end

  # def valid_move?(pos)
  #   if !board.empty?(pos) || pos[0]>2 || pos[1]>2
  #     current_player.display(board)
  #     puts "Invalid move. Please select another coordinate"
  #     return false
  #   end
  #   true
  # end

  def switch_players!
    if current_player==player1
      @current_player=player2
    else
      @current_player=player1
    end
  end

end

if $PROGRAM_NAME == __FILE__

  print "Enter your name: "
  name = gets.chomp.strip
  human = HumanPlayer.new(name)
  glados = ComputerPlayer.new('GlaDos')

  new_game = Game.new(human, glados)
  new_game.play
end
