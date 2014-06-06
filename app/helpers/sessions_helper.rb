module SessionsHelper

  def sign_in (user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def admin?
    !current_user.nil? && current_user.admin == 'yes'
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
<<<<<<< HEAD
    if(current_user.nil?)
=======
    if(current_user  == nil)
>>>>>>> master
      return
    end
    current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end


end
