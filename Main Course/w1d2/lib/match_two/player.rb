class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name=name
  end

  def player_input
    puts "Enter a position to guess"
    pos1 = gets.chomp.split(",").map{ |input| input.to_i}
    puts "Enter another position"
    pos2 = gets.chomp.split(",").map{ |input| input.to_i}
    [pos1,pos2]
  end


end
