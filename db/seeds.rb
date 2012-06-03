# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# Postcodes
if PostcodeLookup.count == 0
  CSV.foreach(File.join(Rails.root,'db','seeds','postcodes.csv'), {:headers => true}) do |row|
    PostcodeLookup.create({:postcode =>row["postcode"] , :name => row["electoral_division_name"]}) if row.size == 2
  end
end

# Electorates
if Electorate.count == 0
  CSV.foreach(File.join(Rails.root,'db','seeds','electorates-from-aec.csv'), {:headers => true}) do |row|
    Electorate.create(:title => row['name'], :state => row['state'], :area => row['area']) if row.size > 2ra
  end
end

