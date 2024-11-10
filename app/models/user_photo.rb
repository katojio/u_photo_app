class UserPhoto < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :title, presence: true, length: { maximum: 30 }
  validate :check_photo

  private def check_photo
    errors.add(:photo, :blank) if photo.blank?
  end
end
