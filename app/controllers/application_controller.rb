class ApplicationController < ActionController::API
  protected

  def not_found(error_message)
    render json:
      {
        error: :not_found,
        message: error_message
      },
      status: :not_found
  end

  def protected_against_modification(error_message)
    render json:
      {
        error: :method_not_allowed,
        message: error_message
      },
      status: :method_not_allowed
  end

  def render_404(error_message)
    render json: {
      error: :bad_request,
      message: error_message
    },
    status: :bad_request
  end
end
