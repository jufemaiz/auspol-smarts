class Speech < ActiveRecord::Base
  belongs_to  :member,    :primary_key => 'member_id',       :foreign_key => 'aphkey'
  default_scope :order => 'date DESC'
end
