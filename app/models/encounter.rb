class Encounter < ActiveRecord::Base
  belongs_to :campaign
  has_and_belongs_to_many :characters
  has_and_belongs_to_many :enemies
end
