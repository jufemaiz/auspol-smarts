#!/usr/bin/env ruby

require '../../config/environment'
require 'set'
require 'pp'

kill = Set.new
Member.all.each do |member|
  kill << member.first_name
  kill << member.last_name
  kill << member.constituency
end

Member.all.each do |member|
  key = member.aphkey
  words = Hash.new(0)

  Speech.where(:member_id => key).each do |speech|
    speech.content.split(" ").each do |word|
      if !kill.include? word and word.length > 4
        words[word] += 1 
      end
    end
  end
  puts "#{member.first_name} #{member.last_name} (#{member.constituency})"
  pp words.sort_by{|a,b|-b}.first(20)
end

