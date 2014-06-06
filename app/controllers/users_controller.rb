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
     #@user.update_attributes(params[update_params])
     params[:user].delete(:password_digest) if params[:user][:password_digest].blank?
     params[:user].delete(:remember_token) if params[:user][:remember_token].blank?
     @user.update_attributes(params[:user])
     #User.update(params[:id], :name => 'Hello')
     #@user.update_attribute(:name, params[:name])
     #@user.update_attribute(:l_name, params[:l_name])
     #@user.update_attribute(:id_number, params[:id_number])
     #@user.update_attribute(:name, params[:name])
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
