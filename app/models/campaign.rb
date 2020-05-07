class Campaign < ApplicationRecord
  belongs_to :charity


  validates: :title, uniqueness: true
end
