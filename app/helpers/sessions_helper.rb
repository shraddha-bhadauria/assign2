module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    session[:email]=user.email
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Member.find_by(id: session[:member_id])
  end
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
    reset_session
  end


end