class PluginEntry
  include ERB::Util
  attr_accessor :name, :type, :description, :url

  def initialize(name, type, description, url)
    @name = name
    @type = type
    @description = description
    @url = url
  end

  # Expose private binding() method
  def get_binding
    binding()
  end
end
