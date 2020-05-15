class Campaign < ApplicationRecord
  belongs_to :charity


  validates :title, uniqueness: true
  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  validates :goal, presence: true
  validates :goal, length: { minimum: 10 }
  validates :how, presence: true
  validates :how, length: { minimum: 10 }
  validates :fundraising_goal, presence: true
  validates :fundraising_goal, numericality: true

end
