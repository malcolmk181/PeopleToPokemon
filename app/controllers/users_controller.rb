class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        User.create(user_params)
        redirect_to login_path
    end

    def show
        redirect_to login_path unless session[:user_id]
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end