class AuthController < ApplicationController
    skip_before_action :require_login, only: [:login, :auto_login]

    def login
        user = User.find_by(username: user_params[:username])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token, success: "Welcome back, #{user.username}!"}
        else
            render json: {failure: "Invalid username or password! Please try again."}
        end
    end

    def auto_login
        if session_user
            render json: session_user
        else
            render json: {errors: "No one has logged in!"}
        end
    end

    def user_is_authed
        render json: {message: "User authorized!"}
    end

end