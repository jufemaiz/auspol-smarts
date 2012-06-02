class PbcMember < ActiveRecord::Base
  belongs_to :member
  belongs_to :bill
end
