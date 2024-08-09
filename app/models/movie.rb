class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, :overview, presence:true
  validates :overview, uniqueness: true
end
