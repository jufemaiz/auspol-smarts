class NatsNp < ActiveRecord::Migration
  def up
    Member.where(party: "NATS").each do |m|
      m.party = "NP"
      m.save!
    end
  end

  def down
  end
end
