class Dictionary
  attr_reader :entries

  def initialize(entries={})
    @entries=entries
  end

  def add(new_entries)
    if new_entries.class==Hash
      entries.merge!(new_entries)
    elsif new_entries.class==String
      entries[new_entries]=nil
    end
  end

  def keywords
    entries.keys.sort
  end

  def include?(key)
    keywords.include?(key)
  end

  def find(word)
    entries.select do |key,value|
      key.include?(word)
    end
  end

  def printable
    printed=keywords.map do |key|
      "[#{key}] \"#{entries[key]}\""
    end
    printed.join("\n")
  end

end
