#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

COLUMNS = 3

def main
  options = {}
  opt = OptionParser.new
  opt.on('-a') { |v| options[:a] = v }
  opt.parse!(ARGV)

  files = fetch_files(all: options[:a])
  display_files(files)
end

def fetch_files(all: false)
  if all
    Dir.glob('*', File::FNM_DOTMATCH).sort
  else
    Dir.glob('*').sort
  end
end

def display_files(files)
  return if files.empty?

  rows = files.size.ceildiv(COLUMNS)

  width = files.map(&:size).max + 2
  nested_files = files.each_slice(rows).to_a
  nested_files.each { |column| column.fill(nil, column.size...rows) }
  nested_files.transpose.each do |row|
    row.each do |file|
      next if file.nil?
      print file.ljust(width)
    end
    puts
  end
end

main
