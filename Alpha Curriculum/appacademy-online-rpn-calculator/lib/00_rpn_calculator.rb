class RPNCalculator
  # TODO: your code goes here!
  # attr_accessor :calculator

  def initialize
    @calculator=[]
  end

  def push(int)
    @calculator << int
  end

  def plus
    perform_op(:+)
  end

  def value
    @calculator[-1]
  end

  def minus
    perform_op(:-)
  end

  def divide
    perform_op(:/)
  end

  def times
    perform_op(:*)
  end

  def tokens(str)
    arr=str.split(" ")
    symbols=["*","+","-","/"]
    arr.map do |el|
      if symbols.include?(el)
        el.to_sym
      else
        el.to_i
      end
    end
  end

  def evaluate(str)
    arr=tokens(str)
    arr.each do |el|
      if el.class==Fixnum
        @calculator << el
      elsif el.class==Symbol
        perform_op(el)
      end
    end
    value
  end

  private

  def perform_op(op_sym)
    raise "calculator is empty" if @calculator.length <2
    first=@calculator.pop
    second=@calculator.pop

    if op_sym==:+
      @calculator << first + second
    elsif op_sym==:-
      @calculator << second - first
    elsif op_sym==:*
      @calculator << first * second
    elsif op_sym==:/
      @calculator << second.to_f / first
    else
      @calculator << second
      @calculator << first
      raise "No such method exists for #{op_sym}"
    end
  end

end
