class ApplicationController < ActionController::Base
    protect_from_forgery unless: -> { request.format.json? }
    before_action :require_login
    
    def encode_token(payload)
        JWT.encode(payload, 'my_secret')
    end
    # change to random string!!

    def auth_header
        byebug
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'my_secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                []
            end
        end
    end

    def session_user
        decoded_hash = decoded_token
        if !decoded_hash.empty?
            puts decoded_has.class
            user_id = decoded_has[0][user_id]
            @user = User.find_by(id: user_id)
        else
            nil
        end
    end

    def logged_in?
        !!session_user
    end

    def require_login
        render json: {message: 'Please login to view this page!}'}, status: :unauthorized unless logged_in?
    end

end
