require 'set'

module SmallestMissing
  def self.call(unsorted_ints)
    set = unsorted_ints.to_set

    length = set.length

    (1..length).each do |index|
      return index unless set.include?(index)
    end

    return length + 1
  end
end
