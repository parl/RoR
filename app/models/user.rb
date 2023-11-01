class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
