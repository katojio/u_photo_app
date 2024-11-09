class OauthAuthorizeRedirectUrlBuilder
  URL = 'http://unifa-recruit-my-tweet-app.ap-northeast-1.elasticbeanstalk.com/oauth/authorize'.freeze
  RESPONSE_TYPE = 'code'.freeze
  REDIRECT_URI = 'http://localhost:3000/oauth/callback'.freeze
  SCOPE = 'write_tweet'.freeze

  def self.call
    params = {
      client_id: Rails.application.credentials.oauth[:client_id],
      response_type: RESPONSE_TYPE,
      redirect_uri: REDIRECT_URI,
      scope: SCOPE
    }

    uri = URI.parse(URL)
    uri.query = params.to_param

    uri.to_s
  end
end
