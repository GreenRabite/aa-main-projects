class ComputerPlayer
  attr_reader :name

  def initialize(name)
    @name=name
  end

  def get_play
    pos= [rand(0..9),rand(0..9)]
  end

end
