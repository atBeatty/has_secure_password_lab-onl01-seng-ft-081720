class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if !@user.nil? && !params[:user][:password].nil? && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/'
        else
            redirect_to '/users/new'
        end

    end

end
# 