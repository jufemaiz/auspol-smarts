#!/usr/bin/env ruby

require '../../config/environment'
require 'set'
require 'pp'

Static = '../../public/buzzstatic/'
`mkdir -p #{Static}`

kill = Set.new
["Australia", "Australian","member","Minister","motion"].each{|w| kill << w}
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
  json =  JSON.dump words.sort_by{|a,b|-b}.first(40)
  puts json
  file = File.open(File.join(Static, key+".json"), 'w')
  file.write json
  file.close
end


