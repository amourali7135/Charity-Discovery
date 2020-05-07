class Charity < ApplicationRecord
  belongs_to :user
  has_many :campaigns, dependent: :destroy


  validates :name, uniqueness: true, presence: true
  validates :facebook, uniqueness: true
  validates :instagram, uniqueness: true
  validates :website, uniqueness: true
  validates :country, presence: true
  validates :income, presence: true

end
