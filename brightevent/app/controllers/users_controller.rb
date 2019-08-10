class UsersController < ApplicationController
    def new 
        @user = User.new 
    end
    def create
        @user = User.new params.require(:user).permit(
            :first_name, 
            :last_name, 
            :email, 
            :password, 
            :password_confirmation
        )
        if @user.save
            session[:user_id] = @user.id
            redirect_to events_path
        else 
            render 'new'
        end
    end
    def show 
        @user = User.find(user_params)
    end 
end
