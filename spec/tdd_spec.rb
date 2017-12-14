require 'rspec'
require 'tdd'


describe Array do

  describe "#my_uniq" do
    let(:arr) { [1, 2, 1, 3, 3]}
    let(:arr_uniq) { arr.my_uniq }

    it "remove duplicates elements" do
      expect(arr.my_uniq).to eq(arr_uniq)
    end

    it "expect return value to be an array" do
      expect(arr.my_uniq.class).to eq(Array)
    end
  end

  describe "#two_sum" do
    let(:arr) { [-1, 0, 2, -2, 1] }

    it "expects the solution to be an array" do
      expect(arr.two_sum.class).to eq(Array)
    end

    it "finds a pair of indices that sum to zero" do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    let(:arr) { [[0,1,2], [3,4,5], [6,7,8]] }

    it "transpose the matrix" do
      expect(arr.my_transpose).to eq([[0,3,6], [1,4,7], [2,5,8]])
    end

    it "returns itself for an empty array" do
      expect([].my_transpose).to eq([])
    end
  end

  describe "#stock_picker" do
    let(:google) { [1020, 1037, 1035, 1050, 1000] }

    it "finds the correct buy and sell days" do
      expect(google.stock_picker).to eq(["Monday" , "Thursday"])
    end

    it "return message for arrays shorter then length five" do
      expect([100, 105, 115, 120].stock_picker).to eq("Not enough information")
    end
  end
end

describe TowersOfHanoi do
  let(:game) {TowersOfHanoi.new}

  describe "#initalize" do
    it "set up three towers" do
      expect(game.stack.length).to eq(3)
    end

    it "checks that the first tower has discs" do
      expect(game.stack[0]).to eq([3,2,1])
    end
  end

  describe "#move" do
    it "removes a disc from a tower" do
      game.move(0, 2)
      expect(game.stack[0].length).to eq(2)
    end

    it "adds a disc to a tower" do
      game.move(0, 2)
      expect(game.stack[2].length).to eq(1)
    end
  end

  describe "#valid_move?" do
    before(:each) { game.move(0, 2) ; game.move(0, 1) }
    it "lets you know if you can move a disc" do
      expect(game.valid_move?(2, 1)).to eq(true)
    end

    it "raises an error for invalid moves" do
       expect { game.move(0, 1) }.to raise_error("That is not a valid move")
    end
  end

  describe "#won?" do
    before(:each) { game.move(0,2); game.move(0,1); game.move(2,1); game.move(0,2); game.move(1,0); game.move(1,2)}

    it "lets you know when you win" do
      game.move(0,2)
      expect(game.won?).to eq(true)
    end

    it "lets you know if the game is not over yet" do
      game.move(0,1)
      expect(game.won?).not_to eq(true)
    end

  end


end
