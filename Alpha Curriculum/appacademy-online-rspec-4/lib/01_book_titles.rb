class Book
  attr_accessor :title

  def title= (book_title)
    arr=[]
    small_words=%w{the a an and in of}
    book_title.split(" ").each_with_index do |word,idx|
      if small_words.include?(word)==false || idx==0
        arr << word.capitalize
      else
        arr << word
      end
    end
    @title= arr.join(" ")
  end
end
