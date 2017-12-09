class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
    @guesser=players[:guesser]
    @referee=players[:referee]
    @game_guesses=[]
  end

  def play
    setup
    @max_guesses = 8
    while @max_guesses > 0
      p @board
      take_turn

      if won?(board)
        p @board
        puts "Guesser guessed the word \"#{referee.secret_word}\" correctly!"
        puts "Congrats"
        abort()
      end
    end
    puts "Word was: #{@referee.secret_word}"
    puts "Guesser loses!"
  end

  def won?(board)
    @board.all?{|el|el!=nil}
  end

  def setup
    secret_length = referee.pick_secret_word
    guesser.register_secret_length(secret_length)
    @board=Array.new(1)*secret_length
  end

  def take_turn
    puts "You have #{@max_guesses} guesses remaining!"
    puts "------------------------------------"
    letter_guess=guesser.guess(@board)
    @game_guesses << letter_guess
    puts "------------------------------------"
    puts "Guesses this game: #{@game_guesses}."
    index_found=referee.check_guess(letter_guess)
    update_board(letter_guess,index_found)
    @max_guesses-=1 if index_found.empty?
    guesser.handle_response(letter_guess,index_found)
  end

  def update_board(letter_guess,index_found)
    index_found.each do |idx|
      board[idx]=letter_guess
    end
  end
end

class HumanPlayer
  attr_reader :guess, :secret_word

  def guess(board)
    puts "Input a guess:"
    letter_guess=gets.chomp.downcase
  end

  def handle_response(letter_guess,index_found)
    puts "#{letter_guess} was found at index locations #{index_found}."
  end

  def check_guess(guess)
    puts "Guesser guessed #{guess}"
    puts "What positions does that occur at?"
    puts "Input all indices as 'X,X,X':"
    puts "Press 'ENTER' if no indicies match:"
    guess_arr=gets.chomp.split(",").map { |i_str| i_str.to_i}
  end

  def register_secret_length(length)
    puts "Secret word is #{length} letters long!"
  end

  def secret_word
    puts "What word were you thinking of?"
    @secret_word = gets.chomp
  end

  def pick_secret_word
    puts "Think of a secret word; how long is it?"

    begin
      Integer(gets.chomp)
    rescue ArgumentError
      puts "Enter a valid length!"
      retry
    end
  end

end

class ComputerPlayer
  attr_reader :dictionary, :board, :secret_word

  def initialize(dictionary)
    @dictionary=dictionary
  end

  def self.player_with_dict_file(dict_file_name)
    ComputerPlayer.new(File.readlines(dict_file_name).map(&:chomp))
  end

  def pick_secret_word
    @secret_word=dictionary.sample
    @secret_word.length
  end

  def check_guess(letter)
    index=[]
    @secret_word.split("").each_with_index do |ch,idx|
      index << idx if letter == ch
    end
    index
  end

  def register_secret_length(secret_word_length)
    @candidate_words=dictionary.select do |word|
      word.length==secret_word_length
    end
  end

  def guess(board)
    freq_letters(board)
  end

  def freq_letters(board)
    letter_counter=Hash.new(0)
    return ("a".."z").to_a.sample if @candidate_words.empty?
    @candidate_words.each do |word|
      word.each_char.with_index do |ch,idx|
        letter_counter[ch]+=1 if board[idx].nil?
      end
    end
    letter_counter.sort_by{|k,v|v}[-1][0]
  end

  def handle_response(letter_guess,index_found)
    @candidate_words.select! do |word|
      possible_word=true
      word.split("").each_with_index do |ch,idx|
        if index_found.include?(idx) && ch!=letter_guess
          possible_word=false
        elsif ch==letter_guess && index_found.include?(idx)==false
          possible_word=false
        end
      end
      possible_word
    end
    @candidate_words
  end

  def candidate_words
    @candidate_words
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Is the guesser a computer? (y/n)"
  guesser_role=gets.chomp.downcase
  if guesser_role=="y"
    guesser = ComputerPlayer.player_with_dict_file("dictionary.txt")
  elsif guesser_role=="n"
    guesser = HumanPlayer.new
  else
    abort("You enter a incorrect input. The program will now terminate.")
  end

  puts "Is the referee a computer? (y/n)"
  referee_role=gets.chomp.downcase
  if referee_role=="y"
    referee = ComputerPlayer.player_with_dict_file("dictionary.txt")
  elsif referee_role=="n"
    referee = HumanPlayer.new
  else
    abort("You enter a incorrect input. The program will now terminate.")
  end

  Hangman.new({:guesser => guesser, :referee => referee}).play
end
