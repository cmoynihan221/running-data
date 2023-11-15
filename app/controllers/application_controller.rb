class ApplicationController < ActionController::API

  before_action :authorize, except: :health
  attr_reader :current_token

  def health
    head :no_content
  end

  def authorize
    begin
      validate_token
    rescue JWT::DecodeError => e
      render json: { errors: "Auth Failed: #{e.message}"}, status: :unauthorized
    end
  end

  private

  def raw_token
    @raw_token ||= request.headers['Authorization']&.split(' ')&.last || params[:auth_token]
  end

  def validate_token
    decoded = JsonWebToken.decode(raw_token)
    raise(JWT::DecodeError, 'Wrong type of token') unless decoded && decoded['type'] == 'auth'
  end
end
