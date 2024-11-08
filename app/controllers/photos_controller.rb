class PhotosController < ApplicationController
  def index
    @user_photos = current_user.user_photos.order(created_at: :desc)
  end

  def new
    @user_photo = current_user.user_photos.build
  end

  def create
    user_photo = current_user.user_photos.build(user_photo_params)

    if user_photo.save
      redirect_to photos_path
    else
      @error_messages = user_photo.errors.full_messages
      @user_photo = current_user.user_photos.build
      render 'new'
    end
  end

  private def user_photo_params
    params.require(:user_photo).permit(:title, :photo)
  end
end
