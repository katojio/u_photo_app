class PhotosController < ApplicationController
  def index
    @user_photos = current_user.user_photos.order(created_at: :desc)
    @tweetable = session[:access_token].present?
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

  def tweets
    request_builder = TweetRequestBuilder.new(params:, access_token: session[:access_token])
    uri = request_builder.uri

    Net::HTTP.start(uri.host, uri.port) do |http|
      http.request(request_builder.call)
    end

    redirect_to photos_path
  end

  private def user_photo_params
    params.require(:user_photo).permit(:title, :photo)
  end
end
