class Charity < ApplicationRecord
  belongs_to :user
  has_many :campaigns, dependent: :destroy


  validates :name, uniqueness: true
  validates :name, presence: true
  validates :facebook, uniqueness: true
  validates :instagram, uniqueness: true
  validates :website, uniqueness: true
  validates :website, presence: true
  validates :country, presence: true
  validates :income, presence: true
  validates :aged, numericality: true
  validates :size, numericality: true
  validates :program_percentage, numericality: true
  validates :cost_to_100, numericality: true
  validates :fiveohone, presence: true
  validates :goal, presence: true
  validates :goal, length: { minimum: 10 }
  validates :mission, presence: true
  validates :mission, length: { minimum: 10 }
  validates :issues, presence: true

end
