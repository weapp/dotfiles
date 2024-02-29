require "shellwords"
require "pp"
require "yaml"
require 'erb'
require 'ostruct'

def erb(template, vars)
  ERB.new(template.to_s).result(OpenStruct.new(vars).instance_eval { binding })
end

Cmd = Struct.new(:to_s, :commands)

def debug(var)
  STDERR.puts "-" *  80
  STDERR.puts var
  STDERR.puts "-" *  80
  STDERR.puts
end

def fetch(command_path, commands, vars={})
  command_name = command_path.shift || commands["default"]
  unless command_name
    return [Cmd.new("help", commands)]
  end
  command = commands[command_name]
  if !command && commands.keys
    command = commands.keys.detect { |k| k.start_with?("$") }
    return [":"] unless command
    vars[command[1..-1]] = erb(command_name, vars)
    command = commands[command]
  end

  return fetch(command_path, command, vars) if command.is_a? Hash
  Array(command).map{ |c| c.is_a?(Cmd) ? c : "#{erb(c, vars)} #{command_path.shelljoin}"}
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

service = YAML.load(File.read("#{service_name}.yml"))
global = YAML.load(File.read(service["parent"] || "global.yml")) rescue {}

class Table
  def initialize(table)
    @table = table
  end

  def fetch(key, default)
    if @table.count == 0
      default
    else
      head, *tail = @table
      head.fetch(key) { Table.new(tail).fetch(key, default) }
    end
  end
end

table = Table.new([service, global])

if service["alias"]
  service_name = service["alias"]
  service = YAML.load(File.read("#{service_name}.yml"))
end

base = File.expand_path(table.fetch("base", "."), "~")
dir = table.fetch("directory", ".")
directory = dir ? File.expand_path(dir, base).shellescape : '-'

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

if commands == [":"]
  debug "command not found"
  puts ":"
  exit
end

commands_with_env = commands.map do |c|
  if c.is_a?(Cmd)
    STDERR.puts "\e[31mIncomplete command, show one of the following options:\e[0m"
    STDERR.puts "\e[36m#{c.commands.to_yaml}\e[0m"
    puts ":"
    exit
  end
  "#{env}#{c}"
end.join("; ")

script = [
  "#{red_name}",
  service_name == "k" ? nil : "#{title_name}",
  directory == "-" ? nil : "mkdir -p #{directory}",
  "cd #{directory} > /dev/null",
  "#{commands_with_env}"
].compact.join(";\n")

debug script

puts script
