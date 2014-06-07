class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

   def edit
     @user = User.find(params[:id])
   end

   def update
     @user = User.find params[:id]
     #create function that will do it
     @user.update_attribute(:name, params[:user][:name])
     @user.update_attribute(:l_name, params[:user][:l_name])
     @user.update_attribute(:phone, params[:user][:phone])
     @user.update_attribute(:email, params[:user][:email])
     @user.update_attribute(:id_number, params[:user][:id_number])
     @user.update_attribute(:position, params[:user][:position])
     @user.update_attribute(:shabat, params[:user][:shabat])
     @user.update_attribute(:admin, params[:user][:admin])
     flash[:notice] = "#{@user.name} was successfully updated."
     redirect_to showall_path
   end

   def create
     @user = User.new(user_params)
     if @user.save
       flash[:success] = "Welcome to the Schedule App!"
       sign_in @user
       redirect_to @user
     else
       render 'new'
     end
   end

   private

  def update_params
    params.require(:user).permit(:name, :l_name, :phone, :email, :id_number, :position, :shabat, :admin)
  end

   def user_params
     params.require(:user).permit(:name, :l_name, :phone, :email, :password,
                                  :password_confirmation, :id_number, :position, :shabat, :admin)
   end

end
