class ProgressChart < ApplicationRecord
  belongs_to :user

  def update_chart_data(daily_weight)
    self.data ||= []
    self.data.reject! { |entry| entry['date'] == daily_weight.current_date.to_s }
    self.data << { date: daily_weight.current_date.to_s, weight: daily_weight.current_weight }
    save
  end

  def remove_chart_data(param)
    self.data ||= []
    date = param.is_a?(DailyWeight) ? param.current_date.to_s : param.to_s
    self.data.reject! { |entry| entry['date'] == date }
    save
  end
end
