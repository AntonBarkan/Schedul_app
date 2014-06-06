class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
<<<<<<< HEAD

    #require "gcal4ruby"
    #@serv = Service.new
    #@serv.debug = false
    #@serv.authenticate 'simplesheduleapp@gmail.com', '1@3$5^7*'
    #events = GCal4Ruby::Event.find serv, {'start-min' => Time.now.utc.xmlschema,
                                          #:calendar => 'example-cal%40example.com'}


    #require_relative "home/dima//Desktop/CloudCourse/sample_app/bin/google_calendar"

    #cal = Google::Calendar.new(:username => 'simplesheduleapp@gmail.com',
    #                           :password => '1@3$5^7*',
    #                           :app_name => 'scheduleapp')

    #@evnts = cal.events
=======
>>>>>>> master
  end

  def new
    @user = User.new
  end

   def edit
     @user = User.find(params[:id])
   end

   def update
     @user = User.find params[:id]
     #@user.update_attributes!(params[user_params])
     User.update(params[:id], :name => 'Hello')
     @user.update(:name => 'Hello')
     @user.update(params[:admin])
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

   def user_params
     params.require(:user).permit(:name, :l_name, :phone, :email, :password,
                                  :password_confirmation, :id_number, :position, :shabat, :admin)
   end

end
