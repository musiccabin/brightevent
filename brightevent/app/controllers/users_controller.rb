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
            :password_confirmation,
            :tag_names
        )
                    

        if @user.save
            session[:user_id] = @user.id
            redirect_to events_path
        else 
            render 'new'
        end
    end
    
    def show 
        @user = User.find(params[:id])
    end 
    
    def edit
        @user = User.find(params[:id])
    end

    def update
        if current_user.update user_params
          redirect_to user_path, notice: 'your information is updated.'
        else
          render :edit
        end
    end   

    private
    def user_params
      params.require(:user).permit(:first_name,:last_name, :email,:tag)
    end
end

