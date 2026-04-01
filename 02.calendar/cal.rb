#!/usr/bin/env ruby

require 'date'
require 'optparse'

options = { m: Date.today.month, y: Date.today.year }

OptionParser.new do |opt|
	opt.on('-m VAL') { |v| options[:m] = v.to_i }
	opt.on('-y VAL') { |v| options[:y] = v.to_i }
	opt.parse!(ARGV)
end

first_day = Date.new(options[:y], options[:m], 1)
last_day = Date.new(options[:y], options[:m], -1)

# カレンダーのヘッダを出力
puts "      #{options[:m]}月 #{options[:y]}"
puts "日 月 火 水 木 金 土"

# カレンダー作成
print "   " * first_day.wday

(first_day..last_day).each do |date|
	print date.day.to_s.rjust(2) + " "

	if date.saturday? && date != last_day
		print "\n"
	end
end

print "\n"
