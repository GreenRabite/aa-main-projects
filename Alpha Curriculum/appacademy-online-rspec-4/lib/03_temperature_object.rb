class Temperature
  attr_accessor :options

  def initialize(options={})
    @options=options
  end

  def in_fahrenheit
    if options.key?(:f)
      options[:f]
    elsif options.key?(:c)
      (options[:c]*9.0/5)+32
    end
  end

  def in_celsius
    if options.key?(:c)
      options[:c]
    elsif options.key?(:f)
      ((options[:f]-32)*5.0)/9.0
    end
  end

  def self.from_celsius(temp)
    self.new(:c => temp)
  end

  def self.from_fahrenheit(temp)
    self.new(:f => temp)
  end
end

class Celsius < Temperature
  def initialize(temp)
    @options = {:c => temp}
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    @options = {:f => temp}
  end
end
