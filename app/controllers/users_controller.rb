class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
     render json: { user: current_user }, status: :accepted
    end 

    def create
       @user =  User.new(user_params)
       if @user.save
            render json: @user, status: :created
       else
            render json: { error: "invalid username" }, status: :bad_request
       end
    end 


    private 

    def user_params
        params.permit(:username, :password)
    end 
end
