class Url < ActiveRecord::Base

  attr_accessible :original

  validates :original, presence: true
end
