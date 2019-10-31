module SessionsHelper
  def log_in(outhuser)
    session[:outhuser_id] = outhuser.id
  end
  def current_user
    if session[:outhuser_id]
      @current_user ||= OuthUser.find_by(id: session[:outhuser_id])
    end
  end
  def log_out
    session.delete(:outhuser_id)
    @current_user = nil
  end
end
