class DailyWeight < ApplicationRecord
  belongs_to :user
  #belongs_to :progress_chart

  validates :current_date, :current_weight, presence: true
  validate :date_cannot_be_in_the_future

  private

  def date_cannot_be_in_the_future
    if current_date.present? && current_date > user.target_date
      errors.add(:current_date, "can not be in the future then your target date.If you want to proceed tracking your weight, go to your account information and edit your target weight.")
    end
  end
end