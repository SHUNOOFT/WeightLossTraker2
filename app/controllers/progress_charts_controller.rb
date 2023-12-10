class ProgressChartsController < ApplicationController
  def index
    # この部分で、適切な ProgressChart レコードを取得
    @progress_chart = ProgressChart.find_by(user_id: params[:user_id]) # または他の方法で適切なレコードを取得

    # JSON 形式でデータを設定
    @progress_data_json = @progress_chart&.data.to_json
  end
end