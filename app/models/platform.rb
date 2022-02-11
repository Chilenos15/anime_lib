class Platform < ApplicationRecord
  belongs_to :user
  has_many :animes, dependent: :destroy

  validates :name, presence: true
end