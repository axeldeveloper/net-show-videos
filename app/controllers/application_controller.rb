class ApplicationController < ActionController::Base
    
    helper_method :current_user

    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    include SessionsHelper
    
    def authorize
        unless logged_in?
          redirect_to root_url
        end
    end
    
    
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        @current_user = nil
      end
    end


end
