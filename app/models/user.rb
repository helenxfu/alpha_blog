class User < ApplicationRecord
  has_many :articles
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6, maximum: 50 }
  # Turns out that since PostgreSQL is inherently case-sensitive, adding the case_insensitive validation to a model has no effect on a Postgresql db backed app
end