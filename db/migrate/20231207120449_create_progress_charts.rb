class CreateProgressCharts < ActiveRecord::Migration[7.0]
  def change
    create_table :progress_charts do |t|
      t.references :user, null: false, foreign_key: true
      t.json       :data            # 'data' カラムを JSON 型で追加

      t.timestamps
    end
  end
end