def reverser(&blk)
  arr=[]
  blk.call.split(" ").each do |word|
    arr << word.reverse
  end
  arr.join(" ")
end

def adder(num=1,&blk)
  blk.call + num
end

def repeater(num = 1, &blk)
  num.times do
    blk.call
  end
end
