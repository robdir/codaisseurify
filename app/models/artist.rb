class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy

  has_many :photos

  accepts_nested_attributes_for :songs

end
