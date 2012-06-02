require 'csv'
require 'nokogiri'

house_of_reps = File.join('.','HouseOfReps','*.xml')
xml_files = Dir.glob(house_of_reps)
speeches = []
# speech = { :date, :parl_no, :session_no, :period_no, :member_id :name, :electorate, :party, :role, :content }

# version="2.0" versus "2.2"
# Step 1: for each, grab timestamp
xml_files[0..0].each do |file|
  f = File.open(file)
  doc = Nokogiri::XML.parse(f.read())
  f.close
  speech = { :date => nil, :parl_no => nil, :session_no => nil, :period_no => nil, :member_id => nil, :name => nil, :electorate => nil, :party => nil, :role => nil, :content => nil }
  
  header = doc.xpath('session.header')
  date = header.xpath('date').inner_text.split('-').map{|i| i.to_i}
  # date = Date.new(date[0],date[1],date[2])
  parliament_number = header.xpath('parliament.no').inner_text.to_i
  session_number = header.xpath('session.no').inner_text.to_i
  period_number = header.xpath('period.no').inner_text.to_i
  
  doc.xpath('//talker').each do |talker|
    speech = { :date => nil, :parliament_number => nil, :session_number => nil, :period_number => nil, :member_id => nil, :name => nil, :electorate => nil, :party => nil, :role => nil, :content => nil }
    
    people << { :name => talker.xpath('name[@role="metadata"]').inner_text,
                :other_names => talker.xpath('name[@role="display"]').inner_text,
                :id => talker.xpath('name.id').inner_text,
                :electorate => talker.xpath('electorate').inner_text,
                :party => talker.xpath('party').inner_text,
                :role => (talker.xpath('role').length > 0 ? talker.xpath('role').inner_text : "")
              } unless people.map{|p| p[:id]}.find_index(talker.xpath('name.id').inner_text)
  end
end
puts people.sort{|x,y| x[:id] <=> y[:id]}.inspect
