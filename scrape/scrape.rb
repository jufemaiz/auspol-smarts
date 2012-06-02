#!/usr/bin/env ruby
#new format

require 'rubygems'
require 'nokogiri'
require 'pp'

raise "usage: scraper <xml file>" if ARGV.size < 1

filename = ARGV[0]
f = File.open(filename)
doc = Nokogiri::XML.parse(f.read())

speeches = []

doc.xpath('//speech').each do |speech|
  hash = {}
  speaker = speech.children[1].children[1]
  talk = speech.children[3]
  hash[:name]    = speaker.children[5].text.split("'").join("\\'")
  hash[:speaker] = speaker.children[7].text
  hash[:party]   = speaker.children[11].text
  hash[:body]    = talk.text.split("'").join("\\'")
  hash[:body].gsub!(/  */,' ');
  hash[:body].gsub!(/[\n ]+\n/,"\n\n")
  speeches << hash
end

day = filename.split('.').first
#print speeches.first(10).pretty_inspect

size = speeches.size
speeches.each_with_index do |speech, i|
  puts "INSERT into speeches (day, name, party, speaker, speech) values ("
  puts "'#{day}', '#{speech[:name]}', '#{speech[:party]}', '#{speech[:speaker]}', '#{speech[:body]}'"
  puts ");"
end


