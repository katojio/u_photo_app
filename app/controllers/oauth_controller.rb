class OauthController < ApplicationController
  def authorize
    redirect_to OauthAuthorizeRedirectUrlBuilder.call
  end

  def callback
    url_builder = OauthTokenRequestUrlBuilder.new(params)
    response = Net::HTTP.post_form(url_builder.uri, url_builder.params)

    return unless response.code == '200'

    session[:access_token] = JSON.parse(response.body)["access_token"]
    redirect_to photos_path
  end
end
