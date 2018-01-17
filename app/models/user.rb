class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  validates :email, presence: true
  has_many :campaigns
  has_many :encounters, through: :campaigns
  has_many :characters, through: :campaigns
  has_many :enemies, through: :campaigns
end
