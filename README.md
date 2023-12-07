# README
# DB 設計

## users table

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| username           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| target_weight      | string | null: false               |
| target_date        | string | null: false               |

### Association

- has_many :daily_weights
- has_one :progress_chart

## daily_weights table

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| current_date   | date       | null: false                    |
| current_weight | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :progress_chart

## progress_charts table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| user          | references | null: false, foreign_key: true |
| daily_weight  | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_many :daily_weights
