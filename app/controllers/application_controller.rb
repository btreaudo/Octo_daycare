 class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    def authenticate_admin_user!
      raise SecurityError unless current_user.try(:admin?)
  end

  rescue_from SecurityError do |exception|
    redirect_to root_url, alert: 'You do no have access to that feature.'
  end
end