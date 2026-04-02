#!/usr/bin/env ruby
# frozen_string_literal: true

def main
  files = fetch_files
  display_files(files)
end

def fetch_files
  Dir.glob('*').sort
end

def display_files(files)
  columns = 3
  rows = (files.size.to_f / columns).ceil
  nested_files = files.each_slice(rows).to_a
  nested_files.map! { |column| column.fill(nil, column.size...rows) }
  nested_files.transpose.each do |row|
    row.each do |file|
      print file.ljust(16) if file
    end
    puts ''
  end
end

main
