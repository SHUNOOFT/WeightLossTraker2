class CreateDailyWeights < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_weights do |t|
      t.date       :current_date,   null: false
      t.decimal    :current_weight, precision: 4, scale: 1, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
