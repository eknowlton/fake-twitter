class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  attr_reader :current_user

  def authenticate_user
    token = request.headers['HTTP_AUTHORIZATION']
    @current_user = User.find_by!(token: token)
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not Authenticated' }, status: :unauthorized
  end

  def record_not_found
    render json: { error: 'Record not found' }
  end
end
