class Calendar::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @calndr = Calendar.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

    if @calndr.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @calendar, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to root_url
    end
  end
end