class Array

  def my_uniq
    self.uniq
  end

  def two_sum
    arr = []
    (0..self.length - 1).each do |idx|
      (0..self.length - 1).each do |idy|
        next if idx >= idy
        arr << [idx, idy] if self[idx] + self[idy] == 0
      end
    end
    arr
  end

  def my_transpose
    self.transpose
  end

  DAYS = ["Monday" , "Tuesday" , "Wednesday" , "Thursday" , "Friday"]

  def stock_picker
    return "Not enough information" if self.length < 5
    arr = []
    max = 0
    (0..self.length - 1).each do |idx|
      (0..self.length - 1).each do |idy|
        next if idx >= idy
        if self[idy] - self[idx] > max
          max = self[idy] - self[idx]
          arr = [idx, idy]
        end
      end
    end
    [ DAYS[arr[0]], DAYS[arr[1]] ]
  end
end

class TowersOfHanoi
  attr_reader :stack

  def initialize
    @stack = Array.new(3){Array.new}
    populate
  end

  def play
    until won?
      render
      puts "What is your the index of your start tower?"
      start_tower = gets.chomp.to_i
      puts "What is your the index of your end tower?"
      end_tower = gets.chomp.to_i
      move(start_tower,end_tower)
    end

    puts "Congratulations, you are not a loser."
  end

  def move(start_tower, end_tower)
    raise "That is not a valid move" unless valid_move?(start_tower, end_tower)
    disc = @stack[start_tower].pop
    @stack[end_tower] << disc
  end

  def valid_move?(start_tower, end_tower)
    return true if @stack[end_tower].empty?
    return false if @stack[start_tower].empty?
    @stack[start_tower][-1] <= @stack[end_tower][-1] ? true : false
  end

  def won?
    @stack[2].length==3 || @stack[1].length==3
  end

  def render
    p "0 | #{@stack[0]}"
    p "1 | #{@stack[1]}"
    p "2 | #{@stack[2]}"
  end

  private

  def populate
    @stack[0] = [3, 2, 1]
  end
end

if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new.play
end
