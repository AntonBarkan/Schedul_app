class SessionsController < ApplicationController

  #def login
  #  #What data comes back from OmniAuth?
  #  @auth = request.env["omniauth.auth"]
  #  #Use the token from the data to request a list of calendars
  #  @token = @auth["credentials"]["token"]
  #  client = Google::APIClient.new
  #  client.authorization.access_token = @token
  #  service = client.discovered_api('calendar', 'v3')
  #  @result = client.execute(
  #      :api_method => service.calendar_list.list,
  #      :parameters => {},
  #      :headers => {'Content-Type' => 'application/json'})
  #end

  def new
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        sign_in user
        flash[:success] = "Welcome #{user.name}"
        redirect_to user
      else
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
      end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
