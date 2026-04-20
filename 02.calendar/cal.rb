#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'
require 'optparse'

options = { m: Date.today.month, y: Date.today.year }

OptionParser.new do |opt|
  opt.on('-m VAL') { |v| options[:m] = v.to_i }
  opt.on('-y VAL') { |v| options[:y] = v.to_i }
  opt.parse!(ARGV)
end

first_date = Date.new(options[:y], options[:m], 1)
last_date = Date.new(options[:y], options[:m], -1)

puts "      #{options[:m]}月 #{options[:y]}"
puts '日 月 火 水 木 金 土'

print '   ' * first_date.wday

(first_date..last_date).each do |date|
  print "#{date.day.to_s.rjust(2)} "

  print "\n" if date.saturday? && date != last_date
end

print "\n"
