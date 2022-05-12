class ApplicationController < ActionController::API
  include JsonWebToken
  include ::ActionController::Cookies

  # before_action :authenticate_request
  before_action :authenticate_cookie

  def authenticate_cookie
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = User.find_by(id: decoded_token["user_id"])
    end
    if user then return true else render json: {status: 'unauthorized', code: 401} end
  end

  def current_user
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = User.find_by(id: decoded_token["user_id"])
    end
    if user then return user else return false end
  end

  # private

  # def authenticate_request
  #   header = request.headers['Authorization']
  #   header = header.split.last if header
  #   # jwt = cookies.signed[:jwt]
    
  #   decoded = jwt_decode(header)
  #   @current_user = User.find(decoded[:user_id])
  # end
end
