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
- belongs_to :progress

## daily_weights table

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| current_date   | string     | null: false                    |
| current_weight | text       | null: false                    |
| target_weight  | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :progress

## progress_charts table

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| current_date   | references | null: false, foreign_key: true |
| current_weight | references | null: false, foreign_key: true |
| target_weight  | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_many :daily_weights
