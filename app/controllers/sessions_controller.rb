class SessionsController < ApplicationController

    def new
       
    end

    def create
        # must be an existing account, password must be correct
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to posts_path
        else
            flash[:error] = "Account username or password is incorrect"
            redirect_to login_path
        end        
    end

    def destroy
        session.delete :user_id
        redirect_to login_path
    end

end