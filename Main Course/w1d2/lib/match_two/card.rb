class Card
  attr_reader :face_down, :value
  attr_accessor :face_down

  def initialize(value)
    @face_down = true
    @value = value
  end

  def display
    if @face_down
      "?"
    else
      value
    end
  end


  def hide
    @face_down = true
  end

  def reveal
    @face_down = false
  end

  def to_s
    value.to_s
  end

  def ==(other_card)
    value == other_card.value
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Card.new(2)
  game2 = Card.new(2)
  puts game.== game2
end
