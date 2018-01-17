class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :encounters
  has_many :characters
  has_many :enemies
end
