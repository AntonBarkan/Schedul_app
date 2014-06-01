class UsersController < ApplicationController

   def show
    @user = User.find(params[:id])
    @schedule = [true,true,true]
  end

  def new
    @user = User.new

  end

   def submit
     arr = Hash.new
     params['string'].split('$').each do |param|
       splitted = param.split('=')
        arr[splitted[0]] = splitted[1]
     end
   end


   def create
     @user = User.new(user_params)
     if @user.save
       flash[:success] = "Welcome #{@user.name}!"
       redirect_to @user
     else
       render 'new'
     end
   end

   private

   def user_params
     params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
   end

end
