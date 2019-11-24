module ErrorHandler
  extend ActiveSupport::Concern

  def handle_error_in_development(exception)
    logger.error(exception.message)
    logger.error(exception.backtrace.join("\n"))

    render json: { error: { message: exception.message, backtrace: exception.backtrace }, data: {} }, status: 500
  end

  def handle_error(message, status = 500)
    render(
      json: {
        error: message,
      },
      status: status
    )
  end
end
