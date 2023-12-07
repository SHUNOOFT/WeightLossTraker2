class CreateProgressCharts < ActiveRecord::Migration[7.0]
  def change
    create_table :progress_charts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :daily_weight, null: false, foreign_key: true

      t.timestamps
    end
  end
end