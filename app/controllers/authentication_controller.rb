class AuthenticationController < ApplicationController
    def login
        @user = User.find_by(username: params[:user][:username])
        
        if (@user&.authenticate(params[:user][:password]))
           @token = JWT.encode({
               user_id: @user.id,
               exp: 24.hours.from_now.to_i
            }, Rails.application.secrets.secret_key_base)
          
           render json: { token: @token, user: {id: @user.id, username: @user.username}}, status: :ok
        else 
            render json: { error: "Invalid credentials" }, status: :unauthorized
        end
    end 
end
