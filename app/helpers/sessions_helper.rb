module SessionsHelper
    
    
    def block_access
        if current_user.present?
            redirect_to users_path
        end
    end
    
    #def helper_sign_in
    #    session[:user_id] = @user.id
    #end

    def helper_actual_user 
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # Returns the current logged-in user (if any).
    def current_user
        if session[:user_id]
          @current_user ||= User.find(session[:user_id])
        else
          @current_user = nil
        end
    end

    def current_user_byid
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
    
end
