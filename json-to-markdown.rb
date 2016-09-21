require "json"
require "erb"
require "pry"


class Plugin
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



list = Plugin.new("example", "one", "two", "three")
table_template = "| <%= name %> | <%= type %> | <%= description %> | <%= url %> |\n"
renderer = ERB.new(table_template)

puts output = renderer.result(list.get_binding)
