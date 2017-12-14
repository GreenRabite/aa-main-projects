require 'rspec'
require 'poker'

# describe Poker do
#   describe "#initialize" do
#
#   end
#
# end

describe Card do
  let(:two_of_club) {Card.new(2,:club)}

  describe "#initialize" do
    it "value should be initialized" do
      expect(two_of_club.value).to eq(2)
    end
    it "suit should be initialized" do
      expect(two_of_club.suit).to eq(:club)
    end
    it "should be hidden by default" do
      expect(two_of_club.hidden).to eq(true)
    end
  end
end

describe Deck do
  let(:bicycle) { Deck.new}

  describe "#initialize" do
    it "deck should have fifty-two cards" do
      expect(bicycle.stack.length).to eq(52)
    end

    it "deck should all be unique cards" do
      expect(bicycle.stack.uniq.length).to eq(52)
    end

    it "deck should be an array type" do
      expect(bicycle.stack.class).to eq(Array)
    end
  end

  describe "#shuffle!" do
    let(:new_deck) {Deck.new}

    it "should shuffle the cards" do
      bicycle.shuffle!
      expect(bicycle.stack).not_to eq(new_deck.stack)
    end
  end

  describe "#pass_card" do
    let(:phil_ivey) { double("Player", :hand => [] )}
    before(:each) {bicycle.pass_card(phil_ivey)}

    it "should be able to pass out cards to player" do
      expect(phil_ivey.hand.length).to eq(1)
    end

    it "should decrease the deck size by 1" do
      expect(bicycle.stack.length).to eq(51)
    end
  end
end
