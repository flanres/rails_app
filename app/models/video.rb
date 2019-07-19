class Video < ApplicationRecord

  has_many  :likes, dependent: :destroy
  has_many  :good_users, through: :likes, source: :user

  # Videoをいいねする
  def good(user)
    likes.create(user_id: user.id)
  end

  # Videoのいいねを解除する
  def not_bad(user)
    likes.find_by(user_id: user.id).destroy
  end

  # 現在のユーザーがいいねしてたらtrueを返す
  def good?(user)
    good_users.include?(user)
  end

end