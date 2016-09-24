class PluginEntry
  #include ERB::Util
  attr_accessor :name, :type, :description, :url, :maintainer

  def initialize(name, type, description, url, maintainer)
    @name = name
    @type = type
    @description = description
    @url = url
    @maintainer = maintainer
  end

  # Expose private binding() method
  def get_binding
    binding()
  end
end
