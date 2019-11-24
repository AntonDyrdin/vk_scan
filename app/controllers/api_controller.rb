class ApiController < ActionController::API
  include ErrorHandler
  rescue_from StandardError do |e|
    render json: {
      error: e
    }, status: 500
  end
end