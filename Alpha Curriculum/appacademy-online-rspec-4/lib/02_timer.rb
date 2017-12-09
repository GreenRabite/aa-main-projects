class Timer
  attr_accessor :seconds

  def initialize(seconds=0)
    @seconds=seconds
  end

  def time_string
    time_hour = seconds / 3600
    time_minute = (seconds % 3600) / 60
    time_second = seconds % 60
    "#{padded(time_hour)}:#{padded(time_minute)}:#{padded(time_second)}"
  end

  def padded(num)
    num < 10 ? "0#{num}" : "#{num}"
  end
end
