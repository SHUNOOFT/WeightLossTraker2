class ProgressChart < ApplicationRecord
  belongs_to :user
  belongs_to :daily_weight


  def update_chart_data(date, weight)
    self.data ||= [] # データが nil の場合は初期化
    self.data << { date: date, weight: weight }
    save
  end
end