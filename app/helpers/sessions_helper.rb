module SessionsHelper
  def log_in(member)
    session[:member_id] = member.id
    session[:email]=member.email
  end
end
