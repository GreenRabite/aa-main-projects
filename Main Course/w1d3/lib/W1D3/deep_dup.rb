class Array
  def deep_dup
    new_arr = []
    self.each do |el|
      new_arr << el unless el.is_a?(Array)
      new_arr << el.deep_dup
    end
    new_arr
  end
end
