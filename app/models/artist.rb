class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy

  has_many :photos, dependent: :destroy

  validates :name, presence: true
  validates :formed, presence: true
  validates :bio, presence: true, length: { maximum: 500 }

end
