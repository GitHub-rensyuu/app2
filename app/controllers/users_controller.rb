class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    # アソシエーションを持っているモデル同士の記述
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.save
    redirect_to user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
