class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) } # “stabby lambda” syntax for an object called a Proc (procedure) or lambda, which is an anonymous function. The stabby lambda -> takes in a block and returns a Proc, which can then be evaluated with the call method.
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end