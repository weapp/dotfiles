require "shellwords"
require "pp"
require "yaml"
require 'erb'
require 'ostruct'

def erb(template, vars)
  ERB.new(template.to_s).result(OpenStruct.new(vars).instance_eval { binding })
end

def fetch(command_path, commands, vars={})
  command_name = command_path.shift || commands["default"]
  return [":"] unless command_name
  command = commands[command_name]
  if !command && commands.keys
    command = commands.keys.detect { |k| k.start_with?("$") }
    return [":"] unless command
    vars[command[1..-1]] = erb(command_name, vars)
    command = commands[command]
  end
  return fetch(command_path, command, vars) if command.is_a? Hash
  Array(command).map{ |c| erb(c, vars)}
end

## service_name and command
service_name, *command_path = *ARGV
service_name ||= "k"
if ENV["K_SERVICE"]
  service_name = ENV["K_SERVICE"]
  command_path = ARGV
elsif !File.exist?("#{service_name}.yml")
  service_name = 'k'
  command_path = ARGV
end
SERVICE = service_name
## / service_name and command

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

#STDERR.puts commands

commands = fetch(command_path, commands)

#STDERR.puts commands

# puts "\e[31m[ - #{service_name} - ]\e[0m"
# print "\033]2;#{service_name}\007"

title_name = "echo -en '\\033]2;#{service_name.shellescape}\\007'"

red_name = "echo $'\\e[31m[ #{service_name.shellescape} | #{directory} $ #{commands.join("; ")} ]\\e[0m'"
commands_with_env = commands.map { |c| "#{env}#{c}" }.join("; ")
puts "#{red_name};#{title_name};cd #{directory};#{commands_with_env}"