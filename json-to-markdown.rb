require "json"
require "erb"
require "pry"

header = "| Name  | Type  | Description | Link | Download |\n" +
         "| :---- | :---- | :---------- | :--- | :------- |\n"

table_template = "| <%= name %> | <%= type %> | <%= description %> | <%= url %> |\n"
renderer = ERB.new(table_template)

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

# Getting JSON file and parsing it as an array
file = File.read("plugin-metadata-Sept21.json")
plugins = JSON.parse(file)

puts header

plugins.each do |plugin_hash|
  name = plugin_hash["name"]
  type = plugin_hash["type"]
  description = plugin_hash["description"]
  url = plugin_hash["url"]

  item = PluginEntry.new(name, type, description, url)
  puts output = renderer.result(item.get_binding)
end
