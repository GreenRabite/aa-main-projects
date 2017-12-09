class Board
  BOARD_SYM={
    nil => " ",
    :x => "x",
    :s => " "
  }
  attr_reader :grid

  def self.default_grid
    Array.new(10){Array.new(10)}
  end

  # Factory method that create an instance of the Board with populated ships
  def self.random
    self.new(self.default_grid, true,false)
  end

  def self.setup_ships
    self.new(self.default_grid,false,true)
  end

  def initialize(grid=self.class.default_grid,random=false,setup=false)
    @grid=grid
    populate_grid if random
    setup_ships if setup
  end

  def in_range?(pos)
    pos.all? {|el| el.between?(0,grid.length-1)}
  end

  #ruby synthanic sugar
  def [](pos)
    row,col = pos
    grid[row][col]
  end

  def []=(pos,val)
    row,col=pos
    grid[row][col]=val
  end

  def count
    grid.flatten.count{|space|space==:s}
  end

  def empty?(pos=nil)
    if pos !=nil
      self[pos].nil?
    else
      self.count==0
    end
  end

  def full?
    grid.flatten.all?{|space|space!=nil}
  end

  def populate_grid(ships=10)
    ships.times {place_random_ship}
  end

  def place_ships
    coords.all? do |pair|
      pair.all? do |pos|
        pos < current_board.grid.length
      end
    end
  end

  def place_random_ship
    raise_error "The board is full" if self.full?
    pos=random_pos
    until empty?(pos)
      pos=random_pos
    end
    self[pos]=:s
  end

  def random_pos
    [rand(grid[0].length),rand(grid.length)]
  end

  def won?
    self.count==0
  end

  def display
    header = (0..9).to_a.join("  ")
    puts "|  #{header}|"
    puts "---------------------------------"
    grid.each_with_index { |row, i| display_row(row, i) }
    puts "---------------------------------"
  end

  def display_row(row, i)
    chars = row.map { |el| BOARD_SYM[el] }.join("  ")
    puts "|#{i} #{chars}|"
  end

  def setup_ships
    puts "Please enter 3 coordinates to place your ships"
    while true
      coords=[]
      new_coords=[]
      ships=["Aircraft Carrier","Battleship","Submarine","Destroyer","Patrol Boat"]
      ships_dim=[5,4,3,3,2]
      i=0
      while i < ships.length
        puts "---------------------------------------"
        puts "Please enter coordinates in 'X,X' format:"
        puts "Please allow enough space for the ship to fit."
        puts "Place your #{ships[i]}. The dimensions are #{ships_dim[i]}x1."
        puts "---------------------------------------"
        pos=gets.chomp.split(",").map {|el|el.to_i}
        coords << pos
        new_coords << pos
        x=1
        while x < ships_dim[i]
          new_coords << [pos[0],pos[1]+x]
          x+=1
        end
        i+=1
      end
      puts "---------------------------------------"
      puts "You enter #{new_coords} as your coordinates."
      puts "---------------------------------------"
      break if valid_setup?(coords)
    end
    new_coords.each do |pair|
      self[pair]=:s
    end
  end

  def valid_setup?(coords)
    ships_dim=[5,4,3,3,2]
    coords.each_with_index do |pair,idx|
      pair.each_with_index do |pos,idy|
        if idy==0
          return false if (pos+ships_dim[idx] > grid.length)
        else
          return false if (pos > grid[0].length)
        end
      end
    end
    true
  end

end
