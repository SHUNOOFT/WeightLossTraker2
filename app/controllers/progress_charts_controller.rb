class ProgressChartsController < ApplicationController
  def index
    # DailyWeight から user を取得
    daily_weight = DailyWeight.find(params[:daily_weight_id])
    user = daily_weight.user

    # user に関連する ProgressChart を取得
    @progress_chart = ProgressChart.find_by(user: user)

    # チャートデータの初期化
    @progress_chart_data = {}

    # プログレスチャートが存在する場合のみデータ変換
    if @progress_chart
      one_month_ago = Date.today - 1.month
      chart_data = @progress_chart.data.select { |entry| Date.parse(entry['date']) >= one_month_ago }

      # Chartkickで利用するためのデータ形式に変換
      @progress_chart_data = chart_data.each_with_object({}) do |entry, hash|
        hash[entry['date']] = entry['weight'].to_f
      end
    end
  end
end