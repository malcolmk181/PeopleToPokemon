class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to login_path, notice: "Account was successfully created."
          else
            render :new
          end
    end

    def show
        redirect_to login_path unless session[:user_id]
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end