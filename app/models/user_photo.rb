class UserPhoto < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :title, presence: true, length: { maximum: 30 }
  validate :check_photo

  private def check_photo
    if photo.blank?
      errors.add(:base, '画像ファイルを入力してください')
    end
  end
end
