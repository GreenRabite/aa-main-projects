class ComputerPlayer
  attr_reader :name

  def initialize(name)
    @name=name
  end

  def player_input(prev_guess, match,length)
    possible_coordinates = []
    prev_guess.each do |k1, v1|
      prev_guess.each do |k2, v2|
        next if k1 == k2
        possible_coordinates << [k1, k2] if v1 == v2
      end
    end
    possible_coordinates.each do |arr|
      return arr if match.include?(arr)==false
    end
    [rand(length),rand(length)]
  end

end

if __FILE__ == $PROGRAM_NAME
  comp = ComputerPlayer.new("Bob")
  hash = {
    [1,1] => 1,
    [2,2] => 1,
    [0,1] => 2,
    [0,2] =>2
  }
  match = [[1,1],[2,2]]
  p comp.player_input(hash, match, 3)
end
