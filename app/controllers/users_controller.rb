require 'rubygems'
require 'date'

class UsersController < ApplicationController


 
  def show

    @user = User.find(params[:id])
    if @user.id != current_user.id
        redirect_to new_session_url
    end
    @days_of_week = weekdays(1)
    @days_of_week2 = weekdays(2)

    @arr1 = current_user.position == 'part' ? getPartDayArray(@days_of_week[0]) :  getDaysArray(@days_of_week[0])
    @arr2 = current_user.position == 'part' ? getPartDayArray(@days_of_week2[0]) :  getDaysArray(@days_of_week2[0])



  end

  def new
    @user = User.new

  end

   def edit
     @user = User.find(params[:id])
   end

   def settings
     @user = get_user
   end

  def show_calendar
    @days_of_week = weekdays(1)

    @days_of_week2 = weekdays(2)
    @firstShiftsMap = createHash weekdays(1)
    @secondShiftsMap = createHash weekdays(2)

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

    def change_password
      @user = get_user
    end

    def update_password
      @user = get_user
    end

   def create
     @user = User.new(user_params)
     if @user.save
       #flash[:success] = "Welcome to the Schedule App!"
       #sign_in @user  # only Admin will add new users
         redirect_to :action => 'showall', :controller => 'static_pages'
     else
       render 'new'
     end
   end

  def destroy
    User.destroy(params[:id])
    redirect_to root_path
  end

  def allschedule
    week_select = @week
    @days_of_week = weekdays(week_select)
  end

  def submit

    counter = 1
    params['string'].split(';').each do |param|
      puts "params : #{params['string']}"
      parsed = param.split(':')
      arr = Hash.new
      parsed[1].split('$').each do |day|
        splitted = day.split('=')
        arr[splitted[0]] = splitted[1]
      end
      create_events(arr, weekdays(counter)[0])
      counter += 1
    end
  end

  def submit_part
    submit
  end

  def weekdays(week)
    t = Time.now
    t +=   (60*60*24*7) if week == 2
    ans = Hash.new
    temp_t = t.wday
    while temp_t != 0
      t -= (60*60*24)
      temp_t = t.wday
    end
    7.times do
      ans[t.wday] = t.strftime("%d/%m/%Y")
      t += (60*60*24)
    end
    ans
  end

   private

  def createHash(day_arr)
    shiftMap = Hash.new


    ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'].each do |day_name|
      create_array  day_name, shiftMap
    end

    #submited_array.each do |submit|
      ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'].each do |day_name|
        create_events_for_calendar day_name, day_arr[0], shiftMap
      #end
      end
    shiftMap
  end

  def create_events_for_calendar(day_name, day, hash_map )
    shifts = Shifts.where(:shift_name => day_name + '_morning' ,:week_number => DateTime.parse(day))
    if !shifts.nil?
      if shifts.kind_of? Shifts
        user = User.find(shifts.user_id)
        hash_map[ day_name + '_morning' ] << user.name + ' ' + user.l_name
      else
        shifts.each do |shift|
          user = User.find(shift.user_id)
          hash_map[ day_name + '_morning' ] << user.name + ' ' + user.l_name
        end
      end
    end

    shifts = Shifts.find_by(:shift_name => day_name + '_evening' ,:week_number => DateTime.parse(day))
    if !shifts.nil?
      if shifts.kind_of? Shifts
        user = User.find(shifts.user_id)
        hash_map[ day_name + '_evening' ] << user.name + ' ' + user.l_name
      else
        shifts.each do |shift|
          user = User.find(shift.user_id)
          hash_map[ day_name + '_evening' ] << user.name + ' ' + user.l_name
        end
      end
    end

    shifts = Shifts.find_by(:shift_name => day_name + '_night' ,:week_number => DateTime.parse(day))
    if !shifts.nil?
      if shifts.kind_of? Shifts
        user = User.find(shifts.user_id)
        hash_map[ day_name + '_night' ] << user.name + ' ' + user.l_name
      else
        shifts.each do |shift|
          user = User.find(shift.user_id)
          hash_map[ day_name + '_night' ] << user.name + ' ' + user.l_name
        end
      end
    end
  end

    def create_array(day, shifts_map)
      shifts_map[day+'_morning']   = Array.new
      shifts_map[day+'_evening']   = Array.new
      shifts_map[day+'_night']     = Array.new
    end

  def getPartDayArray(day)
    arr = Hash.new
    submitedHour = SubmitedHour.find_by(:week_start_date =>  Time.parse(day), :user_id => current_user.id)
    if submitedHour.nil?
      7.times do |index|
        set_false_part(arr, index_to_day(index+1))
      end

      return arr
    end
    7.times do |index|
      set_day_arr_part(arr, submitedHour, index_to_day(index+1))
    end

    arr
  end

  def set_day_arr_part(arr, record, day_of_week)
    arr[day_of_week+'_morning'] = record[day_of_week + '_morning']
    arr[day_of_week+'_evening'] = record[day_of_week + '_evening']
    arr[day_of_week+'_night'] =  record[day_of_week + '_night']

  end

  def set_false_part(arr, day_of_week)
     arr[day_of_week+'_morning'] = false
     arr[day_of_week+'_evening'] = false
     arr[day_of_week+'_night'] = false
  end

  def getDaysArray(day)


    submitedHour = SubmitedHour.find_by(:week_start_date =>  Time.parse(day), :user_id => current_user.id)

     puts '-------------------'
    puts "#{submitedHour.week_start_date}"
    puts '-------------------'

    arr = Hash.new
    if submitedHour.nil?
      arr['Sunday'] = false
      arr['Monday'] = false
      arr['Tuesday'] = false
      arr['Wednesday'] = false
      arr['Thursday'] = false
      arr['Friday'] = false
      arr['Saturday'] = false
      return arr
    end

    arr['Sunday'] = submitedHour.Sunday_morning
    arr['Monday'] = submitedHour.Monday_morning
    arr['Tuesday'] = submitedHour.Tuesday_morning
    arr['Wednesday'] = submitedHour.Wednesday_morning
    arr['Thursday'] = submitedHour.Thursday_morning
    arr['Friday'] = submitedHour.Friday_morning
    arr['Saturday'] = submitedHour.Saturday_morning
    return arr
  end



   def user_params
     params.require(:user).permit(:name, :l_name, :phone, :email, :password,
                                  :password_confirmation, :id_number, :position, :shabat, :admin)
   end

  def check_user
    usr_id = User.find(usr_id)
    usr_check = User.find_by(remember_token: remember_token)
    if(usr_id != usr_check)
      redirect_to root_path
    end
  end



  def create_events(parsed_string, day)

    hours = SubmitedHour.find_by(:week_start_date =>  Time.parse(day), :user_id => current_user.id)
    if (hours.nil?)
      hours = SubmitedHour.create!
      hours.user_id =  current_user.id
      hours.week_start_date= Time.parse(day)
    end

    is_part_position = current_user.position == 'part'

    7.times do |index|
      set_day(hours, index_to_day(index+1), is_part_position, parsed_string)
    end



    hours.save!

  end

  def set_day(hours, day_of_week, is_part_position, parsed_string)
    puts " #{day_of_week}  #{parsed_string[day_of_week + (is_part_position ? ' morning' : '')]}"
    hours[day_of_week + '_morning'] = parsed_string[day_of_week + (is_part_position ? ' morning' : '')]
    hours[day_of_week + '_evening'] = parsed_string[day_of_week + (is_part_position ? ' evening' : '')]
    hours[day_of_week + '_night'] = parsed_string[day_of_week + (is_part_position ? ' night' : '')]
  end




    def index_to_day(index)
      case index
        when 1
          'Sunday'
        when 2
          'Monday'
        when 3
          'Tuesday'
        when 4
          'Wednesday'
        when 5
          'Thursday'
        when 6
          'Friday'
        when 7
          'Saturday'
      end
    end

    def get_user
      remember_token = User.encrypt(cookies[:remember_token])
      User.find_by(remember_token: remember_token)
    end

def getStartDate
    day = 8
    month = 6
    year = 2014

    day_start = Time.now.change({:year => year, :month => month, :day => day , :hour => 0 ,  :min => 0 ,  :sec => 0  })
    day_start
  end

end
