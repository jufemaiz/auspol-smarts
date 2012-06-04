class Electorate < ActiveRecord::Base
  has_many    :members,   :primary_key => 'title', :foreign_key => 'constituency'
end
