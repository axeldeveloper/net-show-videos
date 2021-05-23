class SessionsController < ApplicationController

    before_action :block_access, except: [:destroy]
  
    def new
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            log_in user
            redirect_to root_url, notice: "Logged in!"
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render "new"
        end
    end

    def destroy
        log_out if logged_in?
        redirect_to root_url, notice: "Logged out!"
    end
end
