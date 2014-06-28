module UsersHelper

  def getClass(day, week)
    puts "#{day}   #{week}"

    self.instance_eval("@arr#{week.to_s}")[day]  ?'selectedCell':''
  end

  def week_change()
    @week = params[:w]
    cookies.permanent[:week] = @week
  end



end
