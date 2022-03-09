class PostImage < ApplicationRecord
  # imageを持たせる
  has_one_attached :image
  # userに属する
  belongs_to :user
  # post_commentsと関係
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


  # 画像が投稿されていない場合はを考慮
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
