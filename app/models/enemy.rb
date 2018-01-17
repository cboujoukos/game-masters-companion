class Enemy < ActiveRecord::Base
  belongs_to :campaign
  has_and_belongs_to_many :encounters
end
