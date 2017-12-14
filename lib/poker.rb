class Poker

end

class Card
  attr_reader :value, :suit, :hidden

  def initialize(value,suit)
    @value = value
    @suit = suit
    @hidden = true
  end
end

class Deck
  attr_reader :stack

  CARD_VALUES = %w{2 3 4 5 6 7 8 9 10 J Q K A}
  CARD_SUITS = [:diamond, :club, :heart, :spade]

  def initialize
    @stack = self.create_deck
  end

  def shuffle!
    @stack.shuffle!
  end

  def create_deck
    arr = []
    CARD_VALUES.each do |value|
      CARD_SUITS.each do |suit|
        arr << Card.new(value,suit)
      end
    end
    arr
  end

  def pass_card(player)
    passed_card = @stack.pop
    player.hand << passed_card
  end


end
