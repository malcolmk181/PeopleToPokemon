class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to posts_path
        else
            flash[:error] = "There was an error in your username or password."
            redirect_to signup_path
        end
        
    end

    def show
        redirect_to login_path unless session[:user_id]
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def record_not_found
        session[:user_id] = nil
        redirect_to login_path
    end

end