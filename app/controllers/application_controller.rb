class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordNotFound, with: :server_error

  def not_found
    render file: "public/404.html", layout: false, status: 404
  end

  def server_error
    render file: "public/500.html", layout: false, status: 500
  end
end
