#!/usr/bin/ruby

require 'json'
require 'csv'

def is_int(str)
  # Check if a string should be an integer
  return !!(str =~ /^[-+]?[1-9]([0-9]*)?$/)
end

lines = CSV.open(ARGV[0]).readlines
keys = lines.delete lines.first

File.open(ARGV[1], "w") do |f|
  data = lines.map do |values|
    is_int(values) ? values.to_i : values.to_s
    Hash[keys.zip(values)]
  end
  f.puts JSON.pretty_generate(data)
end