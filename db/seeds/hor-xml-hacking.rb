#!/usr/bin/env ruby

require 'csv'
require 'rubygems' #1.8 compatibility
require 'nokogiri'
require 'pp'
#require 'activerecord'
require '../../config/environment'

house_of_reps = File.join('.','HouseOfReps','*.xml')
xml_files = Dir.glob(house_of_reps)
speeches = []
people = {}
# speech = { :date, :parl_no, :session_no, :period_no, :member_id :name, :electorate, :party, :role, :content }

# version="2.0" versus "2.2"
# Step 1: for each, grab timestamp
xml_files[0..0].each do |file|
  puts "Proccessing file #{file}"
  f = File.open(file)
  doc = Nokogiri::XML.parse(f.read())
  f.close
  speech = { :date => nil, :parl_no => nil, :session_no => nil, :period_no => nil, :member_id => nil, :name => nil, :electorate => nil, :party => nil, :role => nil, :content => nil }
  
  header = doc.xpath('//session.header')
  date = header.xpath('date').inner_text.split('-').map{|i| i.to_i}
  # date = Date.new(date[0],date[1],date[2])
  parliament_number = header.xpath('parliament.no').inner_text.to_i
  session_number = header.xpath('session.no').inner_text.to_i
  period_number = header.xpath('period.no').inner_text.to_i
  
  doc.xpath('//talker').each do |talker|
    speeches << { :date => date,
               :parliament_number => parliament_number,
               :session_number => session_number,
               :period_number => period_number,
               :member_id => talker.xpath('name.id').inner_text,
               :name => talker.xpath('name[@role="metadata"]').inner_text,
               :electorate => talker.xpath('electorate').inner_text,
               :party => talker.xpath('party').inner_text,
               :role => (talker.xpath('role').length > 0 ? talker.xpath('role').inner_text : ""),
               :content => talker.parent.xpath('para').text}
    
    id = talker.xpath('name.id').inner_text
    people[id] = { :name => talker.xpath('name[@role="metadata"]').inner_text,
                :other_names => talker.xpath('name[@role="display"]').inner_text,
                :id => talker.xpath('name.id').inner_text,
                :electorate => talker.xpath('electorate').inner_text,
                :party => talker.xpath('party').inner_text,
                :role => (talker.xpath('role').length > 0 ? talker.xpath('role').inner_text : "")
              } #unless people.map{|p| p[:id]}.find_index(talker.xpath('name.id').inner_text)
    
  end
end

people.each do |id, person|
  #person = people.last
  name = person[:name].split(",")

  member = Member.new({
    :house => 0, :first_name => name[1], :last_name => name[0], :constituency => person[:electorate],
    :party => person[:party], :title => person[:other_names]})
  member.save!
end

speeches.sort{|x,y| x[:member_id] <=> y[:member_id]}.each do |speech|
  puts speech.inspect
  speech = Speech.new({
    :date => speech[:date], :parliament_number => speech[:parliament_number],
    :session_number => speech[:session_number], :period_number => speech[:period_number],
    :member_id => speech[:member_id], :electorate => speech[:electorate], :party => speech[:party],
    :role => speech[:role], :content => speech[:content]
  })
  speech.save!
end

