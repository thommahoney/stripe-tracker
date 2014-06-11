require './smallest_missing.rb'

module Tracker
  def self.all
    @all ||= Hash.new { |h,k| h[k] = [] }
  end

  # @return the new box name
  def self.allocate(service_name)
    indexes = all[service_name]

    new_index = SmallestMissing.call(indexes)

    all[service_name] << new_index

    "#{service_name}_#{new_index}"
  end

  def self.deallocate(box_name)
    match_data = /(.+)_(\d+)$/.match(box_name)

    service_name, index = match_data[1, 2]

    all[service_name].delete(index.to_i)
  end
end
