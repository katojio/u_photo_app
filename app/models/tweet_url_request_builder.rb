class TweetUrlRequestBuilder
  URL = 'http://unifa-recruit-my-tweet-app.ap-northeast-1.elasticbeanstalk.com/api/tweets'.freeze

  attr_reader :uri

  def initialize(params:, access_token:)
    @uri = URI.parse(URL)
    @user_photo = UserPhoto.find(params[:photo_id])
    @access_token = access_token
  end

  def call
    request = Net::HTTP::Post.new(
      @uri.path,
      {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{@access_token}"
      }
    )

    request.body = {
      text: @user_photo.title,
      url: photo_url
    }.to_json

    request
  end

  private def photo_url
    filename = @user_photo.photo.filename.to_s
    "http://localhost:3000/photos/#{filename}"
  end
end
