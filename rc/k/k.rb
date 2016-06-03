require "shellwords"
require "pp"
require "yaml"
require 'erb'
require 'ostruct'

def erb(template, vars)
  ERB.new(template).result(OpenStruct.new(vars).instance_eval { binding })
end

def fetch(command_path, commands, vars={})
  command_name = command_path.shift || commands["default"]
  return ":" unless command_name
  command = commands[command_name]
  if !command && commands.keys
    command = commands.keys.detect { |k| k.is_a? Symbol }
    return ":" unless command
    vars[command] = command_name
    command = commands[command]
  end
  return fetch(command_path, command, vars) if command.is_a? Hash
  erb(command, vars)
end

service_name, *command_path = *ARGV
service_name ||= "k"

global = YAML.load(File.read("global.yml")) rescue {}
service = YAML.load(File.read("#{service_name}.yml"))
if service["alias"]
  service_name = service["alias"]
  service = YAML.load(File.read("#{service_name}.yml"))
end

base = File.expand_path(global.fetch("directory", "."), "~")
directory = File.expand_path(service.fetch("directory", "."), base).shellescape

env = global.fetch("env", {}).merge(service.fetch("env", {}))
  .map { |key, value| "#{key}=#{value.shellescape} "}.join

commands = global.fetch("commands", {}).merge(service.fetch("commands", {}))
command = fetch(command_path, commands)

# puts "\e[31m[ - #{service_name} - ]\e[0m"
# print "\033]2;#{service_name}\007"

red_name = "echo $'\\e[31m[ #{service_name.shellescape} | #{directory} $ #{command} ]\\e[0m'"
title_name = "echo -en '\\033]2;#{service_name.shellescape}\\007'"

puts "#{red_name};#{title_name};cd #{directory};#{env}#{command}"
