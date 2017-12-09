require_relative "board"
require_relative "player"
require_relative "computer"

class Game
  attr_reader :board, :player1, :player2
  attr_accessor :current_player, :prev_guess, :match

  def initialize(player1,player2)
    @board = Board.new
    @prev_guess = Hash.new
    @current_player = player1
    @player1, @player2 = player1, player2
    @match = []
  end

  def play
    board.populate
    until board.won?
      puts "#{current_player.name}, it's your turn!!"
      board.render
      if current_player.class == HumanPlayer
        guess = current_player.player_input
      elsif current_player.class == ComputerPlayer
        guess = current_player.player_input(prev_guess, match, board.grid.length)
      end
      guess.each do |array|
        play_move(array)
      end
      board.render
      guess_match?(guess)
      populate_matches
      sleep(2)
      system('clear')
      switch_players!
    end
    puts "You Win!!"
  end

  def populate_matches
    (0 ... board.grid.length).each do |r|
      (0 ... board.grid.length).each do |c|
      match  << [r, c] if board[[r,c]].face_down == false
      end
    end
  end

  def switch_players!
    self.current_player==player1 ? self.current_player = player2 : self.current_player = player1
  end

  def play_move(pos)
    board.reveal(pos)
    prev_guess[pos] = board[pos].value
  end

  def guess_match?(array)
    if !(board[array[0]] == board[array[1]])
      board[array[0]].face_down = true
      board[array[1]].face_down = true
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new(HumanPlayer.new("Bob"),ComputerPlayer.new("Jill")).play
end
