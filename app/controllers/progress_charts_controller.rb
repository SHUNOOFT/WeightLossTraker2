class ProgressChartsController < ApplicationController
  def index
    # DailyWeight から user を取得
    daily_weight = DailyWeight.find(params[:daily_weight_id])
    user = daily_weight.user

    # user に関連する ProgressChart を取得
    @progress_chart = user.progress_chart

    # チャートデータの初期化とy軸の範囲の初期化
    @progress_chart_data = {}
    @y_min = 0
    @y_max = 100

    return unless @progress_chart && @progress_chart.data.any?

    one_month_ago = Date.today - 1.month
    chart_data = @progress_chart.data.select { |entry| Date.parse(entry['date']) >= one_month_ago }

    # Chartkickで利用するためのデータ形式に変換
    @progress_chart_data = chart_data.each_with_object({}) do |entry, hash|
      hash[entry['date']] = entry['weight'].to_f
    end

    # 最新の体重を取得してグラフの範囲を設定
    latest_weight = chart_data.map { |d| d['weight'].to_f }.max
    weight_range = 5 # 体重の変動幅 +/- 5kg
    @y_min = latest_weight - weight_range
    @y_max = latest_weight + weight_range
  end
end
