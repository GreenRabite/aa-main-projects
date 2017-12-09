class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name=name
  end

  def get_play
    puts "Where do you want to fire the torpedo?"
    puts "Enter the coordinates as 'X,X'."
    pos=gets.chomp.split(",").map {|el|el.to_i}
  end

end
