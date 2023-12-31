class User < ApplicationRecord
  has_many :daily_weights, dependent: :destroy
  has_one :progress_chart, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :target_weight, :target_date, presence: true

  validates :username, format: { with: /\A[\p{L}\p{N}]*\z/, message: 'は英語、日本語、数字で入力してください' }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  def target_date
    self[:target_date]
  end
end
