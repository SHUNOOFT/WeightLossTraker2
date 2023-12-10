class ProgressChartsController < ApplicationController
  def index
    @progress_chart = ProgressChart.find_by(user_id: params[:user_id])
    @progress_chart_data = @progress_chart&.data || []

    # 過去一か月のデータを取得
    if @progress_chart
      one_month_ago = Date.today - 1.month
      chart_data = @progress_chart.data.select { |entry| Date.parse(entry['date']) >= one_month_ago }

      # Chartkickで利用するためのデータ形式に変換
      @progress_chart_data = chart_data.map { |entry| [entry['date'], entry['weight'].to_f] }.to_h
    else
      @progress_chart_data = {}
    end
  end
end