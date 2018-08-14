require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/bookclass.rb')
require_relative('../models/members.rb')
require_relative('../models/gymclass.rb')

also_reload('../models/*')



get '/bookings' do
  @booking = Booking.all()
  erb (:"bookings/index")
end
