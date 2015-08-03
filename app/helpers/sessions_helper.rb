module SessionsHelper

  # signs in given user
  def sign_in(user)
    session[:user_id] = user.id
  end

  # returns current signed in user, if any
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #returns true if a user is signed in
  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end



end
