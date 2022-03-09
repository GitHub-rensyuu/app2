class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      # 投稿画像のid,店の名前、画像の説明、投稿ユーザーid
      t.string:shop_name
      t.text:caption
      t.integer:user_id

      t.timestamps
    end
  end
end
