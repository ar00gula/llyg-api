class AuthController < ApplicationController
    skip_before_action :authorized
  
    def login
      @user = User.find_by(username: params[:username])
      #User#authenticate comes from BCrypt
      if @user && @user.authenticate(params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
      else
        render json: { message: 'Invalid username or password' }
      end
    end
  
  end 