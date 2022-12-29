class PostBook < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, length: {maximum: 100}
  validates :body, presence: true, length: {maximum: 100}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
