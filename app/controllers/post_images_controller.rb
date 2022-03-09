class PostImagesController < ApplicationController

  # 新規データ定義
  def new
    @post_image = PostImage.new
  end


   # 投稿データの保存
  def create
    # 新規データ定義
    @post_image = PostImage.new(post_image_params)
    # ログイン中のユーザーidをpost_image.user_idと定義
    @post_image.user_id = current_user.id

    # 新規データ保存
    @post_image.save
    # post_images_pathへ移動
    redirect_to post_images_path
  end


  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
