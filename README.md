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

| Column             | Type       | Options                        |
|----------------    |------------|--------------------------------|
| current_date       | date       | null: false                    |
| current_weight     | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :progress_chart

## progress_charts table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| data               | Json       | null: false                    |
### Association

- belongs_to :user



アプリ名：Weight Tracker
アプリケーション概要
Weight Trackerは、ユーザーの体重管理を支援するアプリケーションです。体重の記録、進捗の追跡、目標設定など、ダイエットや健康管理をサポートします。

URL
https://weightlosstraker.onrender.com

テスト用アカウント
ユーザー名: [shunooft1997100819971008@gmail.com]
パスワード: [Shunooft1997]

利用方法:
アカウントを作成しログインします。
「体重を記録する(Track your weight)」から毎日の体重を入力します。
「進捗を確認する(Progress chart)」で体重の変化をグラフで確認できます。
目標体重を設定して、体重増減の進捗を追跡、管理いたします。
「進捗を確認する(Progress chart)」ボタンは「体重を記録する(Track your weight)」でデータを入力して初めてホームページにてボタンが現れる仕様となっております。

アプリケーションを作成した背景:
多くの人がダイエットや健康管理で苦労している中、継続的な体重管理とが成功の鍵となります。このアプリは、体重管理を簡単かつ効果的に行うことで、ユーザーの健康維持を支援します。

洗い出した要件
[要件定義スプレッドシートのリンク]

実装した機能についての画像やGIFおよびその説明
体重記録機能：ユーザーは毎日の体重を簡単に記録できます。
進捗グラフ：記録された体重の変化をグラフで視覚化します。
目標設定：目標体重を設定し、進捗を追跡できます。
実装予定の機能
食事記録機能
運動記録機能
データベース設計
[ER図の添付]

画面遷移図
[画面遷移図の添付]

開発環境
言語: Ruby, JavaScript
フレームワーク: Ruby on Rails
データベース: PostgreSQL
その他: Docker, AWS, GitHub
ローカルでの動作方法
shell
Copy code
$ git clone [リポジトリURL]
$ cd [プロジェクトディレクトリ]
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
工夫したポイント
レスポンシブデザイン: スマートフォンやタブレットでも快適に使用できるようにしました。
ユーザーフレンドリーなUI/UX: 直感的な操作が可能なインターフェースを心がけました。
高い拡張性: 将来的な機能追加を容易にするため、コードの再利用性を高めました。
GIFの挿入
体重記録機能のデモ
進捗グラフの表示
目標設定の操作
