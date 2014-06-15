class Service
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def indexes
    @indexes ||= []
  end

  def add(index)
    indexes << index
  end

  def delete(index)
    indexes.delete(index)
  end
end

