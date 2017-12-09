def add(num1,num2)
  num1+num2
end

def subtract(num1,num2)
  num1-num2
end

def sum(arr)
  return 0 if arr.length==0
  arr.reduce(:+)
end

def multiply(arr)
  arr.reduce(1){|accum,el|accum*=el}
end

def power(num,ex)
  num**ex
end

def factorial(num)
  return 1 if num==0
  sum=1
  sum*=num*(factorial(num-1))
end
