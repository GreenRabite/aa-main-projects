def measure(num=1, &blk)
  start=Time.now
  num.times do
    blk.call
  end
  finish=Time.now
  (finish - start)/num
end
