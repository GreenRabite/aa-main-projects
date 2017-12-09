class Board
  attr_reader :grid
  attr_accessor :mark

  def initialize(grid=Array.new(3){Array.new(3)})
    @grid=grid
    @mark=mark
  end

  def place_mark(pos,mark)
    pos.each{|x|grid[pos[0]][pos[1]]= mark}
  end

  def winner
    (grid+columns(grid)+diagonals(grid)).each do |row|
      return :X if row==[:X,:X,:X]
      return :O if row==[:O,:O,:O]
    end
    nil
  end

  def columns(grid)
    arr=[]
    cols=[]
    grid.each_with_index do |r,idx|
      grid.each_with_index do |c,idy|
        arr << grid[idy][idx]
      end
      cols << arr
      arr=[]
    end
    cols
  end

  def diagonals(grid)
    right_dia=[grid[0][0],grid[1][1],grid[2][2]]
    left_dia=[grid[0][2],grid[1][1],grid[2][0]]
    arr=[]
    arr << right_dia
    arr << left_dia
    arr
  end

  def empty?(pos)
    if grid[pos[0]][pos[1]].nil?
      true
    else
      false
    end
  end

  def over?
    return false if grid.flatten.all?{|pos|pos==nil}
    return true if winner==:X || winner==:O || grid.flatten.all?{|pos|pos!=nil}
    false
  end

end
