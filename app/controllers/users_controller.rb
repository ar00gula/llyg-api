class UsersController < ApplicationController
    skip_before_action :require_login

    def index
        users = User.all
        render json: users
        # (:include => [:author, :reviews])
    end

    def create
            user = User.create(username: user_params[:username], password: user_params[:password])
            byebug
            if user.valid?
                payload = {user_id: user.id}
                token = encode_token(payload)
                puts token
                render json: {user: user, jwt: token}
            else
                render json: {errors: "Something went wrong!"}
                # user.errors.full_messages}
            end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end