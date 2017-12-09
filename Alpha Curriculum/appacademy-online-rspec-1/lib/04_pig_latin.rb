def translate(str)
  word_arr=str.split(" ")
  arr=[]
  word_arr.each do |word|
    arr << latinize(word)
  end
  arr.join(" ")
end

def latinize(word)
  vowels= %w{a e i o u}
  if word.include?("sch")
    idx=word.index("sch")
    return word[idx+3..-1]+word[0...idx+3]+"ay"
  elsif word.include?("qu")
    idx=word.index("qu")
    return word[idx+2..-1]+word[0...idx+2]+"ay"
  else
    i=0
    while i<word.length
      if vowels.include?(word[i])
        return word[i..-1]+word[0...i]+"ay"
      end
      i+=1
    end
  end
end
