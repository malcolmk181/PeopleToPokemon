class SessionsController < ApplicationController

    def new
       
    end

    def create
        # must be an existing account, password must be correct
        @user = User.find_by(name: params[:name])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/'
    end

    def destroy
        session.delete :user_id
        redirect_to signup_path
    end

end