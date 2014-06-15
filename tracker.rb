require './smallest_missing.rb'

class Tracker
  def services
    @services ||= []
  end

  def service(service_name)
    services.detect { |service| service.name == service_name }
  end

  def register_service(service)
    services << service
  end

  # @return the new box name
  def allocate(name)
    service = service(name)

    new_index = SmallestMissing.call(service.indexes)
    service.add(new_index)

    "#{service.name}_#{new_index}"
  end

  def deallocate(box_name)
    match_data = /(.+)_(\d+)$/.match(box_name)

    service_name, index = match_data[1, 2]

    service(service_name).delete(index.to_i)
  end
end
