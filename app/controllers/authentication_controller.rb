# frozen_string_iteral: true

class AuthenticationController < ApplicationController
  # skip_before_action :authenticate_request, only: [:login]
  skip_before_action :authenticate_cookie, only: [:login]

  # POST /auth/login
  def login
    # email = params["email"]
    # password = params["password"]
    # if email && password
    #   login_hash = User.handle_login(email, password)
    #   if login_hash
    #     cookies.signed[:jwt] = {value:  login_hash[:token], httponly: true}
    #     render json: { 
    #       user_id: login_hash[:user_id],
    #       name: login_hash[:name],
    #     }
    #   else
    #     render json: {status: 'incorrect email or password', code: 422}  
    #   end
    # else
    #   render json: {status: 'specify email address and password', code: 422}
    # end
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      # created_jwt = issue_token({user_id: @user.id})
      cookies.signed[:jwt] = {value:  token, httponly: true}
      render json: { token:, admin: @user.admin }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
