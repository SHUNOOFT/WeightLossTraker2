class DailyWeight < ApplicationRecord
  belongs_to :user
  has_one :progress_chart, through: :user

  after_create :create_progress_chart

  validates :current_date, :current_weight, presence: true
  validate :date_cannot_be_in_the_future
  validate :unique_current_date_per_user

  private

  def date_cannot_be_in_the_future
    if current_date.present? && current_date > user.target_date
      errors.add(:current_date, "that you selected already exists. If you want to edit the data, go to Edit Record to edit your Daily Weight data.")
    end
  end

  def unique_current_date_per_user
    existing_record = user.daily_weights.where(current_date: current_date).where.not(id: id).exists?
    errors.add(:current_date, "The data of your date that you selected already exists.If you want to edit the data,go to Edit Record to edit your Daily Weight data.") if existing_record
  end

  def create_progress_chart
    user.create_progress_chart unless user.progress_chart
  end
end