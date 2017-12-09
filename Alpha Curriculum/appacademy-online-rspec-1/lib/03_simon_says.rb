def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str,time=2)
  arr=[]
  time.times do
    arr << str
  end
  arr.join(" ")
end

def start_of_word(str,num)
  str[0..num-1]
end

def first_word(str)
  str.split(" ")[0]
end

def titleize(str)
  little_words=%w{and over the}
  arr=[]
  str.split(" ").each_with_index do |word,idx|
    if little_words.include?(word)==false ||  idx==0
      arr << word.capitalize
    else
      arr << word
    end
  end
  arr.join(" ")
end
