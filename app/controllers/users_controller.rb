class UsersController < ApplicationController

 
  def show
    @user = User.find(params[:id])
    @schedule = [true,true,true]

    #cal = GoogleCalendar::Client.new "688144363652-brriul4ifu7rubps2hspt2c1ujhdth87.apps.googleusercontent.com",
    #                                    "ol6yRPwEtD0g_dN94jzNemo0", "http://localhost/oauth2callback"

    #if(!cal.nil?)
    #  @events = cal.events
    #end
  end

  def new
    @user = User.new

  end

   def edit
     @user = User.find(params[:id])
   end


   def update
     @user = User.find params[:id]
     @user.update_attributes!(params[user_params])
     flash[:notice] = "#{@user.name} was successfully updated."
     redirect_to showall_path
   end



   def create
     @user = User.new(user_params)
     if @user.save
       flash[:success] = "Welcome to the Schedule App!"
       sign_in user
       redirect_to @user
     else
       render 'new'
     end
   end

   private

   def user_params
     params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation, :id_number, :position, :shabat, :admin)
   end

end
