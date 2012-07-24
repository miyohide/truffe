class IndexController < ApplicationController
  USERS = { "solo" => "monk" }

  before_filter :authenticate

  def index
  end

  def profile
    @basic_data = BasicData.where('id = 1').first
  end

  private

  def contacts
  end

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
