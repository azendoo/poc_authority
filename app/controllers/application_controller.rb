class ApplicationController < ActionController::Base
  before_filter :authenticate_user!

  private

  def current_user
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

end
