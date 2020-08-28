class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) } # “stabby lambda” syntax for an object called a Proc (procedure) or lambda, which is an anonymous function. The stabby lambda -> takes in a block and returns a Proc, which can then be evaluated with the call method.
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  # Note the use of validate (as opposed to validates) to call a custom validation.
  validate :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5mb")
    end
  end
end
