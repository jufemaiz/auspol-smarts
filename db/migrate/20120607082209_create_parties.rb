class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :party, :primary_key => true
      t.string :name

      t.timestamps
    end
    parties = {
	    'ALP' => "Labor Party",
	    'LP'  => "Liberal Party",
	    'NP'  => "National Party",
	    'CLP' => "Country Liberal Party",
	    'IND' => "Independent",
	    'AG'  => "Australian Greens"
    }
    parties.each{|party,name| Party.new({party: party, name: name}).save }
  end
end
