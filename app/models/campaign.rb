class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :encounters
  has_many :characters
  has_many :enemies

  def self.find_by_slug(slug)
    self.all.detect{|o| o.slug == slug}
  end

  def slug
    self.name.downcase.strip.gsub("$","s").gsub("@","a").gsub(/\s/,"-").gsub(/[^\w-]/,"")
  end
end
