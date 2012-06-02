class Hansard < ActiveRecord::Base
  belongs_to :epobject_id
  belongs_to :speaker_id
end
