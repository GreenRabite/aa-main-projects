require "byebug"
require_relative "card"
class Board
  attr_accessor :grid

  def initialize(grid=Array.new(4){Array.new(4)})
    @grid=grid
  end

  def play
    populate
    render
    # p won?
  end

  def populate
    num_cards = grid.length ** 2
    cards = (1..num_cards / 2).to_a + (1..num_cards / 2).to_a
    cards.shuffle!
    (0...grid.length).each do |row|
      (0...grid.length).each do |col|
        self[[row,col]] = Card.new(cards.pop)# = cards.pop
      end
    end
  end

  def render
    arr=[]
    puts "~~~~~~~~~~~~~~~~~~~~~~"
    (0...grid.length).each do |r|
      (0...grid.length).each do |c|
        arr << "[#{self[[r,c]].display}]  "
      end
      p arr.join
      arr=[]
      puts "--------------------"
    end
  end

  def won?
    boolean = grid.flatten.all? do |card|
      card.face_down == false
    end
    if boolean
      true
    else
      false
    end
  end

  def reveal(guess_pos)
    self[guess_pos].face_down = false if self[guess_pos].face_down == true
    self[guess_pos].value
  end

  def [](pos)
    row, col= pos
    grid[row][col]
  end

  def []= (pos, val)
    row, col = pos
    grid[row][col] = val
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Board.new
  # p game[[0,0]].object_id
  game.populate
  # game[[0,0]].face_down = false
  # game[[0,1]].face_down = false
  # game[[1,0]].face_down = false
  # game[[1,1]].face_down = false
  game.reveal([0,0])
  game.render
end
