require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    col_arr = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      LIMIT
        0
      SQL

    @columns = col_arr.first.map do |fragment|
      fragment.to_sym
    end
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do
        self.attributes[col]
      end

      define_method("#{col}=") do |value|
        self.attributes[col] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.underscore.pluralize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    arr = []
    results.each do |result|
      arr << self.new(result)
    end
    arr
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = ?
      LIMIT
        1
    SQL
    return nil if results.empty?


    # self.new(results.first)
    parse_all(results).first

  end

  def initialize(params = {})
    # p params
    params.each do |k,v|
      k_sym = k.to_sym
      if self.class.columns.include?(k_sym)
        self.send("#{k_sym}=",v)
      else
        raise "unknown attribute '#{k}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map {|attr| self.send(attr)}
  end

  def insert
    columns = self.class.columns.drop(1)
    column_names=columns.map(&:to_s).join(", ")
    question_marks = (["?"] * columns.count).join(", ")
    result = DBConnection.execute(<<-SQL,*attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{column_names})
      VALUES
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
