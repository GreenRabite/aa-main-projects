class HumanPlayer
  attr_reader :name
  attr_accessor :mark

  def initialize(name)
    @name=name
    @mark=[:X,:O]
  end

  def get_move
    puts "Where do you want to put your mark? Enter in terms of 'X,X'"
    pos=gets.chomp.split(",").map{|el|el.to_i}
  end

  def display(board)
    row0= "0 |"
    (0..2).each do |col|
      if board.empty?([0,col])
        row0+= "   |"
      else
        row0+=" " + board.grid[0][col].to_s + " |"
      end
    end

    row1= "1 |"
    (0..2).each do |col|
      if board.empty?([1,col])
        row1+= "   |"
      else
        row1+=" " + board.grid[1][col].to_s + " |"
      end
    end

    row2= "2 |"
    (0..2).each do |col|
      if board.empty?([2,col])
        row2+= "   |"
      else
        row2+=" " + board.grid[2][col].to_s + " |"
      end
    end

    puts "    0   1   2  "
    puts "--------------"
    puts row0
    puts "--------------"
    puts row1
    puts "--------------"
    puts row2
  end

end
