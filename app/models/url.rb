class Url < ActiveRecord::Base
  attr_accessible :original

  validates :original, :shortened, presence: true
  validates :shortened, uniqueness: true
  validates :original, :url => true

  before_validation :shorten_url

  private
    def shorten_url
      begin
        unique_hash = SecureRandom.hex(2)
      end while Url.find_by_shortened unique_hash

      self.shortened = unique_hash
    end
end
