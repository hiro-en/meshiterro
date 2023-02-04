class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to post_images_path
    end
    
    
    @user = User.find(params[:id])
  end
  
  def update
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to post_images_path
    end
    
    @user = User.find(params[:id])
    @user.update(users_params)
    redirect_to user_path(@user.id)
  end
  
  private
  
  def users_params
    params.require(:user).permit(:name, :profile_image)
  end
end
