#!/usr/bin/env ruby
# frozen_string_literal: true

COLUMNS = 3

def main
  files = fetch_files
  display_files(files)
end

def fetch_files
  Dir.glob('*')
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
