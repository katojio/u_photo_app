class OauthTokenRequestUrlBuilder
  URL = 'http://unifa-recruit-my-tweet-app.ap-northeast-1.elasticbeanstalk.com/oauth/token'.freeze
  REDIRECT_URI = 'http://localhost:3000/oauth/callback'.freeze
  GRANT_TYPE = 'authorization_code'.freeze

  attr_reader :uri

  def initialize(params)
    @uri = URI.parse(URL)
    @code = params[:code]
  end

  def params
    {
      code: @code,
      client_id: Rails.application.credentials.oauth[:client_id],
      client_secret: Rails.application.credentials.oauth[:client_secret],
      redirect_uri: REDIRECT_URI,
      grant_type: GRANT_TYPE
    }
  end
end
