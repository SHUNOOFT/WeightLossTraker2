class ProgressChart < ApplicationRecord
  belongs_to :user
  has_many :daily_weights, dependent: :destroy

  validates :current_date, presence: true
  validates :current_weight, presence: true
end