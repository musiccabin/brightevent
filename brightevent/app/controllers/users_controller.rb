class UsersController < ApplicationController
    def new 
        @user = User.new 
    end

    def create
        @user = User.create params.require(:user).permit(
            :first_name, 
            :last_name, 
            :email, 
            :password, 
            :password_confirmation)
        if @user.save
            session[:user_id] = @user.id # What does this one do? 
            redirect_to root_path
        else 
            render 'new'
        end
    end 
end
