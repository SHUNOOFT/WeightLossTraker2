class ProgressChart < ApplicationRecord
  belongs_to :user
  belongs_to :daily_weight


  def update_chart_data(date, weight)
    # データを更新するロジックをここに追加

  end
end