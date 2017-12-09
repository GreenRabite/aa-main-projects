class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name=name
  end

  def display(board)
    @board=board
  end

  def get_move
    possible_moves=[]
    (0..2).each do |row|
      (0..2).each do |col|
        possible_moves << [row,col] if board.grid[row][col]==nil
      end
    end
    possible_moves.each do |move|
      return move if wins?(move)
      return move if block?(move)
    end
    possible_moves.sample
  end

  def block?(move)
    board.grid[move[0]][move[1]]=:X
    if board.winner==:X
      board.grid[move[0]][move[1]]=nil
      true
    else
      board.grid[move[0]][move[1]]=nil
      false
    end
  end

  def wins?(move)
    board.grid[move[0]][move[1]]=mark
    if board.winner==mark
      board.grid[move[0]][move[1]]=nil
      true
    else
      board.grid[move[0]][move[1]]=nil
      false
    end
  end

end
