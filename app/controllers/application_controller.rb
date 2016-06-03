class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_403
	render file: "public/403.html", status: 403, layout: false
  end

  def load_user
	@user = current_user
  end

  def signed_in
	render_403 unless user_signed_in?
  end

end
