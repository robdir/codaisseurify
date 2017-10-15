class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy

  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :songs

  validates :name, presence: true
  validates :formed, presence: true
  validates :bio, presence: true, length: { maximum: 500 }

end
