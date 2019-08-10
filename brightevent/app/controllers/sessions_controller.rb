class SessionsController < ApplicationController
    def new   
    end
    def create 
        user = User.find_by_email params[:email]
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "Signed in!"
            redirect_to events_path
          else
            flash[:danger] = "Wrong email or password"
            render :new
          end
        end
    def destroy 
        session[:user_id] = nil
        flash[:danger] = "Logged out!"
        redirect_to root_path
    end 
end
