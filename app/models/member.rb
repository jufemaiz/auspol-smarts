class Member < ActiveRecord::Base
  has_many    :speeches,    :primary_key => 'aphkey',       :foreign_key => 'member_id',    :order => 'date DESC'
  has_many    :electorates, :primary_key => 'constituency', :foreign_key => 'title'
  has_many    :postcodes,   :through => :electorate

  default_scope :order => 'last_name ASC'
end
