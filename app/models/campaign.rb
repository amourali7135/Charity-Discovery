class Campaign < ApplicationRecord
  belongs_to :charity


  validates :title, uniqueness: true, presence: true
  validates :goal, presence: true
  validates :how, presence: true

end
