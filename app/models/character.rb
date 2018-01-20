class Character < ActiveRecord::Base
  belongs_to :campaign
  has_many :attacks
  has_and_belongs_to_many :encounters
end
