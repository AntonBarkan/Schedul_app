require 'sinatra'
require 'rubygems'
require 'google_calendar_oauth2'

client = GoogleCalendar::Client.new "688144363652-brriul4ifu7rubps2hspt2c1ujhdth87.apps.googleusercontent.com", "ol6yRPwEtD0g_dN94jzNemo0", "http://localhost:4567/oauth2callback"

before do
  unless GoogleCalendar.connection.authorization.access_token || request.path_info =~ /^\/oauth2/
    redirect client.redirect_to
  end 
end

get '/oauth2callback' do
  GoogleCalendar.connection.authorization.code = params['code']
  GoogleCalendar.connection.authorization.fetch_access_token!
  redirect '/create_event'
end

puts GoogleCalendar::Calendar.list
