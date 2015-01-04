class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  protected

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        @current_user = User.find_by(auth_token: token)
      end
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm = "Posts"'
      render json: 'Bad credentials', status: :unauthorized 
    end

    attr_reader :current_user

end
