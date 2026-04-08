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
  rows = files.size.ceildiv(COLUMNS)
  width = files.map { |f| f.encode("EUC-JP").bytesize }.max + 2
  nested_files = files.each_slice(rows).to_a
  nested_files.map { |column| column.fill(nil, column.size...rows) }
  nested_files.transpose.each do |row|
    row.each do |file|
      next if file.nil?
      padding_size = width - file.encode("EUC-JP").bytesize
      print file + (" " * padding_size) if file
    end
    puts
  end
end

main
