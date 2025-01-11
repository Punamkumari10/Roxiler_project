
class User < ApplicationRecord
  has_secure_password

  enum role: { system_admin: 0, normal_user: 1, store_owner: 2 }

  has_many :stores, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :name, presence: true, length: { minimum: 20, maximum: 60 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8, maximum: 16 }, format: { with: /(?=.*[A-Z])(?=.*\W)/ }
end
